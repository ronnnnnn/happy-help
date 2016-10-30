package com.zyfz.dao;

import com.zyfz.domain.HelpInfo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HelpInfoMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(HelpInfo record);

    int insertSelective(HelpInfo record);

    HelpInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HelpInfo record);

    int updateByPrimaryKey(HelpInfo record);
}