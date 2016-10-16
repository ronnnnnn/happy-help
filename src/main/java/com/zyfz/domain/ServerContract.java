package com.zyfz.domain;

public class ServerContract {
    private Integer id;

    private String detail;

    private Integer status;

    private Integer hhServerInfoId;

    private Integer hhUserId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getHhServerInfoId() {
        return hhServerInfoId;
    }

    public void setHhServerInfoId(Integer hhServerInfoId) {
        this.hhServerInfoId = hhServerInfoId;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }
}