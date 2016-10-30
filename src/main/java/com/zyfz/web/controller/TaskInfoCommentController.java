package com.zyfz.web.controller;

import com.zyfz.domain.TaskComment;
import com.zyfz.domain.TaskInfo;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskCommnetService;
import com.zyfz.service.ITaskInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-29.
 */
@RequestMapping("/taskcomment")
@Controller
public class TaskInfoCommentController extends  BaseController {

    @Resource
    ITaskCommnetService taskCommnetService;

    @RequestMapping(value = "/list-panel/{taskInfoId}",method = RequestMethod.GET)
    public String toListPanel(@PathVariable Integer taskInfoId,Model model)
    {
        model.addAttribute("taskInfoId",taskInfoId);
        return "admin/taskcomment/list";
    }

    @RequestMapping(value = "/list/{taskInfoId}" ,method = RequestMethod.POST)
    public void getCommentList(@PathVariable Integer taskInfoId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(taskCommnetService.getTaskCommentByTaskId(taskInfoId,pageModel),response);
    }

    @RequestMapping(value = "/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteByIds(@PathVariable String ids){
        try{
            String mids[] = ids.split(",");
            int count = 0;
            for(String mid : mids){
                TaskComment taskComment = new TaskComment();
                taskComment.setId(Integer.valueOf(mid));
                taskCommnetService.deleteOneById(taskComment);
                count++;
            }
            return count;
        }catch (Exception e){
            e.printStackTrace();
            return e.toString();
        }

    }
}
