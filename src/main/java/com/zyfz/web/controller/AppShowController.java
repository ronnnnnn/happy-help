package com.zyfz.web.controller;

import com.zyfz.domain.Show;
import com.zyfz.model.ResponseMessage;
import com.zyfz.service.IShowService;
import org.codehaus.jackson.map.deser.ValueInstantiators;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by ron on 16-11-13.
 */
@RequestMapping("/api/v1/anon/show")
@Controller
public class AppShowController extends BaseController {

    @Resource
    IShowService showService;

    @RequestMapping(value = "/{picType}",method = RequestMethod.GET)
    public void getShowPicture(@PathVariable String picType, HttpServletResponse response){
        try {
            List<Show> shows = showService.getPicByType(picType);
            super.writeJson(new ResponseMessage<List<Show>>(0,"success",shows),response);
        }catch (Exception e){
            super.writeJson(new ResponseMessage<String>(50201,"系统异常",null),response);
        }
    }
}
