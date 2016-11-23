package com.zyfz.domain;

import com.zyfz.service.ICaptchaService;
import com.zyfz.service.ICategoryService;
import com.zyfz.service.impl.CategoryServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 服务消息发布表
 */

public class TaskInfo {


    private Integer id;

    private String title;//标题

    private String context; //内容

    private String imageUrl; //图片链接

    private Double money; //有偿奖励帮助金额

    private String phone; //手机号

    private Date createTime; //创建时间

    private Date endTime; //置顶结束时间

    private Boolean isFree; //是否无偿

    private Boolean isAccept; //改服务是否被接受

    private Boolean isTop; //是否置顶

    private Boolean isCompeleted; //服务是否完成

    private Boolean isDeleted; //服务是否下架

    private Integer hhCategoryId;  //所属类别Id

    private String categoryName;

    private Integer hhUserId; //发布者id

    private String country; //国

    private String province; //省

    private String city; //市

    private String area; //区

    private String street; //街道

    private String detailPosition;//详细地址

    private User user; //发布任务着

    private List<String> imageUrls[];

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

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
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

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Boolean getIsFree() {
        return isFree;
    }

    public void setIsFree(Boolean isFree) {
        this.isFree = isFree;
    }

    public Boolean getIsAccept() {
        return isAccept;
    }

    public void setIsAccept(Boolean isAccept) {
        this.isAccept = isAccept;
    }

    public Boolean getIsTop() {
        return isTop;
    }

    public void setIsTop(Boolean isTop) {
        this.isTop = isTop;
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

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
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
        return StringUtils.collectionToDelimitedString(da,",");
    }

    public Boolean getIsImage(){
        if (imageUrl == null){
            return false;
        } else if(imageUrl.intern() == "nono".intern()){
            return false;
        }else {
            return true;
        }
    }

    public String[] getImageUrls(){
        if(imageUrl == null){
            String[] strings = {"nono"};
            return strings;
        } else if (imageUrl!=null || imageUrl.intern() != "nono".intern()){
            return imageUrl.split(",");
        }else {
            String[] strings = {"nono"};
            return strings;
        }
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}