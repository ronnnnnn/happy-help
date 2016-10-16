package com.zyfz.dao;

import com.zyfz.domain.RoleResourceKey;

public interface RoleResourceMapper {

    int deleteByPrimaryKey(RoleResourceKey key);

    int insert(RoleResourceKey record);

    int insertSelective(RoleResourceKey record);

}