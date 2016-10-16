package com.zyfz.dao;

import com.zyfz.domain.UserRoleKey;

public interface UserRoleMapper {

    int deleteByPrimaryKey(UserRoleKey key);

    int insert(UserRoleKey record);

    int insertSelective(UserRoleKey record);

}