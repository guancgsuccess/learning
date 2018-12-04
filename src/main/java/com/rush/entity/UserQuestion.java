package com.rush.entity;

import java.io.Serializable;

/**
 * user_question
 * @author 
 */
public class UserQuestion implements Serializable {
    /**
     * 答题id
     */
    private Integer userQuestionId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 题目正确与否(0代表正确1代表错误)
     */
    private Integer questionCorrect;

    /**
     * 已做题目状态
     */
    private Integer questionAnsweredStatus;

    /**
     * 备用
     */
    private String userQuestionSpare;

    private static final long serialVersionUID = 1L;

    public Integer getUserQuestionId() {
        return userQuestionId;
    }

    public void setUserQuestionId(Integer userQuestionId) {
        this.userQuestionId = userQuestionId;
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

    public Integer getQuestionCorrect() {
        return questionCorrect;
    }

    public void setQuestionCorrect(Integer questionCorrect) {
        this.questionCorrect = questionCorrect;
    }

    public Integer getQuestionAnsweredStatus() {
        return questionAnsweredStatus;
    }

    public void setQuestionAnsweredStatus(Integer questionAnsweredStatus) {
        this.questionAnsweredStatus = questionAnsweredStatus;
    }

    public String getUserQuestionSpare() {
        return userQuestionSpare;
    }

    public void setUserQuestionSpare(String userQuestionSpare) {
        this.userQuestionSpare = userQuestionSpare;
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
        UserQuestion other = (UserQuestion) that;
        return (this.getUserQuestionId() == null ? other.getUserQuestionId() == null : this.getUserQuestionId().equals(other.getUserQuestionId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getQuestionId() == null ? other.getQuestionId() == null : this.getQuestionId().equals(other.getQuestionId()))
            && (this.getQuestionCorrect() == null ? other.getQuestionCorrect() == null : this.getQuestionCorrect().equals(other.getQuestionCorrect()))
            && (this.getQuestionAnsweredStatus() == null ? other.getQuestionAnsweredStatus() == null : this.getQuestionAnsweredStatus().equals(other.getQuestionAnsweredStatus()))
            && (this.getUserQuestionSpare() == null ? other.getUserQuestionSpare() == null : this.getUserQuestionSpare().equals(other.getUserQuestionSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserQuestionId() == null) ? 0 : getUserQuestionId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getQuestionId() == null) ? 0 : getQuestionId().hashCode());
        result = prime * result + ((getQuestionCorrect() == null) ? 0 : getQuestionCorrect().hashCode());
        result = prime * result + ((getQuestionAnsweredStatus() == null) ? 0 : getQuestionAnsweredStatus().hashCode());
        result = prime * result + ((getUserQuestionSpare() == null) ? 0 : getUserQuestionSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userQuestionId=").append(userQuestionId);
        sb.append(", userId=").append(userId);
        sb.append(", questionId=").append(questionId);
        sb.append(", questionCorrect=").append(questionCorrect);
        sb.append(", questionAnsweredStatus=").append(questionAnsweredStatus);
        sb.append(", userQuestionSpare=").append(userQuestionSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}