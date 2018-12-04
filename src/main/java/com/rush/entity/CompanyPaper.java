package com.rush.entity;

import java.io.Serializable;

/**
 * company_paper
 * @author 
 */
public class CompanyPaper implements Serializable {
    /**
     * 公司试卷id
     */
    private Integer companyPaperId;

    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 试题数量
     */
    private Integer questionsNumber;

    /**
     * 公司试卷状态
     */
    private Integer companyPaperStatus;

    /**
     * 备用
     */
    private String companyPaperSpare;

    private static final long serialVersionUID = 1L;

    public Integer getCompanyPaperId() {
        return companyPaperId;
    }

    public void setCompanyPaperId(Integer companyPaperId) {
        this.companyPaperId = companyPaperId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getQuestionsNumber() {
        return questionsNumber;
    }

    public void setQuestionsNumber(Integer questionsNumber) {
        this.questionsNumber = questionsNumber;
    }

    public Integer getCompanyPaperStatus() {
        return companyPaperStatus;
    }

    public void setCompanyPaperStatus(Integer companyPaperStatus) {
        this.companyPaperStatus = companyPaperStatus;
    }

    public String getCompanyPaperSpare() {
        return companyPaperSpare;
    }

    public void setCompanyPaperSpare(String companyPaperSpare) {
        this.companyPaperSpare = companyPaperSpare;
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
        CompanyPaper other = (CompanyPaper) that;
        return (this.getCompanyPaperId() == null ? other.getCompanyPaperId() == null : this.getCompanyPaperId().equals(other.getCompanyPaperId()))
            && (this.getCompanyId() == null ? other.getCompanyId() == null : this.getCompanyId().equals(other.getCompanyId()))
            && (this.getQuestionsNumber() == null ? other.getQuestionsNumber() == null : this.getQuestionsNumber().equals(other.getQuestionsNumber()))
            && (this.getCompanyPaperStatus() == null ? other.getCompanyPaperStatus() == null : this.getCompanyPaperStatus().equals(other.getCompanyPaperStatus()))
            && (this.getCompanyPaperSpare() == null ? other.getCompanyPaperSpare() == null : this.getCompanyPaperSpare().equals(other.getCompanyPaperSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCompanyPaperId() == null) ? 0 : getCompanyPaperId().hashCode());
        result = prime * result + ((getCompanyId() == null) ? 0 : getCompanyId().hashCode());
        result = prime * result + ((getQuestionsNumber() == null) ? 0 : getQuestionsNumber().hashCode());
        result = prime * result + ((getCompanyPaperStatus() == null) ? 0 : getCompanyPaperStatus().hashCode());
        result = prime * result + ((getCompanyPaperSpare() == null) ? 0 : getCompanyPaperSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", companyPaperId=").append(companyPaperId);
        sb.append(", companyId=").append(companyId);
        sb.append(", questionsNumber=").append(questionsNumber);
        sb.append(", companyPaperStatus=").append(companyPaperStatus);
        sb.append(", companyPaperSpare=").append(companyPaperSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}