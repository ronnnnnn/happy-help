package com.zyfz.domain;

import java.util.Date;

public class TaskComment2 {
    private Integer id;

    private Integer parentUserId;

    private Integer childUserId;

    private String context;

    private String hhTaskInfoId;

    private Integer hhTaskCommentId;

    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentUserId() {
        return parentUserId;
    }

    public void setParentUserId(Integer parentUserId) {
        this.parentUserId = parentUserId;
    }

    public Integer getChildUserId() {
        return childUserId;
    }

    public void setChildUserId(Integer childUserId) {
        this.childUserId = childUserId;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getHhTaskInfoId() {
        return hhTaskInfoId;
    }

    public void setHhTaskInfoId(String hhTaskInfoId) {
        this.hhTaskInfoId = hhTaskInfoId;
    }

    public Integer getHhTaskCommentId() {
        return hhTaskCommentId;
    }

    public void setHhTaskCommentId(Integer hhTaskCommentId) {
        this.hhTaskCommentId = hhTaskCommentId;
    }
}