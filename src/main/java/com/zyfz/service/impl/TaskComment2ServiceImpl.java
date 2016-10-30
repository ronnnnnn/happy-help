package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.TaskComment2Mapper;
import com.zyfz.domain.TaskComment2;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskComment2Service;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-29.
 */
@Service
public class TaskComment2ServiceImpl implements ITaskComment2Service {

    @Resource
    TaskComment2Mapper taskComment2Mapper;

    @Override
    public Integer save(TaskComment2 taskComment2) {
        taskComment2.setCreateTime(new Date());
        return taskComment2Mapper.insertSelective(taskComment2);
    }

    @Override
    public Integer update(TaskComment2 taskComment2) {
        return taskComment2Mapper.updateByPrimaryKey(taskComment2);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskComment2> taskComment2s = taskComment2Mapper.selectAll();
        PageInfo pageInfo = new PageInfo(taskComment2s);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskComment2s);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public TaskComment2 getOneById(TaskComment2 taskComment2) {
        return taskComment2Mapper.selectByPrimaryKey(taskComment2.getId());
    }

    @Override
    public Integer deleteOneById(TaskComment2 taskComment2) {
        return taskComment2Mapper.deleteByPrimaryKey(taskComment2.getId());
    }

    @Override
    public Datagrid getListByCommentId(Integer commentId,PageModel pageModel) {
//        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<TaskComment2> taskComment2s = taskComment2Mapper.selectByCommentId(commentId);
        PageInfo pageInfo = new PageInfo(taskComment2s);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(taskComment2s);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }
}
