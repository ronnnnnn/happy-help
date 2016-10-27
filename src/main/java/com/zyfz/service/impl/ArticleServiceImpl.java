package com.zyfz.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyfz.dao.ArticleMapper;
import com.zyfz.domain.Article;
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
        return articleMapper.deleteByPrimaryKey(article.getId());
    }

    @Override
    public Datagrid getArticlByTitleLike(PageModel pageModel,String title) {
        PageHelper.startPage(pageModel.getPage(),pageModel.getRows());
        String mytitle = "%" + title + "%";
        List<Article> articles = articleMapper.selectByTitleLike(mytitle);
        PageInfo pageInfo = new PageInfo(articles);
        Datagrid datagrid = new Datagrid();
        datagrid.setRows(articles);
        datagrid.setTotal(pageInfo.getTotal());
        return datagrid;
    }
}
