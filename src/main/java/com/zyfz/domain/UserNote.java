package com.zyfz.domain;

import java.util.Date;

public class UserNote {
    private Integer id;

    private Integer hhUserId;

    private String content;

    private Date createTime;

    private User user;

    public UserNote() {
        super();
    }

    public UserNote(Integer id) {
        this.id = id;
    }

    public UserNote(Integer hhUserId, String content, Date createTime, User user) {
        this.hhUserId = hhUserId;
        this.content = content;
        this.createTime = createTime;
        this.user = user;
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

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}