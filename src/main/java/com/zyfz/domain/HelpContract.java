package com.zyfz.domain;

public class HelpContract {
    private Integer id;

    private Integer status;

    private Integer hhUserId;

    private Integer hhHelpInfoId;

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