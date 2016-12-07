package com.zyfz.model;

/**
 * Created by ron on 16-12-6.
 */
public class AppServerContractModel {
    private Integer userId; //预约该服务的用户id
    private Integer serviceId; //被预约的服务Id
    private Integer status;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
