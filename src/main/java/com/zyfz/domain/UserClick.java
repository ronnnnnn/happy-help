package com.zyfz.domain;

/**
 * 用户点赞表
 */
public class UserClick {
    private Integer id;

    private String userId; //点赞用户id

    private Integer hhArticleId; //文章ID

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getHhArticleId() {
        return hhArticleId;
    }

    public void setHhArticleId(Integer hhArticleId) {
        this.hhArticleId = hhArticleId;
    }
}