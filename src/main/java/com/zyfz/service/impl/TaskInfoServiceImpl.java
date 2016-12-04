package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.TaskCommentMapper;
import com.zyfz.dao.TaskInfoMapper;
import com.zyfz.domain.TaskComment;
import com.zyfz.domain.TaskInfo;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskCommnetService;
import com.zyfz.service.ITaskInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-28.
 */
@Service
public class TaskInfoServiceImpl implements ITaskInfoService {

    @Resource
    TaskInfoMapper taskInfoMapper;

    @Resource
    TaskCommentMapper taskCommentMapper;

    @Resource
    ITaskCommnetService taskCommnetService;

    @Override
    public Integer save(TaskInfo taskInfo) {
        taskInfo.setCreateTime(new Date());
        taskInfo.setEndTime(new Date());
        return taskInfoMapper.insertSelective(taskInfo);
    }

    @Override
    public Integer update(TaskInfo taskInfo) {
        return taskInfoMapper.updateByPrimaryKeySelective(taskInfo);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public TaskInfo getOneById(TaskInfo taskInfo) {
        return taskInfoMapper.selectTaskInfoById(taskInfo.getId());
    }

    @Override
    public Integer deleteOneById(TaskInfo taskInfo) {
        List<TaskComment> taskComments = taskCommentMapper.selectByTaskInfoId(taskInfo.getId());
        if(taskComments.size() != 0){
            for (TaskComment taskComment : taskComments){
                taskCommnetService.deleteOneById(taskComment);
            }
        }
        return taskInfoMapper.deleteByPrimaryKey(taskInfo.getId());
    }

    @Override
    public Datagrid getTaskInfoWithUserByCategory(Integer categoryId,Boolean isFree,Boolean isCompeleted , Boolean isTop,PageModel pageModel) {
        if (pageModel.getPage() == 0){
            pageModel.setPage(1);
            pageModel.setRows(10);
        }
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskInfo> taskInfos = taskInfoMapper.selectTaskInfoWithUserByCategory(categoryId,isFree,isCompeleted,isTop);
        //List<TaskInfo> taskInfos = taskInfoMapper.selectAll();
        PageInfo pageInfo = new PageInfo(taskInfos);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskInfos);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getTaskInfoWithUserByKey(String taskinfoKey,PageModel pageModel) {
        if (pageModel.getPage() == 0){
            pageModel.setPage(1);
            pageModel.setRows(10);
        }
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mykey = "%"+taskinfoKey+"%";
        List<TaskInfo> taskInfos = taskInfoMapper.selectTaskInfoWithUserByKey(mykey);
        PageInfo pageInfo = new PageInfo(taskInfos);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskInfos);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    /**
     * 根据类别和状态返回数据
     * @param taskInfo
     * @param pageModel
     * @return
     */
    @Override
    public Datagrid getTaskInfoWithUserByCategoryAndStatus(TaskInfo taskInfo, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskInfo> taskInfos = taskInfoMapper.selectTaskInfoWithUserByCategoryAndStatus(taskInfo);
        PageInfo pageInfo = new PageInfo(taskInfos);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskInfos);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getMTaskInfoWithUser(PageModel pageModel, Integer userId) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskInfo> taskInfos = taskInfoMapper.selectMTaskInfoWithUser(userId);
        PageInfo pageInfo = new PageInfo(taskInfos);
        Datagrid datagrid = new Datagrid(pageInfo.getTotal(),taskInfos);
        return datagrid;
    }
}
