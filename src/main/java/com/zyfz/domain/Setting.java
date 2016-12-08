package com.zyfz.domain;

/**
 * 系统设置表
 */
public class Setting {
    private Integer id;

    private String sysType; //类型

    private String typeName; //名字

    private String typeValue; //值

    private String typeDescription; //描述

    public Setting() {
        super();
    }

    public Setting(Integer id) {
        this.id = id;
    }

    public Setting(String sysType, String typeName) {
        this.sysType = sysType;
        this.typeName = typeName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSysType() {
        return sysType;
    }

    public void setSysType(String sysType) {
        this.sysType = sysType;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeValue() {
        return typeValue;
    }

    public void setTypeValue(String typeValue) {
        this.typeValue = typeValue;
    }

    public String getTypeDescription() {
        return typeDescription;
    }

    public void setTypeDescription(String typeDescription) {
        this.typeDescription = typeDescription;
    }
}