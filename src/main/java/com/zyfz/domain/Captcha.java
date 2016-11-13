package com.zyfz.domain;

import java.util.Date;

public class Captcha {
    private Integer id;

    private String captcha;

    private Date createTime;

    public Captcha() {
        super();
    }

    public Captcha(String captcha, Date createTime) {
        this.captcha = captcha;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}