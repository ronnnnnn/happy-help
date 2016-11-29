package com.zyfz.dao;

import com.zyfz.domain.TaskContract;

import java.util.List;

import com.zyfz.domain.TaskInfo;
import org.apache.ibatis.annotations.Param;

public interface TaskContractMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskContract record);

    int insertSelective(TaskContract record);

    TaskContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskContract record);

    int updateByPrimaryKey(TaskContract record);

    TaskContract selectByHhUserIdAndTaskInfoId(TaskContract taskContract);

    List<TaskContract> selectByTaskInfoId(Integer taskInfoId);
}