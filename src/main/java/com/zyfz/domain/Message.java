package com.zyfz.domain;

public class Message {
    private Integer id;

    private String type;

    private String title;

    private String message;

    private String callbackRegid;

    private String callbackAlias;

    private String callbackTopic;

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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCallbackRegid() {
        return callbackRegid;
    }

    public void setCallbackRegid(String callbackRegid) {
        this.callbackRegid = callbackRegid;
    }

    public String getCallbackAlias() {
        return callbackAlias;
    }

    public void setCallbackAlias(String callbackAlias) {
        this.callbackAlias = callbackAlias;
    }

    public String getCallbackTopic() {
        return callbackTopic;
    }

    public void setCallbackTopic(String callbackTopic) {
        this.callbackTopic = callbackTopic;
    }
}