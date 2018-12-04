package com.rush.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * company_login
 * @author 
 */
public class CompanyLogin implements Serializable {
    /**
     * 公司登录id
     */
    private Integer companyLoginId;

    /**
     * 公司邮箱(登录账号)
     */
    private String companyLoginEmail;

    /**
     * 公司登录密码
     */
    private String companyLoginPassword;

    /**
     * 公司登录验证码
     */
    private Integer companyLoginVerify;

    /**
     * 公司登录时间
     */
    private Date companyLoginTime;

    /**
     * 公司登录状态
     */
    private Integer companyLoginStatus;

    /**
     * 备用
     */
    private String companyLoginSpare;

    private static final long serialVersionUID = 1L;

    public Integer getCompanyLoginId() {
        return companyLoginId;
    }

    public void setCompanyLoginId(Integer companyLoginId) {
        this.companyLoginId = companyLoginId;
    }

    public String getCompanyLoginEmail() {
        return companyLoginEmail;
    }

    public void setCompanyLoginEmail(String companyLoginEmail) {
        this.companyLoginEmail = companyLoginEmail;
    }

    public String getCompanyLoginPassword() {
        return companyLoginPassword;
    }

    public void setCompanyLoginPassword(String companyLoginPassword) {
        this.companyLoginPassword = companyLoginPassword;
    }

    public Integer getCompanyLoginVerify() {
        return companyLoginVerify;
    }

    public void setCompanyLoginVerify(Integer companyLoginVerify) {
        this.companyLoginVerify = companyLoginVerify;
    }

    public Date getCompanyLoginTime() {
        return companyLoginTime;
    }

    public void setCompanyLoginTime(Date companyLoginTime) {
        this.companyLoginTime = companyLoginTime;
    }

    public Integer getCompanyLoginStatus() {
        return companyLoginStatus;
    }

    public void setCompanyLoginStatus(Integer companyLoginStatus) {
        this.companyLoginStatus = companyLoginStatus;
    }

    public String getCompanyLoginSpare() {
        return companyLoginSpare;
    }

    public void setCompanyLoginSpare(String companyLoginSpare) {
        this.companyLoginSpare = companyLoginSpare;
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
        CompanyLogin other = (CompanyLogin) that;
        return (this.getCompanyLoginId() == null ? other.getCompanyLoginId() == null : this.getCompanyLoginId().equals(other.getCompanyLoginId()))
            && (this.getCompanyLoginEmail() == null ? other.getCompanyLoginEmail() == null : this.getCompanyLoginEmail().equals(other.getCompanyLoginEmail()))
            && (this.getCompanyLoginPassword() == null ? other.getCompanyLoginPassword() == null : this.getCompanyLoginPassword().equals(other.getCompanyLoginPassword()))
            && (this.getCompanyLoginVerify() == null ? other.getCompanyLoginVerify() == null : this.getCompanyLoginVerify().equals(other.getCompanyLoginVerify()))
            && (this.getCompanyLoginTime() == null ? other.getCompanyLoginTime() == null : this.getCompanyLoginTime().equals(other.getCompanyLoginTime()))
            && (this.getCompanyLoginStatus() == null ? other.getCompanyLoginStatus() == null : this.getCompanyLoginStatus().equals(other.getCompanyLoginStatus()))
            && (this.getCompanyLoginSpare() == null ? other.getCompanyLoginSpare() == null : this.getCompanyLoginSpare().equals(other.getCompanyLoginSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCompanyLoginId() == null) ? 0 : getCompanyLoginId().hashCode());
        result = prime * result + ((getCompanyLoginEmail() == null) ? 0 : getCompanyLoginEmail().hashCode());
        result = prime * result + ((getCompanyLoginPassword() == null) ? 0 : getCompanyLoginPassword().hashCode());
        result = prime * result + ((getCompanyLoginVerify() == null) ? 0 : getCompanyLoginVerify().hashCode());
        result = prime * result + ((getCompanyLoginTime() == null) ? 0 : getCompanyLoginTime().hashCode());
        result = prime * result + ((getCompanyLoginStatus() == null) ? 0 : getCompanyLoginStatus().hashCode());
        result = prime * result + ((getCompanyLoginSpare() == null) ? 0 : getCompanyLoginSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", companyLoginId=").append(companyLoginId);
        sb.append(", companyLoginEmail=").append(companyLoginEmail);
        sb.append(", companyLoginPassword=").append(companyLoginPassword);
        sb.append(", companyLoginVerify=").append(companyLoginVerify);
        sb.append(", companyLoginTime=").append(companyLoginTime);
        sb.append(", companyLoginStatus=").append(companyLoginStatus);
        sb.append(", companyLoginSpare=").append(companyLoginSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}