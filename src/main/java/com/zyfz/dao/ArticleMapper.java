package com.zyfz.dao;

import com.zyfz.domain.Article;

import java.util.List;

public interface ArticleMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    List<Article> selectAll();

    List<Article> selectAllWithUser();

    List<Article> selectByTitleLike(String title);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);
}