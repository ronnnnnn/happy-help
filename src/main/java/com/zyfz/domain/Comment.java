package com.zyfz.domain;

import java.util.Date;

/**
 * 评论表，好人好事均用此表
 */
public class Comment {
    private Integer id;

    private String context; //内容

    private String imageUrl; //预留字段

    private Date createTime;

    private Boolean isDeleted; //是否隐藏评论

    private String type; //"1"为好人好事文章的评论,"2"为公共服务的评论

    private Integer typeId;

    private Integer hhUserId;

    private User user;

    public Comment() {
        super();
    }

    public Comment(Integer id) {
        this.id = id;
    }

    public Comment(String context, Date createTime, String type, Integer typeId, Integer hhUserId) {
        this.context = context;
        this.createTime = createTime;
        this.type = type;
        this.typeId = typeId;
        this.hhUserId = hhUserId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }
}