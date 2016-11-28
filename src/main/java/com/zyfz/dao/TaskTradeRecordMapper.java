package com.zyfz.dao;

import com.zyfz.domain.TaskTradeRecord;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TaskTradeRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(TaskTradeRecord record);

    int insertSelective(TaskTradeRecord record);

    TaskTradeRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TaskTradeRecord record);

    int updateByPrimaryKey(TaskTradeRecord record);
}