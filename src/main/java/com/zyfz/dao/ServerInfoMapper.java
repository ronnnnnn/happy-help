package com.zyfz.dao;

import com.zyfz.domain.ServerInfo;

public interface ServerInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(ServerInfo record);

    int insertSelective(ServerInfo record);

    ServerInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ServerInfo record);

    int updateByPrimaryKey(ServerInfo record);
}