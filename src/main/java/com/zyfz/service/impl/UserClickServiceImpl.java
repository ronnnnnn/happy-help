package com.zyfz.service.impl;

import com.zyfz.dao.UserClickMapper;
import com.zyfz.domain.UserClick;
import com.zyfz.model.Datagrid;
import com.zyfz.model.PageModel;
import com.zyfz.service.IUserClickService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ron on 16-12-9.
 */
@Service
public class UserClickServiceImpl implements IUserClickService {

    @Resource
    UserClickMapper userClickMapper;

    @Override
    public Integer save(UserClick userClick) {
        return userClickMapper.insertSelective(userClick);
    }

    @Override
    public Integer update(UserClick userClick) {
        return userClickMapper.updateByPrimaryKeySelective(userClick);
    }

    @Override
    public Datagrid getAll(PageModel pageModel) {
        return null;
    }

    @Override
    public UserClick getOneById(UserClick userClick) {
        return userClickMapper.selectByPrimaryKey(userClick.getId());
    }

    @Override
    public Integer deleteOneById(UserClick userClick) {
        return userClickMapper.deleteByPrimaryKey(userClick.getId());
    }

    @Override
    public UserClick getByUserAndArticle(Integer userId,Integer articleId) {
        return userClickMapper.selectByUserIdAndArticleId(userId,articleId);
    }

    @Override
    public List<UserClick> getByArticle(Integer articleId) {
        return userClickMapper.selectByArticleId(articleId);
    }
}