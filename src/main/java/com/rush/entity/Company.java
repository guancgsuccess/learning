package com.rush.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * company
 * @author 
 */
public class Company implements Serializable {
    /**
     * 公司id
     */
    private Integer companyId;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 公司密码
     */
    private String companyPassword;

    /**
     * 公司地址
     */
    private String companyAddress;

    /**
     * 工商注册码
     */
    private String companyRegistrationCode;

    /**
     * 法人代表
     */
    private String companyLegalRepresentative;

    /**
     * 公司电话
     */
    private String companyPhone;

    /**
     * 公司类型
     */
    private String companyType;

    /**
     * 公司注册时间
     */
    private Date companyRegisterTime;

    /**
     * 公司邮箱
     */
    private String companyEmail;

    /**
     * 公司简介
     */
    private String companyIntroduction;

    /**
     * 公司状态
     */
    private Integer companyStatus;

    /**
     * 备用
     */
    private String companySpare;

    private static final long serialVersionUID = 1L;

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyPassword() {
        return companyPassword;
    }

    public void setCompanyPassword(String companyPassword) {
        this.companyPassword = companyPassword;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public String getCompanyRegistrationCode() {
        return companyRegistrationCode;
    }

    public void setCompanyRegistrationCode(String companyRegistrationCode) {
        this.companyRegistrationCode = companyRegistrationCode;
    }

    public String getCompanyLegalRepresentative() {
        return companyLegalRepresentative;
    }

    public void setCompanyLegalRepresentative(String companyLegalRepresentative) {
        this.companyLegalRepresentative = companyLegalRepresentative;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
    }

    public Date getCompanyRegisterTime() {
        return companyRegisterTime;
    }

    public void setCompanyRegisterTime(Date companyRegisterTime) {
        this.companyRegisterTime = companyRegisterTime;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getCompanyIntroduction() {
        return companyIntroduction;
    }

    public void setCompanyIntroduction(String companyIntroduction) {
        this.companyIntroduction = companyIntroduction;
    }

    public Integer getCompanyStatus() {
        return companyStatus;
    }

    public void setCompanyStatus(Integer companyStatus) {
        this.companyStatus = companyStatus;
    }

    public String getCompanySpare() {
        return companySpare;
    }

    public void setCompanySpare(String companySpare) {
        this.companySpare = companySpare;
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
        Company other = (Company) that;
        return (this.getCompanyId() == null ? other.getCompanyId() == null : this.getCompanyId().equals(other.getCompanyId()))
            && (this.getCompanyName() == null ? other.getCompanyName() == null : this.getCompanyName().equals(other.getCompanyName()))
            && (this.getCompanyPassword() == null ? other.getCompanyPassword() == null : this.getCompanyPassword().equals(other.getCompanyPassword()))
            && (this.getCompanyAddress() == null ? other.getCompanyAddress() == null : this.getCompanyAddress().equals(other.getCompanyAddress()))
            && (this.getCompanyRegistrationCode() == null ? other.getCompanyRegistrationCode() == null : this.getCompanyRegistrationCode().equals(other.getCompanyRegistrationCode()))
            && (this.getCompanyLegalRepresentative() == null ? other.getCompanyLegalRepresentative() == null : this.getCompanyLegalRepresentative().equals(other.getCompanyLegalRepresentative()))
            && (this.getCompanyPhone() == null ? other.getCompanyPhone() == null : this.getCompanyPhone().equals(other.getCompanyPhone()))
            && (this.getCompanyType() == null ? other.getCompanyType() == null : this.getCompanyType().equals(other.getCompanyType()))
            && (this.getCompanyRegisterTime() == null ? other.getCompanyRegisterTime() == null : this.getCompanyRegisterTime().equals(other.getCompanyRegisterTime()))
            && (this.getCompanyEmail() == null ? other.getCompanyEmail() == null : this.getCompanyEmail().equals(other.getCompanyEmail()))
            && (this.getCompanyIntroduction() == null ? other.getCompanyIntroduction() == null : this.getCompanyIntroduction().equals(other.getCompanyIntroduction()))
            && (this.getCompanyStatus() == null ? other.getCompanyStatus() == null : this.getCompanyStatus().equals(other.getCompanyStatus()))
            && (this.getCompanySpare() == null ? other.getCompanySpare() == null : this.getCompanySpare().equals(other.getCompanySpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCompanyId() == null) ? 0 : getCompanyId().hashCode());
        result = prime * result + ((getCompanyName() == null) ? 0 : getCompanyName().hashCode());
        result = prime * result + ((getCompanyPassword() == null) ? 0 : getCompanyPassword().hashCode());
        result = prime * result + ((getCompanyAddress() == null) ? 0 : getCompanyAddress().hashCode());
        result = prime * result + ((getCompanyRegistrationCode() == null) ? 0 : getCompanyRegistrationCode().hashCode());
        result = prime * result + ((getCompanyLegalRepresentative() == null) ? 0 : getCompanyLegalRepresentative().hashCode());
        result = prime * result + ((getCompanyPhone() == null) ? 0 : getCompanyPhone().hashCode());
        result = prime * result + ((getCompanyType() == null) ? 0 : getCompanyType().hashCode());
        result = prime * result + ((getCompanyRegisterTime() == null) ? 0 : getCompanyRegisterTime().hashCode());
        result = prime * result + ((getCompanyEmail() == null) ? 0 : getCompanyEmail().hashCode());
        result = prime * result + ((getCompanyIntroduction() == null) ? 0 : getCompanyIntroduction().hashCode());
        result = prime * result + ((getCompanyStatus() == null) ? 0 : getCompanyStatus().hashCode());
        result = prime * result + ((getCompanySpare() == null) ? 0 : getCompanySpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", companyId=").append(companyId);
        sb.append(", companyName=").append(companyName);
        sb.append(", companyPassword=").append(companyPassword);
        sb.append(", companyAddress=").append(companyAddress);
        sb.append(", companyRegistrationCode=").append(companyRegistrationCode);
        sb.append(", companyLegalRepresentative=").append(companyLegalRepresentative);
        sb.append(", companyPhone=").append(companyPhone);
        sb.append(", companyType=").append(companyType);
        sb.append(", companyRegisterTime=").append(companyRegisterTime);
        sb.append(", companyEmail=").append(companyEmail);
        sb.append(", companyIntroduction=").append(companyIntroduction);
        sb.append(", companyStatus=").append(companyStatus);
        sb.append(", companySpare=").append(companySpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}