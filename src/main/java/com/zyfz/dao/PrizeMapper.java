package com.zyfz.dao;

import com.zyfz.domain.Prize;

import java.util.List;

public interface PrizeMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Prize record);

    int insertSelective(Prize record);

    Prize selectByPrimaryKey(Integer id);

    List<Prize> selectAll();

    int updateByPrimaryKeySelective(Prize record);

    int updateByPrimaryKey(Prize record);
}