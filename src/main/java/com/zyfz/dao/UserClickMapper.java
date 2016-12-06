package com.zyfz.dao;

import com.zyfz.domain.UserClick;

import java.util.List;

public interface UserClickMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(UserClick record);

    int insertSelective(UserClick record);

    UserClick selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserClick record);

    int updateByPrimaryKey(UserClick record);

    List<UserClick> selectByArticleId(Integer articleId);
}