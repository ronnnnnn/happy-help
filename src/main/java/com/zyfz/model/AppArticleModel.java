package com.zyfz.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ron on 16-12-7.
 */
public class AppArticleModel {
    private Integer userId;
    private String gooddeedsContent;
    private String gooddeedsTitle;
    private MultipartFile[] images;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getGooddeedsContent() {
        return gooddeedsContent;
    }

    public void setGooddeedsContent(String gooddeedsContent) {
        this.gooddeedsContent = gooddeedsContent;
    }

    public String getGooddeedsTitle() {
        return gooddeedsTitle;
    }

    public void setGooddeedsTitle(String gooddeedsTitle) {
        this.gooddeedsTitle = gooddeedsTitle;
    }

    public MultipartFile[] getImages() {
        return images;
    }

    public void setImages(MultipartFile[] images) {
        this.images = images;
    }
}
