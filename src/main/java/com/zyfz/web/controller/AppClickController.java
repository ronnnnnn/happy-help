package com.zyfz.web.controller;

import com.zyfz.domain.UserClick;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IUserClickService;
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
 * Created by ron on 16-12-9.
 */
@Controller
public class AppClickController extends BaseController{
    @Resource
    IUserClickService userClickService;


    @RequestMapping(value = "/api/v1/click",method = RequestMethod.POST)
    public void click(@RequestParam("userId")Integer userId,
                      @RequestParam("gooddeedsId")Integer gooddeedsId,
                      HttpServletResponse response){
        try {
            UserClick userClick = userClickService.getByUserAndArticle(userId,gooddeedsId);
            if (userClick == null){
                UserClick userClick1 = new UserClick();
                userClick1.setUserId(userId);
                userClick1.setHhArticleId(gooddeedsId);
                userClickService.save(userClick1);
            } else {
                userClickService.deleteOneById(userClick);
            }
            super.writeJson(new ResponseMessage<List<UserClick>>(0,"success",userClickService.getByArticle(gooddeedsId)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(501101,"请求失败",map),response);
        }
    }
}
