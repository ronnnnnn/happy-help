package com.zyfz.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 奖池信息表
 */

public class Prize {
    private Integer id;

    private String prizeNum; //期数

    private Double prizeMoney; //本期中奖金额

    private String userIds;  //废弃字段

    private String userNames; //废弃字段

    private String hhPhones; //中奖人电话号码结合，以逗号分开(重荣誉值排名选)

    private String articlePhones; //中奖人电话号码结合，以逗号分开(重文章选)

    private Date createTime; //创建时间

    private Boolean isLottery; //是否开奖，开奖后数据不允许再修改

    private String[] userPhones;

    public Prize(Integer id) {
        this.id = id;
    }
    public Prize() {
        super();
    }

    public List<String> getUserPhones() {
        List<String> users =  new ArrayList<String>();
        if (hhPhones != null){
            String[] muser = getHhPhones().split(",");
            for (String user : muser){
                users.add(user);
            }
        }
        if (articlePhones != null){
            users.add(articlePhones);
        }
        return users;
    }


    public String getArticlePhones() {
        return articlePhones;
    }

    public void setArticlePhones(String articlePhones) {
        this.articlePhones = articlePhones;
    }

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