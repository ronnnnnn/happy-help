package com.zyfz.domain;

/**
 * 服务状态表
 */
public class ServerContract {
    private Integer id;

    private String detail;  //客户要求详情
    /**
     * 记录订单的状态
     *  0表示用户预约服务
     *  1表示服务提供者接单并服务中
     *  2表示服务提供商完成服务
     *  3用户确认服务
     */
    private Integer status;

    private Integer hhServerInfoId; //服务

    private Integer hhUserId; //预约服务者

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