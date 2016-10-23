package com.zyfz.domain;

import java.util.Date;

public class Prize {
    private Integer id;

    private String prizeNum;

    private Double prizeMoney;

    private String userIds;

    private String userNames;

    private String hhPhones;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrizeNum() {
        return prizeNum;
    }

    public void setPrizeNum(String prizeNum) {
        this.prizeNum = prizeNum;
    }

    public Double getPrizeMoney() {
        return prizeMoney;
    }

    public void setPrizeMoney(Double prizeMoney) {
        this.prizeMoney = prizeMoney;
    }

    public String getUserIds() {
        return userIds;
    }

    public void setUserIds(String userIds) {
        this.userIds = userIds;
    }

    public String getUserNames() {
        return userNames;
    }

    public void setUserNames(String userNames) {
        this.userNames = userNames;
    }

    public String getHhPhones() {
        return hhPhones;
    }

    public void setHhPhones(String hhPhones) {
        this.hhPhones = hhPhones;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}