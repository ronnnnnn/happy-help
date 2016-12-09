package com.zyfz.service;

import com.zyfz.domain.UserClick;

import java.util.List;

/**
 * Created by ron on 16-12-9.
 */
public interface IUserClickService extends IBaseService<UserClick> {

    public UserClick getByUserAndArticle(Integer userId,Integer articleId);

    public List<UserClick> getByArticle(Integer articleId);

}
