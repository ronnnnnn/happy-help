package com.zyfz.web.controller;

import com.zyfz.domain.SystemMessage;
import com.zyfz.domain.TaskContract;
import com.zyfz.domain.TaskInfo;
import com.zyfz.domain.TaskTradeRecord;
import com.zyfz.global.SystemMessageString;
import com.zyfz.global.TaskTrade;
import com.zyfz.model.AppTaskInfoModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.*;
import org.springframework.stereotype.Controller;
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
     * 有偿接受请求,无偿接受请求,有偿提价请求
     */
    @RequestMapping(value = "/api/v1/taskInfo/accept",method = RequestMethod.POST)
    public void acceptTask(@RequestBody TaskContract taskContract, HttpServletResponse response){
       try {
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
                   SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(), SystemMessageString.ALL_USE_TITLE,SystemMessageString.UP_PRICE_MESSAGE,String.valueOf(taskContract.getHhTaskInfoId()));
                   systemMessageService.save(systemMessage);
               }else { //其他情况进行帮助,无偿和有偿接受,消息提醒,让用户进行同意
                   SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(), SystemMessageString.ALL_USE_TITLE,SystemMessageString.ACCEPT_MESSAGE,String.valueOf(taskContract.getHhTaskInfoId()));
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
                * 处理消息,让用户
                */
               SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(),SystemMessageString.ALL_USE_TITLE,SystemMessageString.UP_PRICE_MESSAGE,String.valueOf(taskContract.getHhTaskInfoId()));
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
                * 处理消息
                */
               SystemMessage systemMessage = new SystemMessage("taskInfo",mtaskInfo.getHhUserId(),new Date(),SystemMessageString.ALL_USE_TITLE,SystemMessageString.ING_MESSAGE,String.valueOf(taskContract.getHhTaskInfoId()));
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

    @RequestMapping(value = "/api/v1/anon/taskContract",method = RequestMethod.GET)
    public void getTaskContract(@RequestParam(value = "userId",required = false)Integer pn,@RequestParam(value = "assistanceId",required = true)Integer assistanceId,HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null || pn == 0){
                pageModel = new PageModel(1,5);
            }else{
                pageModel = new PageModel(pn,5);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",taskContractService.getByTaskInfoId(assistanceId,pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"请求失败!",map),response);
        }
    }
}
