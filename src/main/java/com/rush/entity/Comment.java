package com.rush.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * comment
 * @author 
 */
public class Comment implements Serializable {
    /**
     * 评论id
     */
    private Integer commentId;

    /**
     * 评论题目id
     */
    private Integer commentQuestionId;

    /**
     * 评论用户id
     */
    private Integer commentUserId;

    /**
     * 评论时间
     */
    private Date commentTime;

    /**
     * 评论内容
     */
    private String commentContent;

    /**
     * 评论状态
     */
    private Integer commentStatus;

    /**
     * 备用
     */
    private String commentSpare;

    private static final long serialVersionUID = 1L;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentQuestionId() {
        return commentQuestionId;
    }

    public void setCommentQuestionId(Integer commentQuestionId) {
        this.commentQuestionId = commentQuestionId;
    }

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentUserId) {
        this.commentUserId = commentUserId;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Integer getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(Integer commentStatus) {
        this.commentStatus = commentStatus;
    }

    public String getCommentSpare() {
        return commentSpare;
    }

    public void setCommentSpare(String commentSpare) {
        this.commentSpare = commentSpare;
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
        Comment other = (Comment) that;
        return (this.getCommentId() == null ? other.getCommentId() == null : this.getCommentId().equals(other.getCommentId()))
            && (this.getCommentQuestionId() == null ? other.getCommentQuestionId() == null : this.getCommentQuestionId().equals(other.getCommentQuestionId()))
            && (this.getCommentUserId() == null ? other.getCommentUserId() == null : this.getCommentUserId().equals(other.getCommentUserId()))
            && (this.getCommentTime() == null ? other.getCommentTime() == null : this.getCommentTime().equals(other.getCommentTime()))
            && (this.getCommentContent() == null ? other.getCommentContent() == null : this.getCommentContent().equals(other.getCommentContent()))
            && (this.getCommentStatus() == null ? other.getCommentStatus() == null : this.getCommentStatus().equals(other.getCommentStatus()))
            && (this.getCommentSpare() == null ? other.getCommentSpare() == null : this.getCommentSpare().equals(other.getCommentSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCommentId() == null) ? 0 : getCommentId().hashCode());
        result = prime * result + ((getCommentQuestionId() == null) ? 0 : getCommentQuestionId().hashCode());
        result = prime * result + ((getCommentUserId() == null) ? 0 : getCommentUserId().hashCode());
        result = prime * result + ((getCommentTime() == null) ? 0 : getCommentTime().hashCode());
        result = prime * result + ((getCommentContent() == null) ? 0 : getCommentContent().hashCode());
        result = prime * result + ((getCommentStatus() == null) ? 0 : getCommentStatus().hashCode());
        result = prime * result + ((getCommentSpare() == null) ? 0 : getCommentSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", commentId=").append(commentId);
        sb.append(", commentQuestionId=").append(commentQuestionId);
        sb.append(", commentUserId=").append(commentUserId);
        sb.append(", commentTime=").append(commentTime);
        sb.append(", commentContent=").append(commentContent);
        sb.append(", commentStatus=").append(commentStatus);
        sb.append(", commentSpare=").append(commentSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}