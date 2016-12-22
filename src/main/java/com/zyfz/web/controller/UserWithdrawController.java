package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.domain.UserWithdraw;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserWithdrawServiceImpl;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by ron on 16-12-20.
 */
@Controller
public class UserWithdrawController extends BaseController {
    @Resource
    IUserWithdrawServiceImpl  userWithdrawService;

    @Resource
    IUserservice userservice;

    @RequestMapping(value = "/withdraw/record",method = RequestMethod.GET)
    public String getRecordList(){
        return "admin/record/withdraw-list";
    }

    @RequestMapping(value = "/withdraw/date",method = RequestMethod.POST)
    public void getDate(@RequestParam(value = "username",required = false)String username,
                        @RequestParam(value = "startTime",required = false)String startTime,
                        @RequestParam(value = "endTime",required = false)String endTime,
                        @RequestParam(value = "isHandle",required = false)Boolean isHandle,
                        HttpServletResponse response,
                        PageModel pageModel
                        ){
        UserWithdraw userWithdraw = new UserWithdraw();
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        try {
            if (startTime != null&&startTime.intern() != "none".intern()){
                userWithdraw.setCreateTime(dateFormatter.parse(startTime));
            }
            if (endTime != null&&endTime.intern() != "none".intern()){
                userWithdraw.setCreateTime(dateFormatter.parse(endTime));
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if (username != null&&username.intern() != "none".intern()){
            User user = userservice.findByUsername(username);
            userWithdraw.setHhUserId(user.getId());
        }

        if (isHandle != null){
            userWithdraw.setIsHande(isHandle);
        }
        super.writeJson(userWithdrawService.selectBySelective(userWithdraw,pageModel),response);
    }

}
