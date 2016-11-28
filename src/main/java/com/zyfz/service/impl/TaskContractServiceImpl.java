package com.zyfz.service.impl;

import com.zyfz.dao.TaskContractMapper;
import com.zyfz.domain.TaskContract;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ITaskContractService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by ron on 16-11-28.
 */
@Service
public class TaskContractServiceImpl implements ITaskContractService {
    @Resource
    TaskContractMapper taskContractMapper;

    @Override
    public Integer save(TaskContract taskContract) {
        return taskContractMapper.insertSelective(taskContract);
    }

    @Override
    public Integer update(TaskContract taskContract) {
        return taskContractMapper.updateByPrimaryKeySelective(taskContract);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public TaskContract getOneById(TaskContract taskContract) {
        return taskContractMapper.selectByPrimaryKey(taskContract.getId());
    }

    @Override
    public Integer deleteOneById(TaskContract taskContract) {
        return taskContractMapper.deleteByPrimaryKey(taskContract.getId());
    }

    @Override
    public TaskContract getByHhUserIdAndTaskInfoId(TaskContract taskContract) {
        return taskContractMapper.selectByHhUserIdAndTaskInfoId(taskContract);
    }
}
