package com.zyfz.web.controller;

import com.zyfz.domain.HelpInfo;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.IHelpInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ron on 16-10-31.
 */
@RequestMapping("/helpInfo")
@Controller
public class HelpInfoController extends BaseController {

    @Resource
    IHelpInfoService helpInfoService;

    @Resource
    ICategoryService categoryService;


    @RequiresPermissions("help:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(Model model){
        model.addAttribute("hcategoryList",categoryService.getAllWithList());
        return "admin/helpinfo/list";
    }

    @RequiresPermissions("help:view")
    @RequestMapping(value = "/list/{categoryId}/{startTime}/{endTime}",method = RequestMethod.POST)
    public void getDatagrid(@PathVariable Integer categoryId, @PathVariable String startTime, @PathVariable String endTime, PageModel pageModel, HttpServletResponse response){
      try {
          SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd hh:mm");
          Date mStartTime = sim.parse(startTime);
          Date mEndTime = sim.parse(endTime);
          super.writeJson(helpInfoService.getHelpInfoWithUserByCIDAndTime(categoryId,mStartTime,mEndTime,pageModel),response);
      }catch (Exception e){
          e.printStackTrace();
      }

    }

    @RequiresPermissions("help:view")
    @RequestMapping(value = "/search/{key}",method = RequestMethod.POST)
    public void getDatagrid(@PathVariable String key, PageModel pageModel, HttpServletResponse response){
            super.writeJson(helpInfoService.getHelpInfoWithUserByKey(key,pageModel),response);
    }


    @RequiresPermissions("help:delete")
    @RequestMapping(value="/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        String mids[] = ids.split(",");
        int count = 0;
        for (String mid : mids){
            HelpInfo helpInfo = new HelpInfo();
            helpInfo.setId(Integer.valueOf(mid));
            helpInfoService.deleteOneById(helpInfo);
            count++;
        }
        return count;
    }

    @RequestMapping(value="/{ids}/{type}",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateDeleteStatu(@PathVariable String ids,@PathVariable String type){
        String mids[] = ids.split(",");
        int count = 0;
        for (String mid : mids){
            HelpInfo helpInfo = new HelpInfo();
            helpInfo.setId(Integer.valueOf(mid));
            if (type.intern() == "up".intern()){
                helpInfo.setIsDeleted(false);
            }else {
                helpInfo.setIsDeleted(true);
            }
            helpInfoService.update(helpInfo);
            count++;
        }
        return count;
    }
}
