package com.zyfz.dao;

import com.zyfz.domain.HelpContract;

public interface HelpContractMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(HelpContract record);

    int insertSelective(HelpContract record);

    HelpContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HelpContract record);

    int updateByPrimaryKey(HelpContract record);
}