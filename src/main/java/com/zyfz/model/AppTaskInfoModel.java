package com.zyfz.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ron on 16-11-16.
 */
public class AppTaskInfoModel {

    private String username;
    private String assistanceContent;
    private int assistanceType;//发布类型0为有偿求助，1为无偿求助
    private MultipartFile[] images; //图片
    private String contactLocation; //联系地址
    private String contactPhone; //联系手机号
    private String money; //求助时付给帮助人的金额
    private String province; //省
    private String city;  //市
    private String area;  //区
    private String street;  //街道
    private String categoryName;
//    private Boolean isTop;
//    private String topTime;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAssistanceContent() {
        return assistanceContent;
    }

    public void setAssistanceContent(String assistanceContent) {
        this.assistanceContent = assistanceContent;
    }

    public int getAssistanceType() {
        return assistanceType;
    }

    public void setAssistanceType(int assistanceType) {
        this.assistanceType = assistanceType;
    }

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }

    public String getContactLocation() {
        return contactLocation;
    }

    public void setContactLocation(String contactLocation) {
        this.contactLocation = contactLocation;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

//    public Boolean getIsTop() {
//        return isTop;
//    }
//
//    public void setIsTop(Boolean isTop) {
//        this.isTop = isTop;
//    }
//
//    public String getTopTime() {
//        return topTime;
//    }
//
//    public void setTopTime(String topTime) {
//        this.topTime = topTime;
//    }
}
