package com.zyfz.web.controller;

import com.zyfz.domain.Setting;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ISettingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-11-19.
 */
@Controller
public class AppSettingController extends BaseController{
    @Resource
    ISettingService settingService;

    @RequestMapping(value = "/api/v1/anon/setting",method = RequestMethod.GET)
    public void getSettingByType(@RequestParam("systemType") String systemType, HttpServletResponse response){
        try {
            super.writeJson(new ResponseMessage<List<Setting>>(0,"success",settingService.getSettingsBySysType(systemType)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","阿郎了");
            super.writeJson(new ResponseMessage<Map<String,String>>(50501,"系统内部错误",map),response);
        }
    }

}
