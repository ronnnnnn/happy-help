package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.ResponseMessage;
import com.zyfz.web.util.DeviceUtil;
import com.zyfz.web.util.JsonView;
import org.apache.log4j.spi.LoggerFactory;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.ShiroHttpSession;
import org.apache.shiro.web.subject.support.WebDelegatingSubject;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-9-20.
 */
@Controller
public class LoginController extends BaseController {
    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(LoginController.class);


    @RequestMapping(value = "/login")
    public ModelAndView showLoginForm(HttpServletRequest req, HttpServletResponse rep) {
        String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
        String error = null;
        int errorCode = 50101;
        if(UnknownAccountException.class.getName().equals(exceptionClassName)) {
            error = "用户名错误";
            errorCode = 40103;//用户名错误
        } else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
            error = "密码错误";
            errorCode = 40104;//密码错误
        } else if(exceptionClassName != null) {
            error = "登录密码错误次数太多,您的帐号帐号暂时不能登录" ;
            errorCode =  40105;//其他错误
        }

        //web端管理登录成功后不允许退回到登录界面，app则返回登录成功
        try{
            logger.info(req.getUserPrincipal());
            if(req.getUserPrincipal() != null && req.authenticate(rep)){
                return new ModelAndView("redirect:/");
            }
        }catch (Exception e){
            e.printStackTrace();
        }


        /**
         * 根据不同的用户类型返回不同的数据格式
         * app端登录成功返回json数据
         * web端返回jsp页面
         */
        if(DeviceUtil.isMobileDevice(req.getHeader("user-agent"))){
            if (error == null){
                error = "未登录！";
            }
            Map<String,String> map = new HashMap<String,String>();
            map.put("message",error);
            return JsonView.Render(new ResponseMessage<Map<String,String>>(40000,error,map),rep); //手机 app端返回json数据
        }else {
            ModelAndView modelAndView = new ModelAndView("/login");   //pc web端返回登录界面
            modelAndView.addObject("error",error);
            return modelAndView;
        }

    }

}
