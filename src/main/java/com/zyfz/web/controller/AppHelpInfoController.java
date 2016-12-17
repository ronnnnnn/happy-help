package com.zyfz.web.controller;

import com.zyfz.alipay.util.UtilDate;
import com.zyfz.domain.*;
import com.zyfz.miPush.thread.MyTask;
import com.zyfz.miPush.thread.ThreadPoolCore;
import com.zyfz.model.*;
import com.zyfz.service.*;
import com.zyfz.service.impl.PushTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by ron on 16-11-19.
 */
@Controller
public class AppHelpInfoController extends BaseController{

    @Resource
    IUserservice userservice;

    @Resource
    IHelpInfoService helpInfoService;

    @Resource
    ICategoryService categoryService;

    @Resource
    ISettingService settingService;

    @Resource
    IMoneyRecordService moneyRecordService;

    @Resource
    IOrderRecordService orderRecordService;

    @Resource
    IPushService pushService;

    @Resource
    IPlatformRecordService platformRecordService;

    @Resource
    IHelpInfoContractService helpInfoContractService;

    @Resource
    ThreadPoolTaskExecutor threadPool;

    @RequestMapping(value = "/api/v1/helpInfo",method = RequestMethod.POST)
    public void addHelpInfo(@ModelAttribute  AppHelpInfoModel appHelpInfoModel, HttpServletRequest request, HttpServletResponse response){
        try {

            HelpInfo helpInfo = new HelpInfo();
            /**
             * 处理图片
             */
            List<String> imageUrl = new ArrayList<String>();
            MultipartFile[] multipartFiles = appHelpInfoModel.getImages();
            String mimageUrl = null;
            if (multipartFiles != null){
                for (MultipartFile multipartFile : multipartFiles){
                    String imageUrlName = super.saveUploadFile(request,multipartFile,"helpInfo","jpg");
                    imageUrl.add(imageUrlName);
                }
                mimageUrl = StringUtils.collectionToDelimitedString(imageUrl,",");
            }else {
                mimageUrl = "none";
            }
            User mUser = userservice.findByUsername(appHelpInfoModel.getUsername());
            helpInfo.setImageUrl(mimageUrl);
            helpInfo.setHhCategoryId(categoryService.getByCategoryName(appHelpInfoModel.getCategoryName()).getId());
            helpInfo.setHhUserId(mUser.getId());
            helpInfo.setContext(appHelpInfoModel.getAssistanceContent());
            helpInfo.setProvince(appHelpInfoModel.getProvince());
            helpInfo.setCity(appHelpInfoModel.getCity());
            helpInfo.setArea(appHelpInfoModel.getArea());
            helpInfo.setDetailPosition(appHelpInfoModel.getContactAddress());
            helpInfo.setPhome(appHelpInfoModel.getContactPhone());
            helpInfo.setNeedUserNumber(Integer.valueOf(appHelpInfoModel.getMaxPersons()));
            helpInfo.setAreaRange(appHelpInfoModel.getRange());
            SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            //Date date = new Date();
            Date date = sim.parse(sim.format(new Date()));
            helpInfo.setCreateTime(date);

            int lastHelpInfoId = helpInfoService.save(helpInfo);


            //处理推送
            Push push = null;
            if (appHelpInfoModel.getRange().intern() == "全国".intern()){
                push = new Push();
            } else if (appHelpInfoModel.getRange().intern() == "省".intern()){
                push = new Push(appHelpInfoModel.getProvince(),null,null,null);
            } else if (appHelpInfoModel.getRange().intern() == "市".intern()){
                push = new Push(appHelpInfoModel.getProvince(),appHelpInfoModel.getCity(),null,null);
            } else if (appHelpInfoModel.getRange().intern() == "区".intern()){
                push = new Push(appHelpInfoModel.getProvince(),appHelpInfoModel.getCity(),appHelpInfoModel.getArea(),null);
            }
            //推送的内容
            AppPushModel appPushModel = new AppPushModel("紧急求助消息",appHelpInfoModel.getAssistanceContent(),"test");
            //推送对象
            List<Push> pushes = pushService.selectByRange(push);
            //附带值
            String helpInfoId = String.valueOf(lastHelpInfoId);
            //推送任务
            PushTask pushTask = new PushTask(appHelpInfoModel.getCategoryName(),appPushModel,pushes,helpInfoId,mUser.getId());
            //加入线程池
            threadPool.execute(pushTask);

            //处理转账
            if (mUser.getIsNew() != null && mUser.getIsNew() == true){//新用户不扣款
                mUser.setIsNew(false);
            } else {
                Double afterMoney = mUser.getAccount() - Double.valueOf(appHelpInfoModel.getMoney());
                mUser.setAccount(afterMoney);
                if (afterMoney < 0){
                    Map<String,String> map = new HashMap<String, String>();
                    map.put("MSG","余额不足!");
                    super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
                    return;
                }
            }
            userservice.update(mUser);


            //记录订单
            String tradeNo = UtilDate.getOrderNum();
            OrderRecord orderRecord = new OrderRecord(  null,
                                                        tradeNo,
                                                       "紧急求助",
                                                        appHelpInfoModel.getRange(),
                                                        mUser.getUsername(),
                                                        "",
                                                        Double.valueOf(appHelpInfoModel.getMoney()),
                                                        lastHelpInfoId,
                                                        "系统收入",
                                                        new Date(),
                                                        true,
                                                        null);
            orderRecordService.save(orderRecord);

            //记录平台收入
            PlatformRecord platformRecord = new PlatformRecord(  "helpInfo",
                                                                 "收入",
                                                                 lastHelpInfoId,
                                                                 mUser.getId(),
                                                                 Double.valueOf(appHelpInfoModel.getMoney()),
                                                                 "推送消息服务费",
                                                                 new Date(),
                                                                 null);
            platformRecordService.save(platformRecord);


            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","成功返回!");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","系统内部错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/helpInfo-list",method = RequestMethod.GET)
    public void getHelpInfoList(@RequestParam(value = "userId",required = false)Integer userId,
                                @RequestParam(value ="pn",required = false)Integer pn,
                                @RequestParam(value ="categoryName",required = false)String categoryName,
                                @RequestParam(value ="isCompeleted",required = false)Boolean isCompeleted,
                                @RequestParam(value ="isDeleted",required = false)Boolean isDeleted,
                                @RequestParam(value ="city",required = false)String city,
                                HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null || pn == 0){
                pageModel = new PageModel(1,5);
            } else {
                pageModel = new PageModel(pn,5);
            }
            HelpInfo helpInfo = new HelpInfo();
            if (userId != null && userId != 0){
                helpInfo.setHhUserId(userId);
            }
            if (categoryName != null){
                try {
                    helpInfo.setHhCategoryId(categoryService.getByCategoryName(categoryName).getId());
                }catch (Exception e){
                    Map<String,String> map = new HashMap<String, String>();
                    map.put("MSG","无此类别!");
                    super.writeJson(new ResponseMessage<Map<String,String>>(401201,"无此类别!",map),response);
                }
            }
            if (city != null){
                helpInfo.setCity(city);
            }
            if (isCompeleted != null){
                helpInfo.setIsCompeleted(isCompeleted);
            }
            if (isDeleted != null){
                helpInfo.setIsDeleted(isDeleted);
            } else {
                helpInfo.setIsDeleted(false);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",helpInfoService.selectAllWithParam(pageModel,helpInfo)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","系统内部错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }

    }

    @RequestMapping(value = "/api/v1/anon/help/users",method = RequestMethod.GET)
    public void getUserList(@RequestParam("emergencyId")Integer emergencyId,HttpServletResponse response){
        try {
            List<HelpContract> helpContracts = helpInfoContractService.selectByHelpInfo(emergencyId);
            Datagrid datagrid = new Datagrid((long) helpContracts.size(),helpContracts);
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",datagrid),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    /**
     * 愿意进行帮助的用户操作
     * @param response
     */
    @RequestMapping(value = "/api/v1/help/visitor-handle",method = RequestMethod.POST)
    public void visitorHandle(@RequestParam("emergencyId")Integer emergencyId,
                              @RequestParam("userId")Integer userId,
                              HttpServletResponse response){
        try{
            HelpContract helpContract = helpInfoContractService.selectByHelpInfoAndUserV1(new HelpContract(userId,emergencyId));
            //订单为空,第一次请求帮助
            if (helpContract == null){
                HelpContract helpContract1 = new HelpContract(  0,
                                                                userId,
                                                                emergencyId,
                                                                new Date());
                helpInfoContractService.save(helpContract1);
            } else if (helpContract.getStatus() == 1){
                helpContract.setStatus(2);
                helpInfoContractService.update(helpContract);
            }

            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/help/publish-handle",method = RequestMethod.POST)
    public void pulishHandler(
            @RequestParam("emergencyId")Integer emergencyId,
            @RequestParam("userId")Integer userId,
            HttpServletResponse response){
        try {
            HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(emergencyId));
            HelpContract helpContract = helpInfoContractService.selectByHelpInfoAndUserV1(new HelpContract(userId,emergencyId));
            if (helpContract.getStatus() == 0){
                helpContract.setStatus(1);
            } else if (helpContract.getStatus() == 2){
                helpInfo.setIsCompeleted(true);
                helpInfoService.update(helpInfo);
                helpContract.setStatus(3);
            }
            helpInfoContractService.update(helpContract);
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }


    @RequestMapping(value = "/api/v1/anon/target/help-info",method = RequestMethod.GET)
    public void getTargetHelpInfo(@RequestParam("TargetId")Integer TargetId, HttpServletResponse response){
        try {
            super.writeJson(new ResponseMessage<HelpInfo>(0,"success",helpInfoService.getOneById(new HelpInfo(TargetId))),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }
}
