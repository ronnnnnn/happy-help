package com.zyfz.web.controller;

import com.github.pagehelper.PageInfo;
import com.zyfz.domain.Prize;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPrizeService;
import com.zyfz.service.IRoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-23.
 */
@RequestMapping("/prize")
@Controller
public class PrizeController extends BaseController {
    @Resource
    IPrizeService prizeService;

    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/prize/list";
    }

    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "admin/prize/edit";
    }

    @RequestMapping(value = "/list")
    public void getPrizeList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(prizeService.getAll(pageModel),response);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addPrize(Prize prize){
        try {
            return prizeService.save(prize);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updatePrize(Prize prize){
        try {
            return prizeService.update(prize);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.POST)
    @ResponseBody
    public Object deletePrize(String ids){
        try {
            int count = 0;
            String mids[] = ids.split(",");
            for (String mid : mids){
                Prize prize = new Prize();
                prize.setId(Integer.valueOf(mid));
                prizeService.deleteOneById(prize);
                count++;
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

}
