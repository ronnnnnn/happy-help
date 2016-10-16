package com.zyfz.dao;

import com.zyfz.domain.JudgeRecord;

public interface JudgeRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(JudgeRecord record);

    int insertSelective(JudgeRecord record);

    JudgeRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JudgeRecord record);

    int updateByPrimaryKey(JudgeRecord record);
}