package com.zyfz.dao;

import com.zyfz.domain.TaskInfo;

import java.util.List;

public interface TaskInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskInfo record);

    int insertSelective(TaskInfo record);

    TaskInfo selectByPrimaryKey(Integer id);

    List<TaskInfo> selectTaskInfoWithUserByCategory(Integer categoryId,Boolean isFree,Boolean isCompeleted , Boolean ids);

    List<TaskInfo> selectTaskInfoWithUserByKey(String taskinfoKey);

    List<TaskInfo> selectAll();

    List<TaskInfo> selectTaskInfoWithUserByCategoryAndStatus(TaskInfo taskInfo);

    int updateByPrimaryKeySelective(TaskInfo record);

    int updateByPrimaryKey(TaskInfo record);
}