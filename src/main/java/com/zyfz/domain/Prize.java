package com.zyfz.domain;

import java.util.Date;

/**
 * 奖池信息表
 */

public class Prize {
    private Integer id;

    private String prizeNum; //期数

    private Double prizeMoney; //本期中奖金额

    private String userIds;  //中奖人id集合，逗号分开

    private String userNames; //中奖人名字结合，以逗号分开

    private String hhPhones; //中奖人电话号码结合，以逗号分开

    private Date createTime; //创建时间

    private Boolean isLottery; //是否开奖，开奖后数据不允许再修改

    public Boolean getIsLottery() {
        return isLottery;
    }

    public void setIsLottery(Boolean lottory) {
        isLottery = lottory;
    }

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