package com.zyfz.domain;

import java.util.Date;

public class SystemMessage {
    private Integer id;

    private String type;

    private Integer hhuserid;

    private Date createtime;

    private String title;

    private String content;

    private String pagemessage;

    private Boolean isRead;

    public SystemMessage(){
        super();
    }

    public SystemMessage(Integer id) {
        this.id = id;
    }


    public SystemMessage(String type, Integer hhuserid, Date createtime, String title, String content, String pagemessage) {
        this.type = type;
        this.hhuserid = hhuserid;
        this.createtime = createtime;
        this.title = title;
        this.content = content;
        this.pagemessage = pagemessage;
    }

    public Boolean getIsRead() {
        return isRead;
    }

    public void setIsRead(Boolean read) {
        isRead = read;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getHhuserid() {
        return hhuserid;
    }

    public void setHhuserid(Integer hhuserid) {
        this.hhuserid = hhuserid;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPagemessage() {
        return pagemessage;
    }

    public void setPagemessage(String pagemessage) {
        this.pagemessage = pagemessage;
    }
}