package com.zyfz.service.impl;

import com.zyfz.domain.HelpContract;
import com.zyfz.domain.HelpInfo;
import com.zyfz.service.IHelpInfoService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-15.
 */
@Component
@Scope("prototype")
public class HelpInfoStatusChangeTask implements Runnable{

    @Resource
    IHelpInfoService helpInfoService;

    private int count;


    @Override
    public void run() {
        // TODO Auto-generated method stub

        List<HelpInfo> helpInfos = helpInfoService.selectByTime();
        for (HelpInfo helpInfo : helpInfos){
            if (helpInfo.getHelpContracts().size() == 0){
                helpInfo.setIsDeleted(true);
                helpInfoService.update(helpInfo);
                count++;
            }
        }

        System.out.println(Thread.currentThread().getName() + "已经执行:" +  count);

    }

}
