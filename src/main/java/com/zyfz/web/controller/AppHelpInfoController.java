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

    @Resource
    ISystemMessageService systemMessageService;


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

            //处理消息,
            SystemMessage systemMessage = new SystemMessage("helpinfo-push",
                    mUser.getId(),
                    new Date(),
                    "紧急求助消息",
                    "您发布的紧急求助("+appHelpInfoModel.getAssistanceContent()+")已经推送成功",
                    helpInfoId);
            systemMessageService.save(systemMessage);

            //处理消息,金额变动提醒
            SystemMessage systemMessage2 = new SystemMessage("userAccount",
                    mUser.getId(),
                    new Date(),
                    "金额变动",
                    "账户金额变动(紧急求助扣款)",
                    helpInfoId);
            systemMessageService.save(systemMessage2);


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
    public void getHelpInfoList(@RequestParam(value ="userId",required = false)Integer userId,
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
        HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(emergencyId));
        if(helpInfo.getIsDeleted() == true){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","改求助已下架!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
            return;
        }
        User user = userservice.getOneById(new User(userId));
        List<Integer> pageMsg = new ArrayList<Integer>();
        pageMsg.add(emergencyId);
        pageMsg.add(userId);
        try{
            HelpContract helpContract = helpInfoContractService.selectByHelpInfoAndUserV1(new HelpContract(userId,emergencyId));
            //订单为空,第一次请求帮助
            if (helpContract == null){
                HelpContract helpContract1 = new HelpContract(  0,
                                                                userId,
                                                                emergencyId,
                                                                new Date());
                helpInfoContractService.save(helpContract1);
                //处理消息,
                SystemMessage systemMessage = new SystemMessage("helpinfo",
                        helpInfo.getHhUserId(),
                        new Date(),
                        "紧急求助消息",
                        "您发布的紧急求助("+helpInfo.getContext()+"),"+user.getNickname()+"("+user.getUsername()+")"+"请求进行帮助.",
                        StringUtils.collectionToDelimitedString(pageMsg,","));
                systemMessageService.save(systemMessage);
            } else if (helpContract.getStatus() == 1){
                helpContract.setStatus(2);
                helpInfoContractService.update(helpContract);
                //处理消息,
                SystemMessage systemMessage = new SystemMessage("helpinfo",
                        helpInfo.getHhUserId(),
                        new Date(),
                        "紧急求助消息",
                        "您发布的紧急求助("+helpInfo.getContext()+"),"+user.getNickname()+"("+user.getUsername()+")"+"已经完成任务.",
                        StringUtils.collectionToDelimitedString(pageMsg,","));
                systemMessageService.save(systemMessage);
            }

            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    /**
     * 发布者操作
     * @param emergencyId
     * @param userId    帮助者ID
     * @param response
     */
    @RequestMapping(value = "/api/v1/help/publish-handle",method = RequestMethod.POST)
    public void pulishHandler(
            @RequestParam("emergencyId")Integer emergencyId,
            @RequestParam("userId")Integer userId,
            HttpServletResponse response){

        HelpInfo mHelpInfo = helpInfoService.getOneById(new HelpInfo(emergencyId));
        User publishUser = userservice.getOneById(new User(mHelpInfo.getHhUserId()));
        User visitorUser = userservice.getOneById(new User(userId));
        List<Integer> pageMsg = new ArrayList<Integer>();
        pageMsg.add(emergencyId);
        pageMsg.add(userId);

        try {
            HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(emergencyId));
            HelpContract helpContract = helpInfoContractService.selectByHelpInfoAndUserV1(new HelpContract(userId,emergencyId));
            if (helpContract.getStatus() == 0){
                helpContract.setStatus(1);
                //处理消息,推给帮助者
                SystemMessage systemMessage = new SystemMessage("helpinfo",
                        visitorUser.getId(),
                        new Date(),
                        "紧急求助消息",
                        "您愿意帮助紧急求助("+mHelpInfo.getContext()+"),"+publishUser.getNickname()+"("+publishUser.getUsername()+")"+"同意您进行帮助.",
                        StringUtils.collectionToDelimitedString(pageMsg,","));
                systemMessageService.save(systemMessage);
            } else if (helpContract.getStatus() == 2){
//                helpInfo.setIsCompeleted(true);
//                helpInfoService.update(helpInfo);
                helpContract.setStatus(3);

                //处理消息,推给帮助者
                SystemMessage systemMessage = new SystemMessage("helpinfo",
                        visitorUser.getId(),
                        new Date(),
                        "紧急求助消息",
                        "您愿意帮助紧急求助("+mHelpInfo.getContext()+"),"+publishUser.getNickname()+"("+publishUser.getUsername()+")"+"已确认完成.",
                        StringUtils.collectionToDelimitedString(pageMsg,","));
                systemMessageService.save(systemMessage);

                //
                Double addScore = 1d;
                try {
                    addScore = Double.valueOf(settingService.selectBySysTypeAndTypeName(new Setting("荣誉榜分数","紧急求助")).getTypeValue());
                }catch (Exception e){
                    e.printStackTrace();
                }
                User user = userservice.getOneById(new User(userId));
                Double finalScore = user.getHonerScore() + addScore;
                user.setHonerScore(finalScore);
                userservice.update(user);
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

    @RequestMapping(value = "/api/v1/help-info",method = RequestMethod.DELETE)
    public void deleteHelpInfo(@RequestParam("id") Integer id,HttpServletResponse response){
        try {
            HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(id));
            helpInfo.setIsDeleted(true);
            helpInfo.setIsCompeleted(true);
            helpInfoService.update(helpInfo);

            List<HelpContract> helpContracts = helpInfoContractService.selectByHelpInfo(id);
            if (helpContracts != null) {
                for (HelpContract helpContract : helpContracts) {
                    helpContract.setStatus(4);
                    helpInfoContractService.update(helpContract);
                    List<Integer> pageMsg = new ArrayList<>();
                    pageMsg.add(helpInfo.getId());
                    pageMsg.add(helpContract.getHhUserId());

                    //处理消息
                    SystemMessage systemMessage = new SystemMessage("helpinfo",
                            helpContract.getHhUserId(),
                            new Date(),
                            "紧急求助消息状态",
                            "您帮助的:\"" + helpInfo.getContext() + "\",已经被取消",
                            StringUtils.collectionToDelimitedString(pageMsg,","));
                    systemMessageService.save(systemMessage);
                }
            }
            //进行退款
            Setting setting = settingService.selectBySysTypeAndTypeName(new Setting("紧急求助","扣款比例"));
            Setting fee1 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","全国"));
            Setting fee2 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","省"));
            Setting fee3 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","市"));
            Setting fee4 = settingService.selectBySysTypeAndTypeName(new Setting("推送范围","区"));
            Double percent = 0d;
            if (setting != null){
                percent = Double.valueOf(setting.getTypeValue());
            }
            User user = userservice.getOneById(new User(helpInfo.getHhUserId()));
            Double myFeere = 0d;
            if ( fee1 != null && helpInfo.getAreaRange().intern()=="全国".intern() ){
                myFeere = Double.valueOf(fee1.getTypeValue());
            }else if (fee2 != null && helpInfo.getAreaRange().intern()=="省".intern() ){
                myFeere = Double.valueOf(fee2.getTypeValue());
            }else if (helpInfo.getAreaRange().intern()=="市".intern() && fee3 != null){
                myFeere = Double.valueOf(fee3.getTypeValue());
            }else if (helpInfo.getAreaRange().intern()=="区".intern() && fee4 != null){
                myFeere = Double.valueOf(fee4.getTypeValue());
            }
            Double returnMoney = ((100-percent)/100)*myFeere;
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

            super.writeJson(new ResponseMessage<String>(0,"success",""),response);
        }catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/republish",method = RequestMethod.PATCH)
    public void republishHelpInfo(@RequestParam("id")Integer id,HttpServletResponse response){
        try {
            HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(id));
            helpInfo.setIsDeleted(false);
            helpInfo.setIsCompeleted(false);
            Integer republishTime = helpInfo.getRepublishTimes() + 1;
            helpInfo.setRepublishTimes(republishTime);
            helpInfo.setCreateTime(new Date());
            helpInfoService.update(helpInfo);
            List<HelpContract> helpContracts = helpInfoContractService.selectByHelpInfo(id);
            for (HelpContract helpContract : helpContracts){
                helpInfoContractService.deleteOneById(helpContract);
                //处理消息
                List<Integer> pageMSG = new ArrayList<>();
                pageMSG.add(helpInfo.getId());
                pageMSG.add(helpContract.getHhUserId());
                SystemMessage systemMessage = new SystemMessage("helpinfo",
                        helpContract.getHhUserId(),
                        new Date(),
                        "紧急求助消息状态",
                        "您帮助的:\"" + helpInfo.getContext() + "\",已经被取消",
                        StringUtils.collectionToDelimitedString(pageMSG,","));
                systemMessageService.save(systemMessage);
            }

            //再次进行推送
            //推送的内容
            AppPushModel appPushModel = new AppPushModel("紧急求助消息",helpInfo.getContext(),"test");
            //推送对象
            //处理推送
            Push push = null;
            if (helpInfo.getAreaRange().intern() == "全国".intern()){
                push = new Push();
            } else if (helpInfo.getAreaRange().intern() == "省".intern()){
                push = new Push(helpInfo.getProvince(),null,null,null);
            } else if (helpInfo.getAreaRange().intern() == "市".intern()){
                push = new Push(helpInfo.getProvince(),helpInfo.getCity(),null,null);
            } else if (helpInfo.getAreaRange().intern() == "区".intern()){
                push = new Push(helpInfo.getProvince(),helpInfo.getCity(),helpInfo.getArea(),null);
            }
            List<Push> pushes = pushService.selectByRange(push);
            //附带值
            String helpInfoId = String.valueOf(id);
            //推送任务
            Category category = new Category();
            category.setId(helpInfo.getHhCategoryId());
            String categoryName = categoryService.getOneById(category).getCategoryName();
            PushTask pushTask = new PushTask(categoryName,appPushModel,pushes,helpInfoId,helpInfo.getHhUserId());
            //加入线程池
            threadPool.execute(pushTask);
            super.writeJson(new ResponseMessage<String>(0,"success",""),response);
        }catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/helpinfo/detail",method = RequestMethod.GET)
    public void getHelpInfoDetail(@RequestParam("messageId")Integer messageId,HttpServletResponse response){
        try {
            SystemMessage systemMessage = systemMessageService.getOneById(new SystemMessage(messageId));
            systemMessage.setIsRead(true);
            systemMessageService.update(systemMessage);
            String[] pageMsg = systemMessage.getPagemessage().split(",");
            super.writeJson(new ResponseMessage<HelpInfo>(0,"success",helpInfoService.selectByUniq(Integer.valueOf(pageMsg[0]))),response);
        } catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }


    @RequestMapping(value = "/api/v1/helpInfo/compeleted",method = RequestMethod.PATCH)
    public void compeleteHelpInfo(@RequestParam("id")Integer id,HttpServletResponse response){
        try {
            HelpInfo helpInfo = helpInfoService.getOneById(new HelpInfo(id));
            helpInfo.setIsCompeleted(true);
            helpInfoService.update(helpInfo);
            List<HelpContract> helpContracts = helpInfoContractService.selectByHelpInfo(id);
            for (HelpContract helpContract : helpContracts){
                if (helpContract.getStatus() == 2){
                    helpContract.setStatus(3);
                    helpInfoContractService.update(helpContract);
                }
            }
            super.writeJson(new ResponseMessage<String>(0,"success",""),response);
        }catch (Exception e){
            e.printStackTrace();
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","响应错误!");
            super.writeJson(new ResponseMessage<Map<String,String>>(501201,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/helpinfo/charge",method = RequestMethod.POST)
    public void chargeHelper(@RequestParam(value = "userId",required = false)Integer userId,
                             @RequestParam("userIdOfBagaining")Integer userIdOfBagaining,
                             @RequestParam("starCount")Integer starCount,
                             HttpServletResponse  response){
        try {
            Setting setting = settingService.selectBySysTypeAndTypeName(new Setting("紧急求助","评星分数"));
            Double value = 2d;
            if (setting != null){
                value = Double.valueOf(setting.getTypeValue());
            }
            User helper = userservice.getOneById(new User(userIdOfBagaining));
            Double fianlScore = helper.getHonerScore() + starCount*value;
            helper.setHonerScore(fianlScore);
            helper.setGradeTotal(helper.getGradeTotal()+Double.valueOf(starCount));
            helper.setGradeTimes(helper.getGradeTimes()+1);
            userservice.update(helper);
            super.writeJson(new ResponseMessage<String>(0,"success!",""),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }
}
