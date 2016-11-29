package com.zyfz.dao;

import com.zyfz.domain.SystemMessage;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemMessageMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(SystemMessage record);

    int insertSelective(SystemMessage record);

    SystemMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SystemMessage record);

    int updateByPrimaryKey(SystemMessage record);

    List<SystemMessage> selectByUserId(SystemMessage systemMessage);
}