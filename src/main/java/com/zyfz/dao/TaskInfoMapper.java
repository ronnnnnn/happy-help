package com.zyfz.dao;

import com.zyfz.domain.TaskInfo;

public interface TaskInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskInfo record);

    int insertSelective(TaskInfo record);

    TaskInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskInfo record);

    int updateByPrimaryKey(TaskInfo record);
}