package com.zyfz.web.controller;

import com.zyfz.domain.TaskInfo;
import com.zyfz.model.Json;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.ITaskInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-28.
 */
@RequestMapping("/taskinfo")
@Controller
public class TaskInfoController extends BaseController {

    @Resource
    ITaskInfoService taskInfoService;

    @Resource
    ICategoryService categoryService;

    @RequiresPermissions("task:view")
    @RequestMapping(value = "/list-panel",method = RequestMethod.GET)
    public String toListPanel(Model model){
        model.addAttribute("categoryList",categoryService.getAllWithList());
        return "admin/taskinfo/list";
    }

    @RequiresPermissions("task:update")
    @RequestMapping(value = "/edit-panel",method = RequestMethod.GET)
    public String toEditPanel(Model model){
        model.addAttribute("categoryList",categoryService.getAllWithList());
        return "admin/taskinfo/edit";
    }

    @RequiresPermissions("task:view")
    @RequestMapping(value = "/list/{categoryId}/{isFree}/{isCompeleted}/{isTop}",method = RequestMethod.POST)
    public void getDategridList(@PathVariable Integer categoryId,@PathVariable Boolean isFree,@PathVariable Boolean isCompeleted,@PathVariable Boolean isTop, PageModel pageModel, HttpServletResponse response){
        super.writeJson(taskInfoService.getTaskInfoWithUserByCategory(categoryId,isFree,isCompeleted,isTop,pageModel),response);
    }

    @RequiresPermissions("task:create")
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Object addTaskInfo(TaskInfo taskInfo){

        try {
            return taskInfoService.save(taskInfo);
        }catch (Exception e){
            return e.toString();
        }
    }

    @RequiresPermissions("task:update")
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateArticle(@RequestBody TaskInfo taskInfo){
        try{
            return taskInfoService.update(taskInfo);
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }
    }

    @RequiresPermissions("task:delete")
    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        try{
            String mids[] = ids.split(",");
            int count = 0;
            for(String mid : mids){
                TaskInfo taskInfo = new TaskInfo();
                taskInfo.setId(Integer.valueOf(mid));
                taskInfoService.deleteOneById(taskInfo);
                count++;
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }

    }

    @RequiresPermissions("task:view")
    @RequestMapping(value = "/search/{taskinfoKey}",method = RequestMethod.POST)
    public void getTaskInfoByKey(@PathVariable String taskinfoKey,PageModel pageModel,HttpServletResponse response){
        super.writeJson(taskInfoService.getTaskInfoWithUserByKey(taskinfoKey,pageModel),response);
    }


    /**
     * 上传图片到服务器
     * @param file
     * @param response
     * @param request
     */
    @RequestMapping(value = "/image",method = RequestMethod.POST)
    public void importImage(MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
        Json json = new Json();
        try {
            String imageName = super.saveUploadFile(request, file, "taskinfo", "jpg");
            json.setObj(imageName);
            json.setSuccess(true);
            json.setMsg("导入成功！");
        } catch (Exception e) {
            json.setMsg(e.toString());
        }
    }

}
