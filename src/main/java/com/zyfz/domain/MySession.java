package com.zyfz.domain;

/**
 * session持久化表
 */

public class MySession {
    private Long id;

    private String cookie;

    private byte[] session;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCookie() {
        return cookie;
    }

    public void setCookie(String cookie) {
        this.cookie = cookie;
    }

    public byte[] getSession() {
        return session;
    }

    public void setSession(byte[] session) {
        this.session = session;
    }
}