package com.zyfz.web.controller;

import com.zyfz.domain.Setting;
import com.zyfz.model.PageModel;
import com.zyfz.service.ISettingService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-23.
 */
@RequestMapping("/setting")
@Controller
public class SettingController extends BaseController {
    @Resource
    ISettingService settingService;

    @RequiresPermissions("property:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(){
        return "admin/setting/list";
    }

    @RequiresPermissions("property:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(){
        return "admin/setting/edit";
    }

    @RequiresPermissions("property:create")
    @RequestMapping(value = "/add-panel",method = RequestMethod.GET)
    public String toAddPanel(){
        return "admin/setting/add";
    }

    /**
     * 查
     * @param pageModel
     * @param response
     */
    @RequiresPermissions("property:view")
    @RequestMapping(value = "/list")
    public void getSettingList(PageModel pageModel, HttpServletResponse response){
        super.writeJson(settingService.getAll(pageModel),response);
    }

    /**
     * 增
     * @param setting
     * @return
     */
    @RequiresPermissions("property:create")
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addSetting(Setting setting){
       try{
           return settingService.save(setting);
       }catch (Exception e){
           e.printStackTrace();
           return false;
       }
    }

    /**
     * 改
     * @param setting
     * @return
     */
    @RequiresPermissions("property:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateSetting(Setting setting){
        try{
            return settingService.update(setting);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 删
     * @param
     * @return
     */
    @RequiresPermissions("property:delete")
    @RequestMapping(value="/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object addSetting(@PathVariable String ids){
        try{
            String mids[] = ids.split(",");
            int count = 0;
            for (String mid : mids){
                Setting setting = new Setting();
                setting.setId(Integer.valueOf(mid));
                settingService.deleteOneById(setting);
                count++;
            }
            return  count;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

}
