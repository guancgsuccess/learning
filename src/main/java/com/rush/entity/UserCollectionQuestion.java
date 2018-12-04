package com.rush.entity;

import java.io.Serializable;

/**
 * user_collection_question
 * @author 
 */
public class UserCollectionQuestion implements Serializable {
    /**
     * 题目收藏id
     */
    private Integer userCollectionQuestionId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 题目收藏状态
     */
    private Integer userCollectionQuestionStatus;

    /**
     * 备用
     */
    private String userCollectionQuestionSpare;

    private static final long serialVersionUID = 1L;

    public Integer getUserCollectionQuestionId() {
        return userCollectionQuestionId;
    }

    public void setUserCollectionQuestionId(Integer userCollectionQuestionId) {
        this.userCollectionQuestionId = userCollectionQuestionId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Integer getUserCollectionQuestionStatus() {
        return userCollectionQuestionStatus;
    }

    public void setUserCollectionQuestionStatus(Integer userCollectionQuestionStatus) {
        this.userCollectionQuestionStatus = userCollectionQuestionStatus;
    }

    public String getUserCollectionQuestionSpare() {
        return userCollectionQuestionSpare;
    }

    public void setUserCollectionQuestionSpare(String userCollectionQuestionSpare) {
        this.userCollectionQuestionSpare = userCollectionQuestionSpare;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        UserCollectionQuestion other = (UserCollectionQuestion) that;
        return (this.getUserCollectionQuestionId() == null ? other.getUserCollectionQuestionId() == null : this.getUserCollectionQuestionId().equals(other.getUserCollectionQuestionId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getQuestionId() == null ? other.getQuestionId() == null : this.getQuestionId().equals(other.getQuestionId()))
            && (this.getUserCollectionQuestionStatus() == null ? other.getUserCollectionQuestionStatus() == null : this.getUserCollectionQuestionStatus().equals(other.getUserCollectionQuestionStatus()))
            && (this.getUserCollectionQuestionSpare() == null ? other.getUserCollectionQuestionSpare() == null : this.getUserCollectionQuestionSpare().equals(other.getUserCollectionQuestionSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserCollectionQuestionId() == null) ? 0 : getUserCollectionQuestionId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getQuestionId() == null) ? 0 : getQuestionId().hashCode());
        result = prime * result + ((getUserCollectionQuestionStatus() == null) ? 0 : getUserCollectionQuestionStatus().hashCode());
        result = prime * result + ((getUserCollectionQuestionSpare() == null) ? 0 : getUserCollectionQuestionSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userCollectionQuestionId=").append(userCollectionQuestionId);
        sb.append(", userId=").append(userId);
        sb.append(", questionId=").append(questionId);
        sb.append(", userCollectionQuestionStatus=").append(userCollectionQuestionStatus);
        sb.append(", userCollectionQuestionSpare=").append(userCollectionQuestionSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}