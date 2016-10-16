package com.zyfz.dao;

import com.zyfz.domain.UserClick;

public interface UserClickMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(UserClick record);

    int insertSelective(UserClick record);

    UserClick selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserClick record);

    int updateByPrimaryKey(UserClick record);
}