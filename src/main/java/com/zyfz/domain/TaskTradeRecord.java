package com.zyfz.domain;

import java.util.Date;

public class TaskTradeRecord {
    private Integer id;

    private Integer hhuserid;

    private String tradeType; //要求提价,提价进行帮助,还价同意帮助,进行帮助,接受帮助,完成帮助内容,确认完成帮助内容

    private String content;

    private Double money;

    private Date createTime;

    private Integer hhTaskInfoId;

    public TaskTradeRecord() {
        super();
    }


    public TaskTradeRecord(Integer id, Integer hhuserid, String tradeType, String content, Double money, Date createTime, Integer hhTaskInfoId) {
        this.id = id;
        this.hhuserid = hhuserid;
        this.tradeType = tradeType;
        this.content = content;
        this.money = money;
        this.createTime = createTime;
        this.hhTaskInfoId = hhTaskInfoId;
    }

    public Integer getHhTaskInfoId() {
        return hhTaskInfoId;
    }

    public void setHhTaskInfoId(Integer hhTaskInfoId) {
        this.hhTaskInfoId = hhTaskInfoId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHhuserid() {
        return hhuserid;
    }

    public void setHhuserid(Integer hhuserid) {
        this.hhuserid = hhuserid;
    }

    public String getTradeType() {
        return tradeType;
    }

    public void setTradeType(String tradeType) {
        this.tradeType = tradeType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}