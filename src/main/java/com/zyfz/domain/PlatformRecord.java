package com.zyfz.domain;

import java.util.Date;

public class PlatformRecord {
    private Integer id;

    private String recordType; //收入或支出对应的模块,紧急求助推送服务费(helpInfo),紧急求助推送服务费退还(helpInfoReturn),普通求助置顶费(taskInfoTop),普通求助手续费(taskInfoFee),普通求助金额暂存收支(taskInfoTemp)

    private String incomeType; //记录平台收入或支出

    private Integer targetId;

    private Integer hhUserId;

    private Double money;

    private String description;

    private Date createTime;

    private Integer contractId;

    private User user;

    public PlatformRecord() {
        super();
    }

    public PlatformRecord(Integer id) {
        this.id = id;
    }

    public PlatformRecord(String recordType, String incomeType, Integer targetId, Integer hhUserId, Double money, String description, Date createTime, Integer contractId) {
        this.recordType = recordType;
        this.incomeType = incomeType;
        this.targetId = targetId;
        this.hhUserId = hhUserId;
        this.money = money;
        this.description = description;
        this.createTime = createTime;
        this.contractId = contractId;
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

    public String getRecordType() {
        return recordType;
    }

    public void setRecordType(String recordType) {
        this.recordType = recordType;
    }

    public String getIncomeType() {
        return incomeType;
    }

    public void setIncomeType(String incomeType) {
        this.incomeType = incomeType;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getContractId() {
        return contractId;
    }

    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }
}