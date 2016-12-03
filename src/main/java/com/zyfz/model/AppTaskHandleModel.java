package com.zyfz.model;

/**
 * Created by ron on 16-12-3.
 */
public class AppTaskHandleModel {
    private Integer bargainingId;
    private Integer userIdOfBargaining;
    private Integer userIdOfAssistance;
    private String bargainingContent;
    private Double bargainingMoney;
    private Integer status;

    public Integer getBargainingId() {
        return bargainingId;
    }

    public void setBargainingId(Integer bargainingId) {
        this.bargainingId = bargainingId;
    }

    public Integer getUserIdOfBargaining() {
        return userIdOfBargaining;
    }

    public void setUserIdOfBargaining(Integer userIdOfBargaining) {
        this.userIdOfBargaining = userIdOfBargaining;
    }

    public Integer getUserIdOfAssistance() {
        return userIdOfAssistance;
    }

    public void setUserIdOfAssistance(Integer userIdOfAssistance) {
        this.userIdOfAssistance = userIdOfAssistance;
    }

    public String getBargainingContent() {
        return bargainingContent;
    }

    public void setBargainingContent(String bargainingContent) {
        this.bargainingContent = bargainingContent;
    }

    public Double getBargainingMoney() {
        return bargainingMoney;
    }

    public void setBargainingMoney(Double bargainingMoney) {
        this.bargainingMoney = bargainingMoney;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
