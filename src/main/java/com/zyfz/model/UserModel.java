package com.zyfz.model;

import com.zyfz.domain.Role;

import java.util.Date;
import java.util.List;

/**
 * Created by ron on 16-11-12.
 */
public class UserModel {

    private Integer id;

    private String username;

    private String phone;

    private String nickname;

    private int grade;

    private Double honerScore;

    private String photo;

    private String sid;


    public UserModel() {
       super();
    }

    public UserModel(Integer id, String username, String phone, String nickname, Double honerScore, String photo,String sid) {
        this.id = id;
        this.username = username;
        this.phone = phone;
        this.nickname = nickname;
        this.honerScore = honerScore;
        this.photo = photo;
        this.sid = sid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getGrade() {
        return this.grade;
    }

    public void setGrade(Double gradeTotal,Integer gradeTimes) {
        int mgrade = 0;
        if (gradeTimes != 0){
            mgrade = gradeTotal.intValue()/gradeTimes;
        }
        this.grade = mgrade;
    }

    public Double getHonerScore() {
        return honerScore;
    }

    public void setHonerScore(Double honerScore) {
        this.honerScore = honerScore;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
}
