package com.zyfz.web.controller;

import com.zyfz.domain.ServerInfo;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.IServerInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-11-1.
 */
@RequestMapping("/serverInfo")
@Controller
public class ServerInfoController extends BaseController{
    @Resource
    IServerInfoService serverInfoService;

    @Resource
    ICategoryService categoryService;

    @RequiresPermissions("server:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(Model model){
        model.addAttribute("vcategoryList",categoryService.getAllWithList());
        return "admin/serverinfo/list";
    }

    @RequiresPermissions("server:view")
    @RequestMapping(value = "/search/{key}",method = RequestMethod.POST)
    public void getServerInfoWithCID(@PathVariable String key, PageModel pageModel, HttpServletResponse response){
        super.writeJson(serverInfoService.getServerInfoByKey(key,pageModel),response);
    }

    @RequiresPermissions("server:view")
    @RequestMapping(value = "/list/{categoryId}",method = RequestMethod.POST)
    public void getServerInfoWithCID(@PathVariable Integer categoryId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(serverInfoService.getServerInfoByCategoryId(categoryId,pageModel),response);
    }

    @RequiresPermissions("server:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        String mids[] = ids.split(",");
        int count = 0;
        for (String mid:mids){
            ServerInfo serverInfo = new ServerInfo(Integer.valueOf(mid));
            serverInfoService.deleteOneById(serverInfo);
            count++;
        }
        return count;
    }

    @RequestMapping(value = "/{ids}/{type}",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updateDeleteStatu(@PathVariable String ids,@PathVariable String type){
        String mids[] = ids.split(",");
        int count = 0;
        for (String mid:mids){
            ServerInfo serverInfo = new ServerInfo(Integer.valueOf(mid));
            if (type.intern() == "up"){
                serverInfo.setIsDeleted(false);
            }else {
                serverInfo.setIsDeleted(true);
            }
            serverInfoService.update(serverInfo);
            count++;
        }
        return count;
    }

    @RequiresPermissions("server:update")
    @RequestMapping(value = "/{ids}",method = RequestMethod.PATCH)
    @ResponseBody
    public Object updatePassStatusByIds(@PathVariable String ids){
        String mids[] = ids.split(",");
        int count = 0;
        for (String mid:mids){
            ServerInfo serverInfo = new ServerInfo(Integer.valueOf(mid));
            ServerInfo serverInfo1 = serverInfoService.getOneById(serverInfo);
            serverInfo1.setIsPass(true);
            serverInfoService.update(serverInfo1);
            count++;
        }
        return count;
    }

}
