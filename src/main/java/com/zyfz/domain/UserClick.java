package com.zyfz.domain;

/**
 * 用户点赞表
 */
public class UserClick {
    private Integer id;

    private Integer userId; //点赞用户id

    private Integer hhArticleId; //文章ID

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getHhArticleId() {
        return hhArticleId;
    }

    public void setHhArticleId(Integer hhArticleId) {
        this.hhArticleId = hhArticleId;
    }
}