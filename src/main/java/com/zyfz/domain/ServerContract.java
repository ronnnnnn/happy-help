package com.zyfz.domain;

import java.util.Date;

public class ServerContract {
    private Integer id;

    /**
     * 记录订单的状态
     * 0表示用户下单
     * 1表示服务发布者接单
     * 2表示服务发布者完成订单
     * 3表示用户确认完成
     *
     */
    private Integer status;

    private Integer hhServerInfoId;

    private Integer hhUserId;

    private Double money;

    private String content;

    private String detail;

    private Date createTime;

    private User user;

    public ServerContract() {
        super();
    }

    public ServerContract(Integer id) {
        this.id = id;
    }

    public ServerContract(Integer status, Integer hhUserId) {
        this.status = status;
        this.hhUserId = hhUserId;
    }



    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}