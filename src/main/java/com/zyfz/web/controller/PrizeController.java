package com.zyfz.web.controller;

import com.zyfz.domain.PlatformRecord;
import com.zyfz.domain.Prize;
import com.zyfz.domain.SystemMessage;
import com.zyfz.domain.User;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPlatformRecordService;
import com.zyfz.service.IPrizeService;
import com.zyfz.service.ISystemMessageService;
import com.zyfz.service.IUserservice;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.zyfz.global.SystemMessageString.DEAL_MESSAGE_TITLE;

/**
 * Created by ron on 16-10-23.
 */
@RequestMapping("/prize")
@Controller
public class PrizeController extends BaseController {
    @Resource
    IPrizeService prizeService;

    @Resource
    IUserservice userservice;

    @Resource
    IPlatformRecordService platformRecordService;

    @Resource
    ISystemMessageService systemMessageService;

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
            Prize myPrice = prizeService.getOneById(new Prize(Integer.valueOf(ids)));
            List<User> users = new ArrayList<>();
            myPrice.setIsLottery(true);
            prizeService.update(myPrice);
            //中奖金额转与中奖用户
            users.add(userservice.findByPhone(myPrice.getArticlePhones()));
            String[] userPhones = myPrice.getHhPhones().split(",");
            for (String phone : userPhones){
                users.add(userservice.findByPhone(phone));
            }

            for (User user : users){
                Double finalMoney = user.getAccount() + myPrice.getPrizeMoney();
                user.setAccount(finalMoney);
                userservice.update(user);

                //平台支出记录
                PlatformRecord platformRecord4TempOut = new PlatformRecord( "prize",
                            "支出",
                            null,
                            user.getId(),
                            myPrice.getPrizeMoney(),
                            "",
                            new Date(),
                            null);
                platformRecordService.save(platformRecord4TempOut);

                    //消息推送
                SystemMessage systemMessage2 = new SystemMessage("userAccount",
                            user.getId(),
                            new Date(),
                            "恭喜您中奖了",
                            "恭喜您,中奖了!"+myPrice.getPrizeMoney() +"元已经转到您的帐号了.",
                            null);
                systemMessageService.save(systemMessage2);
                }

            return true;
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
