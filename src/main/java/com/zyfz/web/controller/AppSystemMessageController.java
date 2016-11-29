package com.zyfz.web.controller;

import com.zyfz.domain.SystemMessage;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ISystemMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-11-29.
 */
@Controller
public class AppSystemMessageController extends BaseController{

    @Resource
    ISystemMessageService systemMessageService;

    @RequestMapping(value = "/api/v1/message",method = RequestMethod.GET)
    public void getMessage(@RequestParam(value = "userId",required = true)Integer userId, @RequestParam(value = "pn",required = false)Integer pn, @RequestParam(value = "isRead",required = false)Boolean isRead, HttpServletResponse response){
        try {
            PageModel pageModel = null;
            if (pn == null){
                pageModel = new PageModel(1,5);
            }else {
                pageModel = new PageModel(pn,5);
            }
            SystemMessage systemMessage = new SystemMessage();
            systemMessage.setHhuserid(userId);
            if(isRead != null){
                systemMessage.setIsRead(isRead);
            }
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",systemMessageService.getByUserId(systemMessage,pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50701,"请求失败!",map),response);
        }
    }

}
