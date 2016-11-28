package com.zyfz.web.controller;

import com.github.pagehelper.PageHelper;
import com.zyfz.domain.Captcha;
import com.zyfz.domain.User;
import com.zyfz.model.AppUserInfoModel;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.ICaptchaService;
import com.zyfz.service.IUserservice;
import com.zyfz.service.impl.PasswordHelper;
import org.apache.ibatis.annotations.Param;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by ron on 16-11-11.
 */
@Controller
public class AppUserController extends BaseController {
    @Resource
    IUserservice userservice;

    @Resource
    PasswordHelper passwordHelper;

    @Resource
    ICaptchaService captchaService;
    /**
     * App注册用户
     * @param user
     * @return 返回系统随机生成的7位用户名
     */
    @RequestMapping(value = "/api/v1/user/reg",method = RequestMethod.POST)
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
                responseMessage.setMessage("该手机号已经被注册");
                responseMessage.setResult("null");
                super.writeJson(responseMessage,response);
            }else if (captchaService.selectByCaptcha(user.getCaptcha())!= null){
                //验证码使用使用过后删除验证码
                Captcha captcha = captchaService.selectByCaptcha(user.getCaptcha());
                captchaService.deleteOneById(captcha);

                passwordHelper.encryptPassword(user);
                userservice.save(user);
                responseMessage.setCode(0);
                responseMessage.setMessage("success");
                responseMessage.setResult(user.getUsername());
                super.writeJson(responseMessage,response);
            }else{
                responseMessage.setCode(40106);
                responseMessage.setMessage("验证码无效！");
                responseMessage.setResult("null");
                super.writeJson(responseMessage,response);
            }
        }catch (Exception e){
            responseMessage.setCode(50101);
            responseMessage.setMessage("请求失败!");
            responseMessage.setResult("null");
           super.writeJson(responseMessage,response);
        }
    }


    /**
     * 修改密码(忘记密码,需要验证码)
     * @param user
     * @param response
     */

    @RequestMapping(value = "/api/v1/anon/user/new/password",method = RequestMethod.POST)
    public void updateUserPassword(User user, HttpServletResponse response){

         try {
             Captcha captcha = captchaService.selectByCaptcha(user.getCaptcha());
             if(captcha != null){
                 captchaService.deleteOneById(captcha);
                 User user1 = userservice.findByPhone(user.getPhone());
                 userservice.changePassword(user1.getId(),user.getPassword());
                 super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
             }else {
                 super.writeJson(new ResponseMessage<String>(40106,"验证码无效",null),response);
             }
         }catch (Exception e){
             Map<String,String> map = new HashMap<String, String>();
             map.put("errMsg",e.toString());
             super.writeJson(new ResponseMessage<Map<String,String>>(0,"success",map),response);
         }

    }

    @RequestMapping(value = "/api/v1/user/new/password",method = RequestMethod.POST)
    public void updateUserPasswordAfterLogin(User user, HttpServletResponse response){

        try {
            User tUser = new User();
            tUser.setId(user.getId());
            User user1 = userservice.getOneById(tUser);
            user.setSalt(user1.getSalt());
            user.setUsername(user1.getUsername());
            if(user != null && (passwordHelper.decodePassword(user).getPassword().intern() == user1.getPassword().intern()) ){
                userservice.changePassword(user1.getId(),user.getNewPassword());
                super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
            }else {
                super.writeJson(new ResponseMessage<String>(40107,"密码错误!!",null),response);
            }
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50101,"请求失败!",map),response);
        }

    }





    @RequestMapping(value = "/api/v1/user/{username}",method = RequestMethod.GET)
    public void getUserDetail(@PathVariable String username,HttpServletResponse response){
        try {
            super.writeJson(new ResponseMessage<User>(0,"success",userservice.findByUsername(username)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG",e.toString());
            super.writeJson(new ResponseMessage<Map>(0,"请求失败!",map),response);
        }
    }

    @RequestMapping(value = "/api/v1/user",method = RequestMethod.POST)
    public void updateUser(AppUserInfoModel appUserInfoModel, HttpServletRequest request,HttpServletResponse response){

        try {
            User user = new User();
            if (appUserInfoModel.getAvater() != null){
                String imageUrl = super.saveUploadFile(request,appUserInfoModel.getAvater(),"head","jpg");
                user.setPhoto(imageUrl);
            }
            if (appUserInfoModel.getAddress() != null){
                user.setCurrentArea(appUserInfoModel.getAddress());
            }
            if (appUserInfoModel.getEmail() != null){
                user.setEmail(appUserInfoModel.getEmail());
            }
            if (appUserInfoModel.getNickname() != null){
                user.setNickname(appUserInfoModel.getNickname());
            }
            if (appUserInfoModel.getProvince() != null){
                user.setProvince(appUserInfoModel.getProvince());
            }
            if (appUserInfoModel.getCity() != null){
                user.setCity(appUserInfoModel.getCity());
            }
            if (appUserInfoModel.getArea() != null){
                user.setArea(appUserInfoModel.getArea());
            }
            if (appUserInfoModel.getSynopsis() != null){
                user.setDescription(appUserInfoModel.getSynopsis());
            }
            user.setId(appUserInfoModel.getId());
            userservice.update(user);
            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","请求失败!");
            super.writeJson(new ResponseMessage<Map>(50101,"请求失败!",map),response);
        }

    }

    /**
     * 获取荣誉排行榜
     */
    @RequestMapping(value = "/api/v1/anon/honer",method = RequestMethod.GET)
    public void getHonerScoreSort(HttpServletResponse response){
        try {
            PageModel pageModel = new PageModel();
            pageModel.setPage(1);
            pageModel.setRows(20);
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",userservice.findHonerOrder(pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("MSG","请求失败!");
            super.writeJson(new ResponseMessage<Map>(50101,"请求失败!",map),response);
        }
    }
}
