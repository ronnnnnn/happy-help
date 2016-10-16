package com.zyfz.dao;

import com.zyfz.domain.TaskComment2;

public interface TaskComment2Mapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskComment2 record);

    int insertSelective(TaskComment2 record);

    TaskComment2 selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskComment2 record);

    int updateByPrimaryKey(TaskComment2 record);
}