package com.zyfz.web.controller;

import com.zyfz.model.PageModel;
import com.zyfz.service.IMoneyRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-12-9.
 */
@RequestMapping("/money")
@Controller
public class MoneyRecordController extends BaseController{
    @Resource
    IMoneyRecordService moneyRecordService;

    @RequestMapping(value = "/record",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/record/money-record-list";
    }

    @RequestMapping(value = "/record-data",method = RequestMethod.POST)
    public void getData(PageModel pageModel , HttpServletResponse response){
        super.writeJson(moneyRecordService.getAll(pageModel),response);
    }

    @RequestMapping(value = "/{tradeNo}",method = RequestMethod.POST)
    public void getDateByTradeNo(@PathVariable String tradeNo,PageModel pageModel,HttpServletResponse response){
        super.writeJson(moneyRecordService.getByTradeOrderNo(pageModel,tradeNo),response);
    }
}
