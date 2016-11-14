package com.zyfz.domain;

/**
 * 暂时未用
 */
public class JudgeRecord {
    private Integer id;

    private String helpInfoId;

    private String requireUserId;

    private String serverUserId;

    private Double score;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHelpInfoId() {
        return helpInfoId;
    }

    public void setHelpInfoId(String helpInfoId) {
        this.helpInfoId = helpInfoId;
    }

    public String getRequireUserId() {
        return requireUserId;
    }

    public void setRequireUserId(String requireUserId) {
        this.requireUserId = requireUserId;
    }

    public String getServerUserId() {
        return serverUserId;
    }

    public void setServerUserId(String serverUserId) {
        this.serverUserId = serverUserId;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }
}