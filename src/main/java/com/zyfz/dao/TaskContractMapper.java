package com.zyfz.dao;

import com.zyfz.domain.TaskContract;

public interface TaskContractMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskContract record);

    int insertSelective(TaskContract record);

    TaskContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskContract record);

    int updateByPrimaryKey(TaskContract record);
}