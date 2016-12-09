package com.zyfz.domain;

import java.util.Date;

public class MoneyRecord {
    private Integer id;

    private String tradeOrderNo;

    private Integer hhUserId;

    private Double money;

    private String paidType;

    private String descript;

    private Boolean isValied;

    private Date createTime;

    private User user;

    public MoneyRecord() {
        super();
    }

    public MoneyRecord(Integer id, String tradeOrderNo, Integer hhUserId, Double money, String paidType, String descript, Boolean isvalied, Date createTime) {
        this.id = id;
        this.tradeOrderNo = tradeOrderNo;
        this.hhUserId = hhUserId;
        this.money = money;
        this.paidType = paidType;
        this.descript = descript;
        this.isValied = isvalied;
        this.createTime = createTime;
    }

    public MoneyRecord(Integer id) {
        this.id = id;
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

    public String getTradeOrderNo() {
        return tradeOrderNo;
    }

    public void setTradeOrderNo(String tradeOrderNo) {
        this.tradeOrderNo = tradeOrderNo;
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

    public String getPaidType() {
        return paidType;
    }

    public void setPaidType(String paidType) {
        this.paidType = paidType;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public Boolean getIsValied() {
        return isValied;
    }

    public void setIsValied(Boolean isvalied) {
        this.isValied = isvalied;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}