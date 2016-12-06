package com.zyfz.domain;

import java.util.Date;
import java.util.List;

/**
 * 好人好事文章表
 */
public class Article {
    private Integer id;

    private String title;

    private String context; //内容

    private String imageUrl;

    private Date createTime;

    private String visitClick; //记录点赞用户

    private Boolean isChecked;

    private Boolean isDeleted; //是否下架

    private Boolean isPass; //是否通过审核

    private Integer hhUserId;

    private User user;

    private Boolean isImage;

    private String[] imageUrls;

    private List<UserClick> userClick;

    private Integer clickNumber;

    public List<UserClick> getUserClick() {
        return userClick;
    }

    public void setUserClick(List<UserClick> userClick) {
        this.userClick = userClick;
    }

    public Integer getClickNumber() {
        if(userClick != null){
            return userClick.size();
        }else {
            return 0;
        }
    }

    public Boolean getIsImage(){
        if (imageUrl == null || imageUrl.intern() == "none".intern()){
            return false;
        } else{
            return true;
        }
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getVisitClick() {
        return visitClick;
    }

    public void setVisitClick(String visitClick) {
        this.visitClick = visitClick;
    }

    public Boolean getIsChecked() {
        return isChecked;
    }

    public void setIsChecked(Boolean isChecked) {
        this.isChecked = isChecked;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Boolean getIsPass() {
        return isPass;
    }

    public void setIsPass(Boolean isPass) {
        this.isPass = isPass;
    }

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String[] getImageUrls(){
        if(imageUrl == null){
            String[] strings = {"nono"};
            return strings;
        } else {
            return imageUrl.split(",");
        }
    }
}