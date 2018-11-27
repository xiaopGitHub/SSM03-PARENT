package com.xp.vo;


public class Comment {
    private Integer cId;

    private Integer bId;

    private String context;

    private String commentDate;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public Integer getbId() {
        return bId;
    }

    public void setbId(Integer bId) {
        this.bId = bId;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "cId=" + cId +
                ", bId=" + bId +
                ", context='" + context + '\'' +
                ", commentDate='" + commentDate + '\'' +
                '}';
    }
}