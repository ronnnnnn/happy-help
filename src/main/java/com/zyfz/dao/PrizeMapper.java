package com.zyfz.dao;

import com.zyfz.domain.Prize;

public interface PrizeMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Prize record);

    int insertSelective(Prize record);

    Prize selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Prize record);

    int updateByPrimaryKey(Prize record);
}