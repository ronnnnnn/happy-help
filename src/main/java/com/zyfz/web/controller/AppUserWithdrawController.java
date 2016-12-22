package com.zyfz.web.controller;

import com.zyfz.domain.User;
import com.zyfz.domain.UserWithdraw;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IUserWithdrawServiceImpl;
import com.zyfz.service.IUserservice;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-12-20.
 */
@Controller
public class AppUserWithdrawController extends BaseController {
    @Resource
    IUserWithdrawServiceImpl userWithdrawService;

    @Resource
    IUserservice userservice;

    @RequestMapping(value = "/api/v1/withdraw/requset",method = RequestMethod.POST)
    public void withdrawRequest(UserWithdraw userWithdraw,
                                HttpServletResponse response){
        try {
            User user = userservice.getOneById(new User(userWithdraw.getHhUserId()));
            if (user.getAccount() > userWithdraw.getMoney()){
                Double finalMoney = user.getAccount() - userWithdraw.getMoney();
                user.setAccount(finalMoney);
                userservice.update(user);
            } else {
                Map<String,String> map = new HashMap<String, String>();
                map.put("errMsg","账户金额不足");
                super.writeJson(new ResponseMessage<Map<String,String>>(41000,"请求失败",map),response);
                return;
            }

            if (userWithdraw.getWithdrawAccountType() == null || userWithdraw.getWithdrawAccountType().intern() == ""){
                    userWithdraw.setWithdrawAccountType("支付宝");
            }
            userWithdraw.setIsHande(false);
            userWithdraw.setCreateTime(new Date());
            userWithdrawService.save(userWithdraw);

            super.writeJson(new ResponseMessage<String>(0,"success","null"),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg",e.toString());
            super.writeJson(new ResponseMessage<Map<String,String>>(50801,"请求失败",map),response);
        }
    }
}
