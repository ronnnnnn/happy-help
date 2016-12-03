package com.zyfz.domain;

import java.util.Date;

public class OrderRecord {
    private Integer id;

    private String tradeNo;

    private String orderType;

    private String secondType;

    private String payUser;

    private String acceptUser;

    private Double dealMoney;

    private Integer hhTargetId;

    private String descript;

    private Date createTime;

    public OrderRecord(){
        super();
    }

    public OrderRecord(Integer id) {
        this.id = id;
    }

    public OrderRecord(Integer id, String tradeNo, String orderType, String secondType, String payUser, String acceptUser, Double dealMoney, Integer hhTargetId, String descript, Date createTime) {
        this.id = id;
        this.tradeNo = tradeNo;
        this.orderType = orderType;
        this.secondType = secondType;
        this.payUser = payUser;
        this.acceptUser = acceptUser;
        this.dealMoney = dealMoney;
        this.hhTargetId = hhTargetId;
        this.descript = descript;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getSecondType() {
        return secondType;
    }

    public void setSecondType(String secondType) {
        this.secondType = secondType;
    }

    public String getPayUser() {
        return payUser;
    }

    public void setPayUser(String payUser) {
        this.payUser = payUser;
    }

    public String getAcceptUser() {
        return acceptUser;
    }

    public void setAcceptUser(String acceptUser) {
        this.acceptUser = acceptUser;
    }

    public Double getDealMoney() {
        return dealMoney;
    }

    public void setDealMoney(Double dealMoney) {
        this.dealMoney = dealMoney;
    }

    public Integer getHhTargetId() {
        return hhTargetId;
    }

    public void setHhTargetId(Integer hhTargetId) {
        this.hhTargetId = hhTargetId;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}