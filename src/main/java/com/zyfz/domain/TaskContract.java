package com.zyfz.domain;

import java.util.Date;

public class TaskContract {
    private Integer id;

    /**
     * 记录任务的状态，
     ++++++++++++++++++++++++++++
     0-3的记录无偿任务的状态，
     0表示用户请求任务，
     1表示任务发布者同意其完成任务，
     2表示请求任务的人完成任务，
     3表示任务发布者完成任务。

     ----无偿任务流程-------------
     0->1->2->3

     +++++++++++++++++++++++++++++
     5用户请求接受任务不提价
     6表示用户申请提价阶段
     7表示发布者还价阶段
     8用户接受议价 (双方达成共识,任务进行,隐含10属性)
     9发布者接受议价 (双方达成共识,任务进行,隐含10属性)
     10表示任务发布者同意其完成任务
     11接受者完成任务
     12发布者确认完成任务

     ----无偿任务,有偿接受  or 有偿任务,提价接受----

     6->9->11->12 (无偿任务,用户有偿接受,发布者接受提价) 一次议价
     6->7->8->11->12(无偿任务,用户有偿接受,发布者还价,用户接受还价) 两次议价
     6->7-6 (用户提价,发布者还价,用户提价,发布者不接受提价,任务终止)三次议价失败
     6->7->6->9->11->12(用户提价,发布者还价,用户提价,发布者接受提价) 三次议价成功

     ----有偿任务不提价流程-------------------------
     5->10->11->12 ()
     */
    private Integer status;

    private Double money;  //记录讨价还价中的价格

    private Integer hhTaskInfoId;  //服务消息

    private String content; //附加内容

    private Integer talkTimes;//讨价还价的次数，不能超过3次

    private Integer hhUserId; //帮助者id

    private Date createTime;

    private TaskInfo taskInfo;

    private User user;

    public TaskContract() {
        super();
    }

    public TaskContract(Integer id, Integer status, Double money, Integer hhTaskInfoId, String content, Integer talkTimes, Integer hhUserId, Date createTime, TaskInfo taskInfo) {
        this.id = id;
        this.status = status;
        this.money = money;
        this.hhTaskInfoId = hhTaskInfoId;
        this.content = content;
        this.talkTimes = talkTimes;
        this.hhUserId = hhUserId;
        this.createTime = createTime;
        this.taskInfo = taskInfo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public TaskInfo getTaskInfo() {
        return taskInfo;
    }

    public void setTaskInfo(TaskInfo taskInfo) {
        this.taskInfo = taskInfo;
    }

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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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