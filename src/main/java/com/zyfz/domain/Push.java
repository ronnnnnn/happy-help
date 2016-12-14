package com.zyfz.domain;

public class Push {
    private Integer id;

    private Integer hhUserId;

    private String country;

    private String province;

    private String city;

    private String area;

    private String street;

    private String alias;

    private String regid;

    private String topic;

    private String[] topics;

    public String[] getTopics() {
        if (topic != null){
            return topic.split(",");
        }else {
            return null;
        }
    }

    public Push() {
        super();
    }

    public Push(Integer id) {
        this.id = id;
    }

    public Push(Integer hhUserId, String country, String province, String city, String area, String street, String alias, String regid, String topic) {
        this.hhUserId = hhUserId;
        this.country = country;
        this.province = province;
        this.city = city;
        this.area = area;
        this.street = street;
        this.alias = alias;
        this.regid = regid;
        this.topic = topic;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getRegid() {
        return regid;
    }

    public void setRegid(String regid) {
        this.regid = regid;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }
}