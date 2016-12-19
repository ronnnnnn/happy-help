package com.zyfz.web.controller;

import com.zyfz.domain.PlatformRecord;
import com.zyfz.model.AppPlatformModel;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPlatformRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-12-16.
 */
@RequestMapping("/platform")
@Controller
public class PlatformServiceController extends BaseController {
    @Resource
    IPlatformRecordService platformRecordService;

    @RequestMapping(value = "/record",method = RequestMethod.GET)
    public String toPlatformRecord(Model model){
        Double in = 0d;
        Double out = 0d;
        Double inTemp = 0d;
        Double outTemp = 0d;
        Double inMoney = platformRecordService.selectSumMoney("收入");
        Double outMoney = platformRecordService.selectSumMoney("支出");
        Double inMoneyTemp = platformRecordService.selectSumMoneyTemp("收入");
        Double outMoneyTemp = platformRecordService.selectSumMoneyTemp("支出");
        if (inMoney != null){
            in = inMoney;
        }
        if (outMoney != null){
            out = outMoney;
        }
        if (inMoneyTemp != null){
            inTemp = inMoneyTemp;
        }
        if (outMoneyTemp != null){
            outTemp = outMoneyTemp;
        }

        model.addAttribute("in",in);
        model.addAttribute("out",out);
        model.addAttribute("inTemp",inTemp);
        model.addAttribute("outTemp",outTemp);

        return "admin/record/platform-record-list";
    }

    @RequestMapping(value = "/record-data",method = RequestMethod.POST)
    public void lsitData(HttpServletResponse response, PageModel pageModel){
        super.writeJson(platformRecordService.selectAll(pageModel),response);
    }

    @RequestMapping(value = "/record-search/{incomeType}/{startTime}/{endTime}",method = RequestMethod.POST)
    public void getSearchData(@PathVariable String incomeType,
                              @PathVariable String startTime,
                              @PathVariable String endTime,
                              HttpServletResponse response,
                              PageModel pageModel
                              ){
        try{
            SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm");
            Date mStartTime = sim.parse(startTime);
            Date mEndTime = sim.parse(endTime);
            AppPlatformModel appPlatformModel = new AppPlatformModel();
            appPlatformModel.setStartTime(mStartTime);
            appPlatformModel.setEndTime(mEndTime);
            appPlatformModel.setIncomeType(incomeType);
            super.writeJson(platformRecordService.selectWithParam(appPlatformModel,pageModel),response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/sum",method = RequestMethod.GET)
    public void getSUM(@PathVariable String type,HttpServletResponse response){
        Map<String,String> map = new HashMap<String,String>();
        map.put("in", String.valueOf(platformRecordService.selectSumMoney("收入")));
        map.put("out",String.valueOf(platformRecordService.selectSumMoney("支出")));
        super.writeJson(map,response);
    }


}
