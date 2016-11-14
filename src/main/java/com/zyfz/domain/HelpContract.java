package com.zyfz.domain;

/**
 * 服务状态表
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