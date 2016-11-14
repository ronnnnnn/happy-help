package com.zyfz.domain;

import java.util.Date;

/**
 * 服务消息二级评论表，针对人进行评论
 */
public class TaskComment2 {
    private Integer id;

    private Integer parentUserId;//被回复id

    private Integer childUserId;//回复者id

    private String context; //评论内容

    private String hhTaskInfoId; //所属服务消息

    private Integer hhTaskCommentId;//评论id

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