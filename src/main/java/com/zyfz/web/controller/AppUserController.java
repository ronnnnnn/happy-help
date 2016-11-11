package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IUserservice;
import com.zyfz.service.impl.PasswordHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-11-11.
 */
@RequestMapping("/api/user")
@Controller
public class AppUserController extends BaseController {
    @Resource
    IUserservice userservice;

    @Resource
    PasswordHelper passwordHelper;

    /**
     * App注册用户
     * @param user
     * @return 返回系统随机生成的7位用户名
     */
    @RequestMapping(value = "/reg/v1",method = RequestMethod.POST)
    @ResponseBody
    public void registerUser(User user, HttpServletResponse response){
        ResponseMessage<String> responseMessage = new ResponseMessage<String>();
        try {
            User safeUsername = new User();
            String musername = "";
            do {
                int randomNum = (int)((Math.random()*9+1)*1000000);
                musername = String.valueOf(randomNum);
                safeUsername = userservice.findByUsername(musername);
            }while (safeUsername != null);

            user.setUsername(musername);

            User safePhone = userservice.findByPhone(user.getPhone());
            if(safePhone != null){
                responseMessage.setCode(40101);
                responseMessage.setMessage("failure");
                responseMessage.setResult("null");
                super.writeJson(responseMessage,response);
            }else {
                passwordHelper.encryptPassword(user);
                userservice.save(user);
                responseMessage.setCode(0);
                responseMessage.setMessage("success");
                responseMessage.setResult(user.getUsername());
                super.writeJson(responseMessage,response);
            }
        }catch (Exception e){
            responseMessage.setCode(50101);
            responseMessage.setMessage("failure");
            responseMessage.setResult("null");
           super.writeJson(responseMessage,response);
        }
    }


}
