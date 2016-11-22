package com.zyfz.model;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ron on 16-11-22.
 */
public class AppUserInfoModel {
    private String username;
    private MultipartFile avater;
    private String nickname;
    private String email;
    private String address;
    private String synopsis;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public MultipartFile getAvater() {
        return avater;
    }

    public void setAvater(MultipartFile avater) {
        this.avater = avater;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }
}
