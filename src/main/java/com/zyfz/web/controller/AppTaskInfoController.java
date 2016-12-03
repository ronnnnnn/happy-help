package com.zyfz.web.controller;

import com.zyfz.alipay.util.UtilDate;
import com.zyfz.dao.TaskContractMapper;
import com.zyfz.domain.*;
import com.zyfz.global.SystemMessageString;
import com.zyfz.global.TaskTrade;
import com.zyfz.model.*;
import com.zyfz.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import static com.zyfz.global.SystemMessageString.*;

/**
 * Created by ron on 16-11-14.
 */
@Controller
public class AppTaskInfoController extends BaseController{

    @Resource
    ITaskInfoService taskInfoService;

    @Resource
    IUserservice userservice;

    @Resource
    ICategoryService categoryService;

    @Resource
    ITaskContractService taskContractService;

    @Resource
    ISystemMessageService systemMessageService;

    @Resource
    ITaskTradeRecordService taskTradeRecordService;

    @Resource
    TaskContractMapper taskContractMapper;

    @Resource
    IOrderRecordService orderRecordService;

    /**
     *
     * @param assistanceStatus 0为有偿求助列表，1为无偿求助列表, 2为综合，3为未帮助，4为帮助中，5为已帮助
     * @param categoryName
     * @param username
     * @param pn
     * @param province
     * @param city
     * @param response
     */
    @RequestMapping(value = "/api/v1/anon/taskInfo",method = RequestMethod.GET)
    public void getTaskInfo(@RequestParam("assistanceStatus") Integer assistanceStatus,
                            @RequestParam(value = "categoryName",required = false)String categoryName,
                            @RequestParam(value = "username",required = false)String username,
                            @RequestParam(value = "pn",required = false)Integer pn,
                            @RequestParam(value = "province",required = false)String province,
                            @RequestParam(value = "city",required = false)String city,
                            HttpServletResponse response){

        try {
            TaskInfo taskInfo = new TaskInfo();
            if (province != null ){
                taskInfo.setProvince(province);
            }

            if (city != null){
                taskInfo.setCity(city);
            }

            if(categoryName != null){
                Integer categoryId = categoryService.getByCategoryName(categoryName).getId();
                taskInfo.setHhCategoryId(categoryId);
            }else  {
                try {
                    if (username != null){
                        taskInfo.setHhUserId(userservice.findByUsername(username).getId());
                    }
                }catch (Exception e){
                    Map<String,String> map = new HashMap<String, String>();
                    map.put("errMsg","请求参数错误");
                    super.writeJson(new ResponseMessage<Map<String,String>>(40401,"请求参数错误",map),response);
                }
            }
            if (assistanceStatus == 0){
                taskInfo.setIsFree(false);
            } else if (assistanceStatus == 1){
                taskInfo.setIsFree(true);
            } else if(assistanceStatus == 3){
                taskInfo.setIsAccept(false);
            } else if(assistanceStatus ==4){
                taskInfo.setIsAccept(true);
                taskInfo.setIsCompeleted(false);
            } else if(assistanceStatus == 5){
                taskInfo.setIsCompeleted(true);
            }
            PageModel pageModel = new PageModel();
            if(pn == null){
                pageModel.setPage(1);
                pageModel.setRows(10);
            } else  {
                pageModel.setPage(pn);
                pageModel.setRows(10);
            }

            Datagrid datagrid = new Datagrid();
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",taskInfoService.getTaskInfoWithUserByCategoryAndStatus(taskInfo,pageModel)),response);

        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/taskInfo",method = RequestMethod.POST)
    public void addTaskInfo(AppTaskInfoModel appTaskInfoModel, HttpServletRequest request,HttpServletResponse response){
        try {
            TaskInfo taskInfo = new TaskInfo();
            /**
             * 处理图片
             */
            List<String> imageUrl = new ArrayList<String>();
            MultipartFile[] multipartFiles = appTaskInfoModel.getImages();
            String mimageUrl = null;
            if (multipartFiles != null){
                for (MultipartFile multipartFile : multipartFiles){
                    String imageUrlName = super.saveUploadFile(request,multipartFile,"taskinfo","jpg");
                    imageUrl.add(imageUrlName);
                }
                mimageUrl = StringUtils.collectionToDelimitedString(imageUrl,",");
            }else {
                mimageUrl = "nono";
            }

            taskInfo.setImageUrl(mimageUrl);
            taskInfo.setProvince(appTaskInfoModel.getProvince());
            taskInfo.setCity(appTaskInfoModel.getCity());
            taskInfo.setArea(appTaskInfoModel.getArea());
            taskInfo.setStreet(appTaskInfoModel.getStreet());
            taskInfo.setContext(appTaskInfoModel.getAssistanceContent());
            if(appTaskInfoModel.getAssistanceType() == 0){
                taskInfo.setIsFree(false);
            }
            if(appTaskInfoModel.getAssistanceType() == 1){
                taskInfo.setIsFree(true);
            }
            taskInfo.setPhone(appTaskInfoModel.getContactPhone());
            if(appTaskInfoModel.getMoney().intern() == "".intern()){
                taskInfo.setMoney(0d);
            }else {
                taskInfo.setMoney(Double.valueOf(appTaskInfoModel.getMoney()));
            }

            taskInfo.setHhUserId(userservice.findByUsername(appTaskInfoModel.getUsername()).getId());
            taskInfo.setHhCategoryId(categoryService.getByCategoryName(appTaskInfoModel.getCategoryName()).getId());
            taskInfoService.save(taskInfo);
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","添加成功！");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }

    /**
     * 有偿接受请求,无偿接受请求,有偿提价请求(用户行为)
     */
    @RequestMapping(value = "/api/v1/taskInfo/accept",method = RequestMethod.POST)
    public void acceptTask(@RequestBody TaskContract taskContract, HttpServletResponse response){
       try {

           /**
            * 存储pageMeassge
            */
           List<Integer> pageMessages = new ArrayList<Integer>();
           pageMessages.add(taskContract.getHhTaskInfoId());
           pageMessages.add(taskContract.getHhUserId());
           String pageMessage = StringUtils.collectionToDelimitedString(pageMessages,",");

           /**
            * 获得帮助消息
            */
           TaskInfo taskInfo = new TaskInfo();
           taskInfo.setId(taskContract.getHhTaskInfoId());
           TaskInfo mtaskInfo = taskInfoService.getOneById(taskInfo);

           //处理订单
           TaskContract taskContract1 = taskContractService.getByHhUserIdAndTaskInfoId(taskContract);
           if ( taskContract1 == null){        //有偿无偿接受(有偿不提价)
               /**
                * 处理订单
                */
               taskContract.setCreateTime(new Date());
               taskContract.setTalkTimes(1);
               taskContractService.save(taskContract);

               /**
                *处理消息,推送给发布人
                */
               if (taskContract.getStatus() == 6){ //提价才进行帮助,第一次提价,消息提醒,让用户进行同意或者还价(根据taskinfo的status进行判断显示)
                   SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(), SystemMessageString.ALL_USE_TITLE,SystemMessageString.UP_PRICE_MESSAGE,pageMessage);
                   systemMessageService.save(systemMessage);
               }else { //其他情况进行帮助,无偿和有偿接受,消息提醒,让用户进行同意
                   SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(), SystemMessageString.ALL_USE_TITLE,SystemMessageString.ACCEPT_MESSAGE,pageMessage);
                   systemMessageService.save(systemMessage);
               }
               /**
                * 记录交易过程
                */
               TaskTradeRecord taskTradeRecord = new TaskTradeRecord(null,taskContract.getHhUserId(),TaskTrade.ASK_HELP,taskContract.getContent(),taskContract.getMoney(),new Date(),taskContract.getHhTaskInfoId());
               taskTradeRecordService.save(taskTradeRecord);


               super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
           }else if ((taskContract.getStatus() == 6) && taskContract1.getTalkTimes() < 3){ //有偿提价第二次
               /**
                * 处理订单
                */
               taskContract.setId(taskContract1.getId());
               taskContract.setTalkTimes((taskContract1.getTalkTimes()+1));
               taskContractService.update(taskContract);
               /**
                * 处理消息,推送给发布者
                */
               SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(),SystemMessageString.ALL_USE_TITLE,SystemMessageString.UP_PRICE_MESSAGE,pageMessage);
               systemMessageService.save(systemMessage);
               /**
                * 记录交易过程
                */
               TaskTradeRecord taskTradeRecord = new TaskTradeRecord(null,taskContract.getHhUserId(),TaskTrade.ASK_HELP_WITH_MONEY,taskContract.getContent(),taskContract.getMoney(),new Date(),taskContract.getHhTaskInfoId());
               taskTradeRecordService.save(taskTradeRecord);

               super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
           } else if (taskContract.getStatus() == 8 && taskContract1 != null){ //用户接受返价,帮助开始
                /**
                 * 更新taskInfo状态
                 */
               mtaskInfo.setIsAccept(true);
               taskInfoService.update(mtaskInfo);

               /**
                * 处理订单
                */
               taskContract1.setStatus(taskContract.getStatus());
               taskContract1.setContent(taskContract.getContent());
               taskContractService.update(taskContract1);

               /**
                * 处理消息,推送给发布者
                */
               SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(),SystemMessageString.ALL_USE_TITLE,SystemMessageString.ING_MESSAGE,pageMessage);
               systemMessageService.save(systemMessage);

               /**
                * 记录交易过程
                */
               TaskTradeRecord taskTradeRecord = new TaskTradeRecord(null,taskContract.getHhUserId(), TaskTrade.GUEST_ACCEPT,taskContract.getContent(),taskContract1.getMoney(),new Date(),taskContract.getHhTaskInfoId());
               taskTradeRecordService.save(taskTradeRecord);
               super.writeJson(new ResponseMessage<String>(0,"success","null"),response);

           }
       }catch (Exception e){
           Map<String,String> map = new HashMap<String, String>();
           map.put("errMsg",e.toString());
           super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
       }
    }

