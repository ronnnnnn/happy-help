package com.zyfz.dao;

import com.zyfz.domain.TaskComment;

import java.util.List;

public interface TaskCommentMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskComment record);

    int insertSelective(TaskComment record);

    TaskComment selectByPrimaryKey(Integer id);

    List<TaskComment> selectByTaskInfoId(Integer taskInfoId);

    int updateByPrimaryKeySelective(TaskComment record);

    int updateByPrimaryKey(TaskComment record);
}