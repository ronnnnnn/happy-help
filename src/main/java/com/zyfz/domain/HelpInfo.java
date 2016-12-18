package com.zyfz.domain;

import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 紧急求助表
 */
public class HelpInfo {
    private Integer id;

    private String title;//题目

    private String context;//内容

    private String imageUrl;

    private String phome;//电话，单词拼错了，要修改的太多，暂时不改了

    private String areaRange;  //推送范围

    private Integer hhAreaRangeId; //推送范围id，废弃，范围属性维护统一归纳到系统属性设置

    private Integer hhUserId;  //发布紧急求助消息用户id

    private Integer needUserNumber; //需要求助的人数

    private String applyUserIds; //废弃字段

    private String useUserIds; //废弃字段

    private String compeletedUserIds; //废弃字段

    private Boolean isCompeleted; //是否完成

    private Boolean isDeleted; //是否下架

    private Integer hhCategoryId; //所属类别id

    private Date createTime;

    private String country;  //国

    private String province; //省

    private String city;

    private String area;

    private String street;

    private String detailPosition; //详细地址

    private Integer republishTimes;  //发布时间

    private User user;

    private String categoryName;

    private List<HelpContract> helpContracts;

    public HelpInfo() {
        super();
    }

    public HelpInfo(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public List<HelpContract> getHelpContracts() {
        return helpContracts;
    }

    public void setHelpContracts(List<HelpContract> helpContracts) {
        this.helpContracts = helpContracts;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getPhome() {
        return phome;
    }

    public void setPhome(String phome) {
        this.phome = phome;
    }

    public String getAreaRange() {
        return areaRange;
    }

    public void setAreaRange(String areaRange) {
        this.areaRange = areaRange;
    }

    public Integer getHhAreaRangeId() {
        return hhAreaRangeId;
    }

    public void setHhAreaRangeId(Integer hhAreaRangeId) {
        this.hhAreaRangeId = hhAreaRangeId;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public Integer getNeedUserNumber() {
        return needUserNumber;
    }

    public void setNeedUserNumber(Integer needUserNumber) {
        this.needUserNumber = needUserNumber;
    }

    public String getApplyUserIds() {
        return applyUserIds;
    }

    public void setApplyUserIds(String applyUserIds) {
        this.applyUserIds = applyUserIds;
    }

    public String getUseUserIds() {
        return useUserIds;
    }

    public void setUseUserIds(String useUserIds) {
        this.useUserIds = useUserIds;
    }

    public String getCompeletedUserIds() {
        return compeletedUserIds;
    }

    public void setCompeletedUserIds(String compeletedUserIds) {
        this.compeletedUserIds = compeletedUserIds;
    }

    public Boolean getIsCompeleted() {
        return isCompeleted;
    }

    public void setIsCompeleted(Boolean isCompeleted) {
        this.isCompeleted = isCompeleted;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public String getDetailPosition() {
        return detailPosition;
    }

    public void setDetailPosition(String detailPosition) {
        this.detailPosition = detailPosition;
    }

    public Integer getRepublishTimes() {
        return republishTimes;
    }

    public void setRepublishTimes(Integer republishTimes) {
        this.republishTimes = republishTimes;
    }

    public Boolean getIsImage(){
        if (imageUrl == null || imageUrl.intern() == "none".intern() || imageUrl.intern() == "nono".intern()  ){
            return false;
        } else{
            return true;
        }
    }

    public String[] getImageUrls(){
        if(imageUrl == null || imageUrl.intern() == "none".intern()|| imageUrl.intern() == "nono".intern()){
            String[] strings = {"nono"};
            return strings;
        } else {
            return imageUrl.split(",");
        }
    }

    public String getDetailAddress(){
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
        if (detailPosition != null){
            da.add(detailPosition);
        }
        return StringUtils.collectionToDelimitedString(da,",");
    }
}