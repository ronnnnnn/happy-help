package com.zyfz.dao;

import com.zyfz.domain.TaskComment2;

import java.util.List;

public interface TaskComment2Mapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskComment2 record);

    int insertSelective(TaskComment2 record);

    TaskComment2 selectByPrimaryKey(Integer id);

    List<TaskComment2> selectAll();

    List<TaskComment2> selectByCommentId(Integer commentId);

    int updateByPrimaryKeySelective(TaskComment2 record);

    int updateByPrimaryKey(TaskComment2 record);
}