package com.zyfz.domain;

import java.util.Date;

public class TaskContract {
    private Integer id;

    private Integer status;

    private String money;

    private Integer hhTaskInfoId;

    private Integer talkTimes;

    private Integer hhUserId;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public Integer getHhTaskInfoId() {
        return hhTaskInfoId;
    }

    public void setHhTaskInfoId(Integer hhTaskInfoId) {
        this.hhTaskInfoId = hhTaskInfoId;
    }

    public Integer getTalkTimes() {
        return talkTimes;
    }

    public void setTalkTimes(Integer talkTimes) {
        this.talkTimes = talkTimes;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}