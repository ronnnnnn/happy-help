package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.ArticleMapper;
import com.zyfz.dao.CommentMapper;
import com.zyfz.domain.Article;
import com.zyfz.domain.Comment;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-10-26.
 */
@Service
public class ArticleServiceImpl implements IArticleService {

    @Resource
    ArticleMapper articleMapper;

    @Resource
    CommentMapper commentMapper;

    @Override
    public Integer save(Article article) {
        return articleMapper.insertSelective(article);
    }

    @Override
    public Datagrid getAllAritcleWithUser(PageModel pageModel) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Article> articles = articleMapper.selectAllWithUser();
        PageInfo pageInfo = new PageInfo(articles);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(articles);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Integer update(Article article) {
        return articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public Article getOneById(Article article) {
        return articleMapper.selectByPrimaryKey(article.getId());
    }

    @Override
    public Integer deleteOneById(Article article) {
        List<Comment> comments = commentMapper.selectCommentWithUserByTypeId(article.getId(),"1");
        if (comments.size() != 0) {
            for (Comment comment : comments) {
                commentMapper.deleteByPrimaryKey(comment.getId());
            }
        }
        return articleMapper.deleteByPrimaryKey(article.getId());
    }

    @Override
    public Datagrid getArticlByContextLike(PageModel pageModel,String title) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mytitle = "%" + title + "%";
        List<Article> articles = articleMapper.selectByTitleLike(mytitle);
        PageInfo pageInfo = new PageInfo(articles);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(articles);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }

    @Override
    public Datagrid getWithUserInApp(PageModel pageModel, Article article) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        List<Article> articles = articleMapper.selectWithUserInApp(article);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        Datagrid datagrid = new Datagrid(pageInfo.getTotal(),articles);
        return datagrid;
    }
}
