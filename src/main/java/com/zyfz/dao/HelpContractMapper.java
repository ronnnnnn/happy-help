package com.zyfz.dao;

import com.zyfz.domain.HelpContract;

import java.util.List;

public interface HelpContractMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(HelpContract record);

    int insertSelective(HelpContract record);

    HelpContract selectByPrimaryKey(Integer id);

    List<HelpContract> selectByHelpInfo(Integer helpInfoId);

    HelpContract selectByHelpInfoAndUserV1(HelpContract helpContract);

    HelpContract selectByHelpInfoAndUserV2(HelpContract helpContract);

    int updateByPrimaryKeySelective(HelpContract record);

    int updateByPrimaryKey(HelpContract record);
}