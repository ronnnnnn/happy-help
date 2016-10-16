package com.zyfz.dao;

import com.zyfz.domain.Show;

public interface ShowMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Show record);

    int insertSelective(Show record);

    Show selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Show record);

    int updateByPrimaryKey(Show record);
}