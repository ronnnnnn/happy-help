package com.zyfz.dao;

import com.zyfz.domain.AreaRange;

//该表废弃，范围属性统一集中到系统属性设置
public interface AreaRangeMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(AreaRange record);

    int insertSelective(AreaRange record);

    AreaRange selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AreaRange record);

    int updateByPrimaryKey(AreaRange record);
}