package com.zyfz.web.controller;

import com.zyfz.domain.Prize;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPrizeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
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

    @RequiresPermissions("prize:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/prize/list";
    }

    @RequiresPermissions("prize:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "admin/prize/edit";
    }

    /**
     * 跳转到选择中奖人界面，根据荣誉值
     * @return
     */
    @RequiresPermissions("prize:update")
    @RequestMapping(value = "/useredit-panel",method = RequestMethod.GET)
    public String toprizeUserEditPanel(){
        return "admin/prize/prizeUserEdit";
    }

    /**
     * 跳转到选择中奖文章界面
     * @return
     */
    @RequiresPermissions("prize:update")
    @RequestMapping(value = "/article/edit-panel",method = RequestMethod.GET)
    public String toprizeArticleEditPanel(){
        return "admin/prize/prizeArticleEdit";
    }

    /**
     * 跳转到查看中奖用户详情
     * @param hhPhones
     * @param model
     * @return
     */
    @RequiresPermissions("prize:view")
    @RequestMapping(value = "/user-panel/{hhPhones}",method = RequestMethod.GET)
    public String touserListPanel(@PathVariable String hhPhones, Model model){
        model.addAttribute("hhPhones",hhPhones);
        return "admin/prize/prizeUserList";
    }

    @RequiresPermissions("prize:view")
    @RequestMapping(value = "/list")
    public void getPrizeList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(prizeService.getAll(pageModel),response);
    }

    @RequiresPermissions("prize:create")
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

    @RequiresPermissions("prize:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updatePrize(Prize prize){
        try {
            Prize myPrice = prizeService.getOneById(prize);
            if(myPrice.getIsLottery() == false){  //只能更改未开奖的开奖记录
                return prizeService.update(prize);
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    @RequiresPermissions("prize:delete")
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
                if (mprize.getIsLottery() == false){  //只能删除未开奖的开奖记录
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

    /**
     * 开奖，开奖后不能记录不允许删除，修改
     * @param ids
     * @return
     */
    @RequiresPermissions("prize:update")
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

    /**
     * 根据中奖期数查看中奖纪录
     * @param mykey
     * @param response
     */
    @RequiresPermissions("prize:view")
    @RequestMapping(value = "/search/{mykey}")
    public void findByKey(@PathVariable String mykey,HttpServletResponse response){
         super.writeJson(prizeService.findByKeyLike(mykey),response);
    }

}
