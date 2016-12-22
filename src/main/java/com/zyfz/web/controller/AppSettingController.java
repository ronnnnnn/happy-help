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
        settingV2(response,systemType);
    }

    @RequestMapping(value = "/api/v1/anon/service/fee",method = RequestMethod.GET)
    public void getFee(HttpServletResponse response){
        setting(response,"普通求助","手续费");
    }


    @RequestMapping(value = "/api/v1/anon/general",method = RequestMethod.GET)
    public void general(HttpServletResponse response,@RequestParam("type")String type,@RequestParam("name")String name){
        setting(response,type,name);
    }

    @RequestMapping(value = "/api/v1/anon/prize/rule",method = RequestMethod.GET)
    public void getPrizeRule(HttpServletResponse response){
        setting(response,"奖池","奖池规则");
    }

    @RequestMapping(value = "/api/v1/anon/top/fee",method = RequestMethod.GET)
    public void getTopMsg(HttpServletResponse response){
        settingV2(response,"置顶费用");
    }

    private void setting(HttpServletResponse response,String type,String valueName){
        try {
            super.writeJson(new ResponseMessage<Setting>(0,"success",settingService.selectBySysTypeAndTypeName(new Setting(type,valueName))),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","阿郎了");
            super.writeJson(new ResponseMessage<Map<String,String>>(50501,"请求失败",map),response);
        }
    }

    private void settingV2(HttpServletResponse response,String type){
        try {
            super.writeJson(new ResponseMessage<List<Setting>>(0,"success",settingService.getSettingsBySysType(type)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","阿郎了");
            super.writeJson(new ResponseMessage<Map<String,String>>(50501,"请求失败",map),response);
        }
    }
}
