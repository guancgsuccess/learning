package com.rush.entity;

import java.io.Serializable;

/**
 * written_test
 * @author 
 */
public class WrittenTest implements Serializable {
    /**
     * 笔试id
     */
    private Integer writtenTestId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 公司试卷id
     */
    private Integer companyPaperId;

    /**
     * 笔试成绩
     */
    private Integer writtenTestScore;

    /**
     * 笔试状态
     */
    private Integer writtenTestStatus;

    /**
     * 备用
     */
    private String writtenTestSpare;

    private static final long serialVersionUID = 1L;

    public Integer getWrittenTestId() {
        return writtenTestId;
    }

    public void setWrittenTestId(Integer writtenTestId) {
        this.writtenTestId = writtenTestId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getCompanyPaperId() {
        return companyPaperId;
    }

    public void setCompanyPaperId(Integer companyPaperId) {
        this.companyPaperId = companyPaperId;
    }

    public Integer getWrittenTestScore() {
        return writtenTestScore;
    }

    public void setWrittenTestScore(Integer writtenTestScore) {
        this.writtenTestScore = writtenTestScore;
    }

    public Integer getWrittenTestStatus() {
        return writtenTestStatus;
    }

    public void setWrittenTestStatus(Integer writtenTestStatus) {
        this.writtenTestStatus = writtenTestStatus;
    }

    public String getWrittenTestSpare() {
        return writtenTestSpare;
    }

    public void setWrittenTestSpare(String writtenTestSpare) {
        this.writtenTestSpare = writtenTestSpare;
    }

    public WrittenTest(Integer userId, Integer companyId, Integer companyPaperId, Integer writtenTestStatus) {
        this.userId = userId;
        this.companyId = companyId;
        this.companyPaperId = companyPaperId;
        this.writtenTestStatus = writtenTestStatus;
    }

    public WrittenTest() {
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
        WrittenTest other = (WrittenTest) that;
        return (this.getWrittenTestId() == null ? other.getWrittenTestId() == null : this.getWrittenTestId().equals(other.getWrittenTestId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getCompanyId() == null ? other.getCompanyId() == null : this.getCompanyId().equals(other.getCompanyId()))
            && (this.getCompanyPaperId() == null ? other.getCompanyPaperId() == null : this.getCompanyPaperId().equals(other.getCompanyPaperId()))
            && (this.getWrittenTestScore() == null ? other.getWrittenTestScore() == null : this.getWrittenTestScore().equals(other.getWrittenTestScore()))
            && (this.getWrittenTestStatus() == null ? other.getWrittenTestStatus() == null : this.getWrittenTestStatus().equals(other.getWrittenTestStatus()))
            && (this.getWrittenTestSpare() == null ? other.getWrittenTestSpare() == null : this.getWrittenTestSpare().equals(other.getWrittenTestSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getWrittenTestId() == null) ? 0 : getWrittenTestId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getCompanyId() == null) ? 0 : getCompanyId().hashCode());
        result = prime * result + ((getCompanyPaperId() == null) ? 0 : getCompanyPaperId().hashCode());
        result = prime * result + ((getWrittenTestScore() == null) ? 0 : getWrittenTestScore().hashCode());
        result = prime * result + ((getWrittenTestStatus() == null) ? 0 : getWrittenTestStatus().hashCode());
        result = prime * result + ((getWrittenTestSpare() == null) ? 0 : getWrittenTestSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", writtenTestId=").append(writtenTestId);
        sb.append(", userId=").append(userId);
        sb.append(", companyId=").append(companyId);
        sb.append(", companyPaperId=").append(companyPaperId);
        sb.append(", writtenTestScore=").append(writtenTestScore);
        sb.append(", writtenTestStatus=").append(writtenTestStatus);
        sb.append(", writtenTestSpare=").append(writtenTestSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}