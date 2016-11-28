package com.zyfz.service.impl;

import com.zyfz.dao.TaskTradeRecordMapper;
import com.zyfz.domain.TaskTradeRecord;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskTradeRecordService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ron on 16-11-28.
 */
@Service
public class TaskTradeRecordServiceImpl implements ITaskTradeRecordService {

    @Resource
    TaskTradeRecordMapper taskTradeRecordMapper;

    @Override
    public Integer save(TaskTradeRecord taskTradeRecord) {
        return taskTradeRecordMapper.insertSelective(taskTradeRecord);
    }

    @Override
    public Integer update(TaskTradeRecord taskTradeRecord) {
        return taskTradeRecordMapper.updateByPrimaryKey(taskTradeRecord);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public TaskTradeRecord getOneById(TaskTradeRecord taskTradeRecord) {
        return taskTradeRecordMapper.selectByPrimaryKey(taskTradeRecord.getId());
    }

    @Override
    public Integer deleteOneById(TaskTradeRecord taskTradeRecord) {
        return taskTradeRecordMapper.deleteByPrimaryKey(taskTradeRecord.getId());
    }
}
