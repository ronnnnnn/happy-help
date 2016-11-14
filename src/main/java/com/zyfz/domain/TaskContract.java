package com.zyfz.domain;

import java.util.Date;

/**
 * 服务消息状态表
 */
public class TaskContract {
    private Integer id;

    /**
     * 记录任务的状态，
     0-3的记录无偿任务的状态，
     0表示用户请求任务，
     1表示任务发布者同意其完成任务，
     2表示请求任务的人完成任务，
     3表示任务发布者完成任务。

     5以后记录有偿任务状态。
     6表示用户申请提价阶段
     7表示发布者还价阶段
     8用户接受议价
     9发布者接受议价
     10接受者完成renwu
     11发布者确认完成任务
     */
    private Integer status;

    private String money;  //记录讨价还价中的价格

    private Integer hhTaskInfoId;  //服务消息

    private Integer talkTimes;  //讨价还价的次数，不能超过3次

    private Integer hhUserId;  //提供服务者信息

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