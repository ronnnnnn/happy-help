package com.zyfz.domain;

import java.util.Date;

/**
 * 服务消息一级评论表，针对消息进行评论
 */
public class TaskComment {
    private Integer id;

    private String context; //评论内容

    private Integer hhTaskInfoId; //任务消息ID

    private Integer userId;  //评论者id

    private String userNickname; //评论者昵称，冗余字段，提高读取效率

    private Date createTime;

    private User user;

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

    public Integer getHhTaskInfoId() {
        return hhTaskInfoId;
    }

    public void setHhTaskInfoId(Integer hhTaskInfoId) {
        this.hhTaskInfoId = hhTaskInfoId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}