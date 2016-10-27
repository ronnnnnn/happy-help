package com.zyfz.web.controller;

import com.zyfz.domain.Prize;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPrizeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

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

    @RequestMapping(value = "/useredit-panel",method = RequestMethod.GET)
    public String toprizeUserEditPanel(){
        return "admin/prize/prizeUserEdit";
    }

    @RequestMapping(value = "/article/edit-panel",method = RequestMethod.GET)
    public String toprizeArticleEditPanel(){
        return "admin/prize/prizeArticleEdit";
    }

    @RequestMapping(value = "/user-panel/{hhPhones}",method = RequestMethod.GET)
    public String touserListPanel(@PathVariable String hhPhones, Model model){
        model.addAttribute("hhPhones",hhPhones);
        return "admin/prize/prizeUserList";
    }

    @RequestMapping(value = "/list")
    public void getPrizeList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(prizeService.getAll(pageModel),response);
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addPrize(Prize prize){
        try {
            prize.setCreateTime(new Date());
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
            Prize myPrice = prizeService.getOneById(prize);
            if(myPrice.getIsLottery() == false){
                return prizeService.update(prize);
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deletePrize(@PathVariable String ids){

        try {
            int count = 0;
            String mids[] = ids.split(",");
            for (String mid : mids){
                Prize prize = new Prize();
                prize.setId(Integer.valueOf(mid));
                Prize mprize = prizeService.getOneById(prize);
                if (mprize.getIsLottery() == false){
                    prizeService.deleteOneById(prize);
                    count++;
                }else{
                    return false;
                }

            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/lottery/{ids}",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updatePrizeStatus(@PathVariable String ids){
        try {
            int count = 0;
            String mids[] = ids.split(",");
            for (String mid : mids){
                Prize prize = new Prize();
                prize.setId(Integer.valueOf(mid));
                prize.setIsLottery(true);
                prizeService.update(prize);
                count++;
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value = "/search/{mykey}")
    public void findByKey(@PathVariable String mykey,HttpServletResponse response){
         super.writeJson(prizeService.findByKeyLike(mykey),response);
    }

}
