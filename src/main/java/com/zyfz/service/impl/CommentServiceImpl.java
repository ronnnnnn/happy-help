package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.CommentMapper;
import com.zyfz.domain.Comment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.ICommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-10-27.
 */
@Service
public class CommentServiceImpl implements ICommentService{
    @Resource
    CommentMapper commentMapper;

    @Override
    public Integer save(Comment comment) {
        comment.setCreateTime(new Date());
        return commentMapper.insertSelective(comment);
    }

    @Override
    public Integer update(Comment comment) {
        return commentMapper.updateByPrimaryKeySelective(comment);
    }

    @Override
    public Datagrid getCommentWithUserByArticle(Integer articleId, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Comment> comments = commentMapper.selectCommentWithUserByArticle(articleId);
        PageInfo pageInfo = new PageInfo(comments);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(comments);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public Comment getOneById(Comment comment) {
        return commentMapper.selectByPrimaryKey(comment.getId());
    }

    @Override
    public Integer deleteOneById(Comment comment) {
        return commentMapper.deleteByPrimaryKey(comment.getId());
    }

    @Override
    public Datagrid getCommentWithUserByArticleAndKey(Integer articleId, String commentKey, PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mykey = "%" + commentKey + "%";
        List<Comment> comments = commentMapper.selectCommentWithUserByArticleAndKey(articleId,mykey);
        PageInfo pageInfo = new PageInfo(comments);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(comments);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }
}
