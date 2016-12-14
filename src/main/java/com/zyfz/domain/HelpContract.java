package com.zyfz.domain;

import java.util.Date;

/**
 * 服务状态表,整张表可以看成一个大帐号(平台帐号),记录着收入和支出的情况
 */
public class HelpContract {



    private Integer id;

    /**
     * 记录提供帮助的人状态，
     * 0表示记录的该用户愿意提供帮助，
     * 1表示紧急求助者接受其帮助，
     * 2表示提供帮助的人完成任务，
     * 3表示紧急求助着确认任务完成
     */
    private Integer status;

    private Integer hhUserId; //提供帮助的人id

    private Integer hhHelpInfoId; //紧急求助id

    private Date createTime;

    private User user;

    public HelpContract() {
        super();
    }

    public HelpContract(Integer id) {
        this.id = id;
    }

    public HelpContract(Integer hhUserId, Integer hhHelpInfoId) {
        this.hhUserId = hhUserId;
        this.hhHelpInfoId = hhHelpInfoId;
    }

    public HelpContract(Integer status, Integer hhUserId, Integer hhHelpInfoId, Date createTime) {
        this.status = status;
        this.hhUserId = hhUserId;
        this.hhHelpInfoId = hhHelpInfoId;
        this.createTime = createTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public Integer getHhHelpInfoId() {
        return hhHelpInfoId;
    }

    public void setHhHelpInfoId(Integer hhHelpInfoId) {
        this.hhHelpInfoId = hhHelpInfoId;
    }
}