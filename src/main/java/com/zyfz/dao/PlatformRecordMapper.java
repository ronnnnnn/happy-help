package com.zyfz.dao;

import com.zyfz.domain.PlatformRecord;

public interface PlatformRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(PlatformRecord record);

    int insertSelective(PlatformRecord record);

    PlatformRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PlatformRecord record);

    int updateByPrimaryKey(PlatformRecord record);
}