package com.zyfz.dao;

import com.zyfz.domain.AreaRange;

public interface AreaRangeMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(AreaRange record);

    int insertSelective(AreaRange record);

    AreaRange selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AreaRange record);

    int updateByPrimaryKey(AreaRange record);
}