package com.zyfz.domain;

/**
 * 用户和角色关联表
 */

public class UserRoleKey {
    private Integer hhUserId;

    private Integer hhRoleId;

    public Integer getHhUserId() {
        return hhUserId;
    }

    public void setHhUserId(Integer hhUserId) {
        this.hhUserId = hhUserId;
    }

    public Integer getHhRoleId() {
        return hhRoleId;
    }

    public void setHhRoleId(Integer hhRoleId) {
        this.hhRoleId = hhRoleId;
    }
}