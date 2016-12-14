package com.zyfz.dao;

import com.zyfz.domain.Push;

import java.util.List;

public interface PushMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Push record);

    int insertSelective(Push record);

    Push selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Push record);

    int updateByPrimaryKey(Push record);

    Push selectByUserId(Integer hhUserId);

    List<Push> selectAll();
}