package com.zyfz.web.controller;

import com.zyfz.domain.Push;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IPushService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-12-6.
 */
@Controller
public class AppPushController extends BaseController {

    @Resource
    IPushService pushService;

    @RequestMapping(value = "/api/v1/anon/push",method = RequestMethod.POST)
    public void updatePush(Push push, HttpServletResponse response){
        try {
            Push mPush = new Push();
            String alias = push.getAlias();
            if (alias != null){
                mPush.setHhUserId(Integer.valueOf(alias));
                mPush.setAlias(alias);
                if (push.getTopic() != null){
                    mPush.setTopic(push.getTopic());
                }
                pushService.save(mPush);
            } else if (push.getHhUserId() != null){
                Push mPush2 = pushService.selectByUserId(push.getHhUserId());
                if (push.getProvince() != null){
                    mPush2.setProvince(push.getProvince());
                }
                if (push.getCity() != null){
                    mPush2.setCity(push.getCity());
                }
                if (push.getArea() != null){
                    mPush2.setArea(push.getArea());
                }
                if (push.getStreet() != null){
                    mPush2.setStreet(push.getStreet());
                }
                pushService.update(mPush2);
            }
            super.writeJson(new ResponseMessage<String>(0,"success!","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败!",map),response);
        }

    }
}
