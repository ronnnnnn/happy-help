package com.zyfz.web.controller;

import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskComment2Service;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-10-29.
 */
@RequestMapping("/taskcomment2")
@Controller
public class TaskInfoComment2Controller extends BaseController {
    @Resource
    ITaskComment2Service taskComment2Service;

    @RequestMapping(value = "/list/{commentId}",method = RequestMethod.POST)
    public void getList(@PathVariable Integer commentId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(taskComment2Service.getListByCommentId(commentId,pageModel),response);
    }

}
