package com.zyfz.web.controller;

import com.zyfz.domain.TaskInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ITaskInfoService;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
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

    @RequestMapping(value = "/api/v1/anon/taskInfo",method = RequestMethod.GET)
    public void getTaskInfo(@RequestParam("assistanceStatus") Integer assistanceStatus, @RequestParam(value = "categoryId",required = false)Integer categoryId,@RequestParam(value = "username",required = false)String username, @RequestParam(value = "pn",required = false)Integer pn, HttpServletResponse response){

        try {
            TaskInfo taskInfo = new TaskInfo();
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

}
