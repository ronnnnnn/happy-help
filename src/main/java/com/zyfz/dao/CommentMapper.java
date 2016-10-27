package com.zyfz.dao;

import com.zyfz.domain.Comment;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CommentMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectCommentWithUserByArticle(Integer articleId);

    List<Comment> selectCommentWithUserByArticleAndKey(Integer articleId,String commentKey);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}