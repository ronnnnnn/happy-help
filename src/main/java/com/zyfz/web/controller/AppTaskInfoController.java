package com.zyfz.web.controller;

import com.zyfz.domain.TaskInfo;
import com.zyfz.model.AppTaskInfoModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.ITaskInfoService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StringMultipartFileEditor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value = "/api/v1/anon/taskInfo",method = RequestMethod.GET)
    public void getTaskInfo(@RequestParam("assistanceStatus") Integer assistanceStatus,
                            @RequestParam(value = "categoryId",required = false)Integer categoryId,
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

            if(categoryId != null){
                taskInfo.setHhCategoryId(categoryId);
            }else  {
                try {
                    taskInfo.setHhUserId(userservice.findByUsername(username).getId());
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
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",taskInfoService.getTaskInfoWithUserByCategoryAndStatus(taskInfo,pageModel)),response);

        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"系统内部错误",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/anon/taskInfo",method = RequestMethod.POST)
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
            taskInfo.setMoney(Double.valueOf(appTaskInfoModel.getMoney()));
            taskInfo.setHhUserId(userservice.findByUsername(appTaskInfoModel.getUsername()).getId());
            taskInfo.setHhCategoryId(categoryService.getByCategoryName(appTaskInfoModel.getCategoryName()).getId());
            taskInfoService.save(taskInfo);
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","添加成功！");
            super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50401,"系统内部错误",map),response);
        }


    }

}
