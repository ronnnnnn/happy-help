package com.zyfz.domain;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 公共服务表
 */
public class ServerInfo {
    private Integer id;

    private String title; //题目

    private String context; //内容

    private String phone; //电话

    private Date createTime;

    private Integer hhUserId;

    /**
    * 是否通过审核
    */
    private Boolean isPass;

    /**
    * 是否下架
    */
    private Boolean isDeleted;

    private Integer hhCategoryId;

    /**
    * 服务所在国
    */
    private String country;

    /**
    * 服务所在省
    */
    private String province;

    private String city;

    private String area;

    private String street;

    /**
    * 详细地址
    */
    private String address;

    private User user;

    private String imageUrl;

    private String categoryName;

    private Boolean isImages;

    private String[] imageUrls;

    public String getCategoryName() {
        return categoryName;
    }

    private String detailAddress;

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public ServerInfo() {
        super();
    }

    public ServerInfo(Integer id) {
        this.id = id;
    }

    public String getDetailAddress() {
        List<String> da = new ArrayList<String>();
        if (country != null){
            da.add(country);
        }
        if (province != null){
            da.add(province);
        }
        if (city != null){
            da.add(city);
        }
        if (area != null){
            da.add(area);
        }
        if (street != null){
            da.add(street);
        }
        if (address != null){
            da.add(address);
        }
        return StringUtils.collectionToDelimitedString(da,",");
    }

    public Boolean getIsImages() {
        if (imageUrl == null || imageUrl.intern() != "none".intern()){
            return false;
        } else{
            return true;
        }
    }

    public String[] getImageUrls() {
            if(imageUrl == null || imageUrl.intern() == "none".intern()){
            String[] strings = {"none"};
            return strings;
        } else {
            return imageUrl.split(",");
        }
    }

    //    public Boolean getIsImages() {
//        if (imageUrl == null && imageUrl.intern() != "none".intern()){
//            return false;
//        } else{
//            return true;
//        }
//    }
//
//    public String[] getImageUrls() {
//        if(imageUrl == null || imageUrl.intern() == "none".intern()){
//            String[] strings = {"none"};
//            return strings;
//        } else {
//            return imageUrl.split(",");
//        }
//    }
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public Boolean getIsPass() {
        return isPass;
    }

    public void setIsPass(Boolean isPass) {
        this.isPass = isPass;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getHhCategoryId() {
        return hhCategoryId;
    }

    public void setHhCategoryId(Integer hhCategoryId) {
        this.hhCategoryId = hhCategoryId;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


}