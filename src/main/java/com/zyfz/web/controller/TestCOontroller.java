package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.service.IUserservice;
import org.omg.CORBA.DoubleHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by ron on 16-10-16.
 */
@Controller
public class TestCOontroller {
    @Resource
    IUserservice userservice;

    @RequestMapping("/test")
    @ResponseBody
    public Object test(Model model){
        User user = new User();
        user.setId(1);
        model.addAttribute("user",userservice.getOneById(user));
        String t1 = "0.1";
        String t2 = "0.10";
        Double d1 = Double.valueOf(t1);
        Double d2 = Double.valueOf(t2);

        return  String.valueOf(d1).intern() == String.valueOf(d2).intern();
    }
}
