package com.zyfz.web.controller;

import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskContractService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ron on 16-12-7.
 */
@RequestMapping("/taskContract")
@Controller
public class TaskContractController extends BaseController{

    @Resource
    ITaskContractService taskContractService;

    @RequestMapping(value = "/list-panel/{taskInfoId}",method = RequestMethod.GET)
    public String getListPanel(@PathVariable Integer taskInfoId, Model model){
        model.addAttribute("taskInfoId",taskInfoId);
        return "admin/taskinfo/contract";
    }

    @RequestMapping(value = "/list/{taskInfoId}")
    public void getContract(@PathVariable Integer taskInfoId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(taskContractService.getByTaskInfoId(taskInfoId, pageModel),response);
    }
}
