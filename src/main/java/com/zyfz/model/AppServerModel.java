package com.zyfz.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ron on 16-12-3.
 */
public class AppServerModel {
    private Integer userId;//（int）	用户id
    private String content;//（String）	服务内容
    private String category;//（String）	服务类别
    private String address;//（String）	地址（格式：省，市，区）
    private String detailAddress;//（String）	详细地址（包括街道地址，没有则为空串）
    private String contactPhone;//（String）  //联系电话
    private String title;
    private MultipartFile[] images;//（Multipart）	图片

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }
}
