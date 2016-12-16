package com.zyfz.dao;

import com.zyfz.domain.ServerContract;
import com.zyfz.domain.ServerInfo;

import java.util.List;

public interface ServerInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(ServerInfo record);

    int insertSelective(ServerInfo record);

    ServerInfo selectByPrimaryKey(Integer id);

    List<ServerInfo> selectByCIDWithUser(Integer categoryId);

    List<ServerInfo> selectByCIDWithUserWithKey(String key);

    int updateByPrimaryKeySelective(ServerInfo record);

    int updateByPrimaryKey(ServerInfo record);

    List<ServerInfo> select4App(ServerInfo serverInfo);

    List<ServerInfo> select4AppInMine(ServerContract serverContract);

    List<ServerInfo> selectByCategory(Integer cid);

}