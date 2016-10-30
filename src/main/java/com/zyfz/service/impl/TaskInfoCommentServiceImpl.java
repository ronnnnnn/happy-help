package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.TaskComment2Mapper;
import com.zyfz.dao.TaskCommentMapper;
import com.zyfz.domain.TaskComment;
import com.zyfz.domain.TaskComment2;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskCommnetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-29.
 */
@Service
public class TaskInfoCommentServiceImpl implements ITaskCommnetService {
    @Resource
    TaskCommentMapper taskCommentMapper;

    @Resource
    TaskComment2Mapper taskComment2Mapper;

    @Override
    public Integer save(TaskComment taskComment) {
        taskComment.setCreateTime(new Date());
        return taskCommentMapper.insertSelective(taskComment);
    }

    @Override
    public Integer update(TaskComment taskComment) {
        return taskCommentMapper.updateByPrimaryKeySelective(taskComment);
    }

    @Override
    public Datagrid getTaskCommentByTaskId(Integer taskINfoId, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskComment> taskComments = taskCommentMapper.selectByTaskInfoId(taskINfoId);
        PageInfo pageInfo = new PageInfo(taskComments);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskComments);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public TaskComment getOneById(TaskComment taskComment) {
        return taskCommentMapper.selectByPrimaryKey(taskComment.getId());
    }

    @Override
    public Integer deleteOneById(TaskComment taskComment) {
        TaskComment mtastcomment = taskCommentMapper.selectByPrimaryKey(taskComment.getId());
        List<TaskComment2> mtaskComment2 = taskComment2Mapper.selectByCommentId(mtastcomment.getId());
        if(mtaskComment2.size() != 0){
            for (TaskComment2 taskComment2 : mtaskComment2){
                taskComment2Mapper.deleteByPrimaryKey(taskComment2.getId()); //级联删除二级评论
            }
        }
        return taskCommentMapper.deleteByPrimaryKey(taskComment.getId());
    }
}
