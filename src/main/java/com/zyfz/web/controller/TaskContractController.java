package com.zyfz.web.controller;

import com.zyfz.domain.PlatformRecord;
import com.zyfz.domain.TaskContract;
import com.zyfz.domain.TaskInfo;
import com.zyfz.domain.User;
import com.zyfz.model.PageModel;
import com.zyfz.service.IPlatformRecordService;
import com.zyfz.service.ITaskContractService;
import com.zyfz.service.ITaskInfoService;
import com.zyfz.service.IUserservice;
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
 * Created by ron on 16-12-7.
 */
@RequestMapping("/taskContract")
@Controller
public class TaskContractController extends BaseController{

    @Resource
    ITaskContractService taskContractService;

    @Resource
    IUserservice userservice;

    @Resource
    IPlatformRecordService platformRecordService;

    @Resource
    ITaskInfoService taskInfoService;

    @RequestMapping(value = "/list-panel/{taskInfoId}",method = RequestMethod.GET)
    public String getListPanel(@PathVariable Integer taskInfoId, Model model){
        model.addAttribute("taskInfoId",taskInfoId);
        return "admin/taskinfo/contract";
    }

    @RequestMapping(value = "/list/{taskInfoId}")
    public void getContract(@PathVariable Integer taskInfoId, PageModel pageModel, HttpServletResponse response){
        super.writeJson(taskContractService.getByTaskInfoId(taskInfoId, pageModel),response);
    }

    /**
     * 管理员同意发布者申请终结任务,并退还寄放在平台交易的金额,但不退还手续费
     * @param contractId
     */
    @RequestMapping(value = "/compeleted/{contractId}",method = RequestMethod.POST)
    @ResponseBody
    public Object compeleteDeal(@PathVariable Integer contractId){
        TaskContract taskContract = taskContractService.getOneById(new TaskContract(contractId));
        TaskInfo taskInfo = taskInfoService.getOneById(new TaskInfo(taskContract.getHhTaskInfoId()));
        User user = userservice.getOneById(new User(taskInfo.getHhUserId()));
        Integer status = taskContract.getStatus();
        if (status == 9 || status == 10 ){
            Double paidMoney = taskContract.getMoney();
            Double finalAccount = paidMoney + user.getAccount();
            user.setAccount(finalAccount);
            userservice.update(user);

            //交易金额退还记录
            PlatformRecord platformRecord4Temp = new PlatformRecord( "taskInfoTemp",
                    "支出",
                    taskInfo.getId(),
                    user.getId(),
                    paidMoney,
                    "普通求助服务费暂存平台,管理员同意发布者终结任务后退还给发布者",
                    new Date(),
                    taskContract.getId());
            platformRecordService.save(platformRecord4Temp);
            return true;
        } else {
            return false;
        }
    }

}
