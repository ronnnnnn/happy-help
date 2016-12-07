package com.zyfz.dao;

import com.zyfz.domain.MoneyRecord;

import java.util.List;

public interface MoneyRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(MoneyRecord record);

    int insertSelective(MoneyRecord record);

    MoneyRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MoneyRecord record);

    int updateByPrimaryKey(MoneyRecord record);

    List<MoneyRecord> selectAll();
}