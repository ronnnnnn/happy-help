package com.zyfz.model;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * Created by ron on 16-11-19.
 */
public class AppHelpInfoModel {
    private String username;//用户名
    private String assistanceContent;//求助内容
    private MultipartFile[] images;//图片数组
    private String contactAddress;//详细地址
    private String range;//范围
    private String money;
    private String province;//省份(求助范围)
    private String city;//市区(范围)
    private String area;//区/县(范围)
    private String contactPhone;//联系手机号
    private String maxPersons;//最多需要帮助的人数
    private String categoryName;

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

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

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress;
    }

    public String getRange() {
        return range;
    }

    public void setRange(String range) {
        this.range = range;
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

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getMaxPersons() {
        return maxPersons;
    }

    public void setMaxPersons(String maxPersons) {
        this.maxPersons = maxPersons;
    }
}
