package com.zyfz.dao;

import com.zyfz.domain.ServerContract;

public interface ServerContractMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(ServerContract record);

    int insertSelective(ServerContract record);

    ServerContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ServerContract record);

    int updateByPrimaryKey(ServerContract record);
}