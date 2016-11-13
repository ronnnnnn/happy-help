package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.ResponseMessage;
import com.zyfz.web.util.JsonView;
import org.apache.log4j.spi.LoggerFactory;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.slf4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-9-20.
 */
@Controller
public class LoginController extends BaseController {
    private static final org.apache.log4j.Logger logger = org.apache.log4j.Logger.getLogger(LoginController.class);
//    @RequestMapping(value = "/login")
//    public String showLoginForm(HttpServletRequest req, Model model) {
//        String exceptionClassName = (String)req.getAttribute("shiroLoginFailure");
//        String error = null;
//        if(UnknownAccountException.class.getName().equals(exceptionClassName)) {
//            error = "用户名/密码错误";
//        } else if(IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
//            error = "用户名/密码错误";
//        } else if(exceptionClassName != null) {
//            error = "其他错误：" + exceptionClassName;
//        }
//        model.addAttribute("error", error);
//        return "/login";
//    }

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
            error = "其他错误：" + exceptionClassName;
            errorCode =  40105;//其他错误
        }


        String app = req.getParameter("type");

        /**
         * 根据不同的用户类型返回不同的数据格式
         */
        if (app != null){
            return JsonView.Render(new ResponseMessage<String>(errorCode,error,error),rep);
        }else {
            ModelAndView modelAndView = new ModelAndView("/login");
            modelAndView.addObject("error",error);
            return modelAndView;
        }


//        if(app != null || app != "app"){
//            ModelAndView modelAndView = new ModelAndView("/login");
//            modelAndView.addObject("error",error);
//            return modelAndView;
//        }else if (app != null || app == "app"){
//            return JsonView.Render(new ResponseMessage<String>(errorCode,"failure",error),rep);
//        } else {
//            ModelAndView modelAndView = new ModelAndView("/login");
//            modelAndView.addObject("error",error);
//            return modelAndView;
//        }
    }

}
