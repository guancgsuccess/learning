package com.rush.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * recruitment
 * @author 
 */
public class Recruitment implements Serializable {
    /**
     * 招聘信息id
     */
    private Integer recruitmentId;

    /**
     * 招聘公司id
     */
    private Integer companyId;

    /**
     * 招聘职位
     */
    private String recuritmentPosition;

    /**
     * 招聘要求
     */
    private String recruitmentRequirements;

    /**
     * 岗位薪资
     */
    private String recruitmentTreatment;

    /**
     * 面试时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date interviewTime;

    /**
     * 面试地点
     */
    private String interviewLocation;

    /**
     * 招聘人数
     */
    private Integer recruitmentNumber;

    /**
     * 招聘信息状态
     */
    private Integer recruitmentInformationStatus;

    /**
     * 备用
     */
    private String recruitmentSpare;

    private static final long serialVersionUID = 1L;

    public Integer getRecruitmentId() {
        return recruitmentId;
    }

    public void setRecruitmentId(Integer recruitmentId) {
        this.recruitmentId = recruitmentId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getRecuritmentPosition() {
        return recuritmentPosition;
    }

    public void setRecuritmentPosition(String recuritmentPosition) {
        this.recuritmentPosition = recuritmentPosition;
    }

    public String getRecruitmentRequirements() {
        return recruitmentRequirements;
    }

    public void setRecruitmentRequirements(String recruitmentRequirements) {
        this.recruitmentRequirements = recruitmentRequirements;
    }

    public String getRecruitmentTreatment() {
        return recruitmentTreatment;
    }

    public void setRecruitmentTreatment(String recruitmentTreatment) {
        this.recruitmentTreatment = recruitmentTreatment;
    }

    public Date getInterviewTime() {
        return interviewTime;
    }

    public void setInterviewTime(Date interviewTime) {
        this.interviewTime = interviewTime;
    }

    public String getInterviewLocation() {
        return interviewLocation;
    }

    public void setInterviewLocation(String interviewLocation) {
        this.interviewLocation = interviewLocation;
    }

    public Integer getRecruitmentNumber() {
        return recruitmentNumber;
    }

    public void setRecruitmentNumber(Integer recruitmentNumber) {
        this.recruitmentNumber = recruitmentNumber;
    }

    public Integer getRecruitmentInformationStatus() {
        return recruitmentInformationStatus;
    }

    public void setRecruitmentInformationStatus(Integer recruitmentInformationStatus) {
        this.recruitmentInformationStatus = recruitmentInformationStatus;
    }

    public String getRecruitmentSpare() {
        return recruitmentSpare;
    }

    public void setRecruitmentSpare(String recruitmentSpare) {
        this.recruitmentSpare = recruitmentSpare;
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
        Recruitment other = (Recruitment) that;
        return (this.getRecruitmentId() == null ? other.getRecruitmentId() == null : this.getRecruitmentId().equals(other.getRecruitmentId()))
            && (this.getCompanyId() == null ? other.getCompanyId() == null : this.getCompanyId().equals(other.getCompanyId()))
            && (this.getRecuritmentPosition() == null ? other.getRecuritmentPosition() == null : this.getRecuritmentPosition().equals(other.getRecuritmentPosition()))
            && (this.getRecruitmentRequirements() == null ? other.getRecruitmentRequirements() == null : this.getRecruitmentRequirements().equals(other.getRecruitmentRequirements()))
            && (this.getRecruitmentTreatment() == null ? other.getRecruitmentTreatment() == null : this.getRecruitmentTreatment().equals(other.getRecruitmentTreatment()))
            && (this.getInterviewTime() == null ? other.getInterviewTime() == null : this.getInterviewTime().equals(other.getInterviewTime()))
            && (this.getInterviewLocation() == null ? other.getInterviewLocation() == null : this.getInterviewLocation().equals(other.getInterviewLocation()))
            && (this.getRecruitmentNumber() == null ? other.getRecruitmentNumber() == null : this.getRecruitmentNumber().equals(other.getRecruitmentNumber()))
            && (this.getRecruitmentInformationStatus() == null ? other.getRecruitmentInformationStatus() == null : this.getRecruitmentInformationStatus().equals(other.getRecruitmentInformationStatus()))
            && (this.getRecruitmentSpare() == null ? other.getRecruitmentSpare() == null : this.getRecruitmentSpare().equals(other.getRecruitmentSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getRecruitmentId() == null) ? 0 : getRecruitmentId().hashCode());
        result = prime * result + ((getCompanyId() == null) ? 0 : getCompanyId().hashCode());
        result = prime * result + ((getRecuritmentPosition() == null) ? 0 : getRecuritmentPosition().hashCode());
        result = prime * result + ((getRecruitmentRequirements() == null) ? 0 : getRecruitmentRequirements().hashCode());
        result = prime * result + ((getRecruitmentTreatment() == null) ? 0 : getRecruitmentTreatment().hashCode());
        result = prime * result + ((getInterviewTime() == null) ? 0 : getInterviewTime().hashCode());
        result = prime * result + ((getInterviewLocation() == null) ? 0 : getInterviewLocation().hashCode());
        result = prime * result + ((getRecruitmentNumber() == null) ? 0 : getRecruitmentNumber().hashCode());
        result = prime * result + ((getRecruitmentInformationStatus() == null) ? 0 : getRecruitmentInformationStatus().hashCode());
        result = prime * result + ((getRecruitmentSpare() == null) ? 0 : getRecruitmentSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", recruitmentId=").append(recruitmentId);
        sb.append(", companyId=").append(companyId);
        sb.append(", recuritmentPosition=").append(recuritmentPosition);
        sb.append(", recruitmentRequirements=").append(recruitmentRequirements);
        sb.append(", recruitmentTreatment=").append(recruitmentTreatment);
        sb.append(", interviewTime=").append(interviewTime);
        sb.append(", interviewLocation=").append(interviewLocation);
        sb.append(", recruitmentNumber=").append(recruitmentNumber);
        sb.append(", recruitmentInformationStatus=").append(recruitmentInformationStatus);
        sb.append(", recruitmentSpare=").append(recruitmentSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}