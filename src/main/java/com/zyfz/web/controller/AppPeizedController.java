package com.zyfz.web.controller;

import com.zyfz.domain.Prize;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IPrizeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ron on 16-11-25.
 */
@Controller
public class AppPeizedController extends BaseController {

    @Resource
    IPrizeService prizeService;

    /**
     * 获取最近20条中奖记录
     */
    @RequestMapping(value = "/api/v1/anon/peried",method = RequestMethod.GET)
    public void getPerizedRecent(HttpServletResponse response){
        try {
            PageModel pageModel = new PageModel();
            pageModel.setPage(1);
            pageModel.setRows(20);
            Prize prize = new Prize();
            prize.setIsLottery(true);
            super.writeJson(new ResponseMessage<Datagrid>(0,"success",prizeService.findAllLottery(prize,pageModel)),response);
        }catch (Exception e){
            Map<String,String> map = new HashMap<String, String>();
            map.put("errMsg","响应失败!");
            super.writeJson(new ResponseMessage<Map>(50601,"响应失败!",map),response);
        }
    }



}
