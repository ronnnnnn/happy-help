package com.zyfz.dao;

import com.zyfz.domain.PlatformRecord;
import com.zyfz.model.AppPlatformModel;

import java.util.List;

public interface PlatformRecordMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(PlatformRecord record);

    int insertSelective(PlatformRecord record);

    PlatformRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PlatformRecord record);

    int updateByPrimaryKey(PlatformRecord record);

    List<PlatformRecord> selectWithParam(AppPlatformModel record);

    List<PlatformRecord> selectAll();

    Double selectSumMoney(String incomeType);

    Double selectSumMoneyTemp(String incomeType);
}