    @RequestMapping(value = "/api/v1/taskContract",method = RequestMethod.GET)
    public void getTaskContract(@RequestParam(value = "userId",required = false)Integer userId,@RequestParam(value = "pn",required = false)Integer pn,@RequestParam(value = "assistanceId",required = true)Integer assistanceId,HttpServletResponse response){
        try {

            /**
             * 未登录用户，不显示议价信息
             */
            if (userId == null || userId == 0){
                super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
            }
            /**
             * 如果当前用户是当前求助信息的所有者即（该信息发布者）则显示最新对该求助议价的用户信息列表
             *（包含每个用户对应的议价信息）
             */
            TaskInfo taskInfo = taskInfoService.getOneById(new TaskInfo(assistanceId));
            if (taskInfo.getHhUserId() == userId){
                PageModel pageModel = null;
                if (pn == null || pn == 0){
                    pageModel = new PageModel(1,5);
                }else{
                    pageModel = new PageModel(pn,5);
                }
                super.writeJson(new ResponseMessage<Datagrid>(0,"success",taskContractService.getByTaskInfoId(assistanceId,pageModel)),response);
            }
            /**
             * 如果当前是对该求助议价的用户，则只显示最新的议价信息
             */
            TaskContract taskContract = taskContractService.getByHhUserIdAndTaskInfoId(new TaskContract(null,null,null,assistanceId,null,null,userId,null,null));
            if (taskContract != null){
                super.writeJson(new ResponseMessage<TaskContract>(0,"success",taskContract),response);
            }


        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }

    /**
     * 点击信息后进入详情信息页
     * @param response
     */
    @RequestMapping(value = "/api/v1/detailMessage",method = RequestMethod.GET)
    public void getDetailMessage(@RequestParam(value = "messageId",required = true)Integer messageId,HttpServletResponse response){
        try {
            /**
             * 设置消息为已读
             */
            SystemMessage systemMessage = systemMessageService.getOneById(new SystemMessage(messageId));
            systemMessage.setIsRead(true);
            systemMessageService.update(systemMessage);

            /**
             * 获取求助消息
             */
            String[] pageMessages = systemMessage.getPagemessage().split(",");
            TaskInfo taskInfo = taskInfoService.getOneById(new TaskInfo(Integer.valueOf(pageMessages[0])));

            TaskContract taskContract = null;
            if (taskInfo.getHhUserId() == systemMessage.getHhuserid()){ //推送的对象为帮助消息发布者
                /**
                 * 获取议价信息
                 */
                taskContract = taskContractService.getByHhUserIdAndTaskInfoId(new TaskContract(Integer.valueOf(pageMessages[0]),Integer.valueOf(pageMessages[1])));
            } else { //推送对象为帮助接受者
                taskContract = taskContractService.getByHhUserIdAndTaskInfoId(new TaskContract(Integer.valueOf(pageMessages[0]),systemMessage.getHhuserid()));
            }

            AppTaskInfoAllModel appTaskInfoAllModel = new AppTaskInfoAllModel(taskInfo,taskContract);
            super.writeJson(new ResponseMessage<AppTaskInfoAllModel>(0,"successs",appTaskInfoAllModel),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }


    /**
     * 帮助消息发布者处理请求
     *  ++++++++++status状态++++++++++++++++
     1表示任务发布者同意其完成任务，
     3表示任务发布者确认完成任务。
     7表示发布者还价阶段
     9发布者接受议价 (双方达成共识,任务进行,隐含10属性)
     10表示任务发布者同意其完成任务
     12发布者确认完成任务
     13终止

     */
    @RequestMapping(value = "/api/v1/contract/handle",method = RequestMethod.POST)
    public void handleContract(AppTaskHandleModel appTaskHandleModel,HttpServletResponse response){

        try {
            TaskContract taskContract = taskContractService.getOneById(new TaskContract(appTaskHandleModel.getBargainingId()));
            TaskInfo taskInfo = taskInfoService.getOneById(new TaskInfo(taskContract.getHhTaskInfoId()));
            Integer status = appTaskHandleModel.getStatus();
            Integer oldStatus = taskContract.getStatus();
            /**
             * 表示任务发布者同意其完成任务(无偿任务和有偿)
             */
            if (((status == 1 && oldStatus == 0)|| (status == 9 && oldStatus == 6) || (status == 10 && oldStatus ==5)) && status != oldStatus){
                //处理普通消息
                taskInfo.setIsAccept(true);
                taskInfoService.update(taskInfo);
                //处理其他请求者,终止其他请求者
                List<TaskContract> taskContracts = taskContractMapper.selectByTaskInfoId(taskContract.getId());
                for (TaskContract taskContract1 : taskContracts){
                    if (taskContract1.getId() != taskContract.getId()){
                        //设置为终止态
                        taskContract1.setStatus(13);
                        taskContractService.update(taskContract1);
                        //发送消息
                        SystemMessage systemMessage = new SystemMessage("taskinfo",
                                taskContract1.getHhUserId(),
                                new Date(),
                                REQUEST_TITLE,
                                REJECT_CONTENT,
                                String.valueOf(taskContract.getHhTaskInfoId()));
                        systemMessageService.save(systemMessage);
                    }
                }
                //处理当前请求者
                taskContract.setStatus(status);
                if (appTaskHandleModel.getBargainingMoney() != null && appTaskHandleModel.getBargainingContent() != null){
                    taskContract.setMoney(appTaskHandleModel.getBargainingMoney());
                    taskContract.setContent(appTaskHandleModel.getBargainingContent());
                }else {
                    taskContract.setMoney(appTaskHandleModel.getBargainingMoney());
                    taskContract.setContent(appTaskHandleModel.getBargainingContent());
                }
                taskContractService.update(taskContract);
                //发布消息给当前请求者
                SystemMessage systemMessage = new SystemMessage("taskinfo",
                        taskContract.getHhUserId(),
                        new Date(),
                        REQUEST_TITLE,
                        AGREE_CONTENT,
                        String.valueOf(taskContract.getHhTaskInfoId()));
                systemMessageService.save(systemMessage);
                super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
            }

            /**
             * 发布者确认其完成
             */
            if(((status == 3 && oldStatus == 2) || (status == 12 && oldStatus == 11)) && status != oldStatus){
                //处理taskInfo
                if (taskInfo.getIsAccept() == true){
                    taskInfo.setIsCompeleted(true);
                    taskInfoService.update(taskInfo);
                } else {
                    super.writeJson(new ResponseMessage<String>(40403,"非法请求！",""),response);
                }
                //处理taskContract
                taskContract.setStatus(status);
                if(appTaskHandleModel.getBargainingContent() != null){
                    taskContract.setContent(appTaskHandleModel.getBargainingContent());
                }
                taskContractService.update(taskContract);

                //处理消息
                SystemMessage systemMessage = new SystemMessage("taskinfo",
                        taskContract.getHhUserId(),
                        new Date(),
                        REQUEST_TITLE,
                        COMPELETE_CONTENT,
                        String.valueOf(taskContract.getHhTaskInfoId()));
                systemMessageService.save(systemMessage);

                //记录订单记录
                String tradeNo = UtilDate.getOrderNum();
                String secondType = null;
                if (status == 3){
                    secondType = "free";
                }else if (status == 12){
                    secondType = "notFree";
                }

                OrderRecord orderRecord = new OrderRecord(
                        null,
                        tradeNo,
                        "taskInfo",
                        secondType,
                        String.valueOf(appTaskHandleModel.getUserIdOfBargaining()),
                        String.valueOf(appTaskHandleModel.getUserIdOfAssistance()),
                        taskContract.getMoney(),
                        taskContract.getHhTaskInfoId(),
                        null,
                        new Date()
                );

                orderRecordService.save(orderRecord);
                super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
            }

            /**
             * 发布者还价
             */
             if ((status == 7 && oldStatus == 6) && status != oldStatus){
                 //处理taskcontrct
                 taskContract.setStatus(status);
                 taskContract.setMoney(appTaskHandleModel.getBargainingMoney());
                 taskContract.setContent(appTaskHandleModel.getBargainingContent());
                 Integer times = taskContract.getTalkTimes() + 1 ;
                 taskContract.setTalkTimes(times);
                 taskContractService.update(taskContract);
                 //处理消息
                 SystemMessage systemMessage = new SystemMessage("taskinfo",
                         taskContract.getHhUserId(),
                         new Date(),
                         REQUEST_TITLE,
                         DOWN_PRICE_MESSAGE,
                         String.valueOf(taskContract.getHhTaskInfoId()));
                 systemMessageService.save(systemMessage);
                 super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
             }

            /**
             * 发布者终止交易
             */
            if (status == 13 && status != oldStatus){
                //处理taskcontrct
                taskContract.setStatus(status);
                taskContractService.update(taskContract);
                //处理消息
                SystemMessage systemMessage = new SystemMessage("taskinfo",
                        taskContract.getHhUserId(),
                        new Date(),
                        REQUEST_TITLE,
                        REJECT_CONTENT,
                        String.valueOf(taskContract.getHhTaskInfoId()));
                systemMessageService.save(systemMessage);
                super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
            }else if (status == oldStatus){
                super.writeJson(new ResponseMessage<String>(40402,"您已经进行过此操作了！","null"),response);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
