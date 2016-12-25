package com.zyfz.service.impl;

import com.zyfz.domain.HelpInfo;
import com.zyfz.domain.PlatformRecord;
import com.zyfz.domain.Setting;
import com.zyfz.domain.User;
import com.zyfz.service.IHelpInfoService;
import com.zyfz.service.IPlatformRecordService;
import com.zyfz.service.ISettingService;
import com.zyfz.service.IUserservice;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-12-15.
 */
@Component
@Scope("prototype")
public class HelpInfoStatusChangeTask implements Runnable{

    @Resource
    IHelpInfoService helpInfoService;

    @Resource
    ISettingService settingService;

    @Resource
    IUserservice userservice;

    @Resource
    IPlatformRecordService platformRecordService;

    private int count = 0;


    @Override
    public void run() {
        //自动完结没有人接受的订单
        Setting setting = settingService.selectBySysTypeAndTypeName(new Setting("紧急求助","扣款比例"));
        Setting fee1 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","全国"));
        Setting fee2 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","省"));
        Setting fee3 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","市"));
        Setting fee4 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","区"));
        Double percent = 0d;
        if (setting != null){
            percent = Double.valueOf(setting.getTypeValue());
        }
        List<HelpInfo> helpInfos = helpInfoService.selectByTime();
        for (HelpInfo helpInfo : helpInfos){
            if (helpInfo.getHelpContracts().size() == 0){
                helpInfo.setIsCompeleted(true);
                helpInfo.setIsDeleted(true);
                helpInfoService.update(helpInfo);
                count++;

                //进行退款
                User user = userservice.getOneById(new User(helpInfo.getHhUserId()));
                Double myFee = 0d;
                if (helpInfo.getAreaRange().intern() == "全国".intern() && fee1 != null){
                    myFee = Double.valueOf(fee1.getTypeValue());
                }else if (helpInfo.getAreaRange().intern() == "省".intern() && fee2 != null){
                    myFee = Double.valueOf(fee2.getTypeValue());
                }else if (helpInfo.getAreaRange().intern() == "市".intern() && fee3 != null){
                    myFee = Double.valueOf(fee3.getTypeValue());
                }else if (helpInfo.getAreaRange().intern() == "区".intern() && fee4 != null){
                    myFee = Double.valueOf(fee4.getTypeValue());
                }
                Double returnMoney = ((100-percent)/100)*myFee;
                Double finalMoney = returnMoney + user.getAccount();
                user.setAccount(finalMoney);
                userservice.update(user);
                //记录平台收支情况
                PlatformRecord platformRecord = new PlatformRecord( "helpInfoReturn",
                        "支出",
                        helpInfo.getId(),
                        user.getId(),
                        returnMoney,
                        "紧急求助失败,退还金额",
                        new Date(),
                        null);
                platformRecordService.save(platformRecord);

            }
        }

        System.out.println(Thread.currentThread().getName() + "已经执行:" +  count);

    }

}
