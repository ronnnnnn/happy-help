package com.zyfz.dao;

import com.zyfz.domain.Setting;

import java.util.List;

public interface SettingMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Setting record);

    int insertSelective(Setting record);

    List<Setting> selectAll();

    Setting selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Setting record);

    int updateByPrimaryKey(Setting record);
}