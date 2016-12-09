package com.zyfz.web.controller;

import com.zyfz.model.PageModel;
import com.zyfz.service.IOrderRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-12-9.
 */
@RequestMapping("/order")
@Controller
public class OrderRecordController extends BaseController{
    @Resource
    IOrderRecordService orderRecordService;

    @RequestMapping(value = "/record",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/record/order-record-list";
    }

    @RequestMapping(value = "/record-data",method = RequestMethod.POST)
    public void getDate(PageModel pageModel, HttpServletResponse response){
        super.writeJson(orderRecordService.getAll(pageModel),response);
    }

    @RequestMapping(value = "/{tradeNo}",method = RequestMethod.POST)
    public void getSearch(@PathVariable String tradeNo,PageModel pageModel,HttpServletResponse response){
        super.writeJson(orderRecordService.getByTradeNo(pageModel,tradeNo),response);
    }
}
