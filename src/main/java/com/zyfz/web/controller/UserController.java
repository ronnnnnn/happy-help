package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-18.
 */
@RequestMapping("/user")
@Controller
public class UserController extends BaseController{

    @Resource
    IUserservice userservice;

    @RequestMapping(value = "/superuser/list")
    public String toSuperUserList(){
        return "admin/user/superUserList";
    }

    @RequestMapping(value = "/superuser/editpanel")
    public String toSuperUserEditPanel(){
        return "admin/user/superUserEditPanel";
    }

    @RequestMapping(value = "/superuser/all")
    public void getAllSuperUser(PageModel pageModel, HttpServletResponse response){
        super.writeJson(userservice.getAllSuperUser(pageModel),response);
    }

    @RequestMapping(value = "/superuser",method = RequestMethod.POST)
    @ResponseBody
    public Object updateSuperUser(@RequestBody User user){
       return userservice.update(user);
    }



}
