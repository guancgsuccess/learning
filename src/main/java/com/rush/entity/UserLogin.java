package com.rush.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * user_login
 * @author 
 */
public class UserLogin implements Serializable {
    /**
     * 用户登录id
     */
    private Integer userLoginId;

    /**
     * 用户登录账号
     */
    private String userLoginAccount;

    /**
     * 用户登录密码
     */
    private String userLoginPassword;

    /**
     * 登录验证码
     */
    private Integer userLoginVerify;

    /**
     * 用户登录时间
     */
    private Date userLoginTime;

    /**
     * 用户登录状态
     */
    private Integer userLoginStatus;

    /**
     * 备用
     */
    private String userLoginSpare;

    private static final long serialVersionUID = 1L;

    public UserLogin() {
    }

    public UserLogin(String userLoginAccount, String userLoginPassword, Integer userLoginVerify, Date userLoginTime, Integer userLoginStatus, String userLoginSpare) {
        this.userLoginAccount = userLoginAccount;
        this.userLoginPassword = userLoginPassword;
        this.userLoginVerify = userLoginVerify;
        this.userLoginTime = userLoginTime;
        this.userLoginStatus = userLoginStatus;
        this.userLoginSpare = userLoginSpare;
    }

    public Integer getUserLoginId() {
        return userLoginId;
    }

    public void setUserLoginId(Integer userLoginId) {
        this.userLoginId = userLoginId;
    }

    public String getUserLoginAccount() {
        return userLoginAccount;
    }

    public void setUserLoginAccount(String userLoginAccount) {
        this.userLoginAccount = userLoginAccount;
    }

    public String getUserLoginPassword() {
        return userLoginPassword;
    }

    public void setUserLoginPassword(String userLoginPassword) {
        this.userLoginPassword = userLoginPassword;
    }

    public Integer getUserLoginVerify() {
        return userLoginVerify;
    }

    public void setUserLoginVerify(Integer userLoginVerify) {
        this.userLoginVerify = userLoginVerify;
    }

    public Date getUserLoginTime() {
        return userLoginTime;
    }

    public void setUserLoginTime(Date userLoginTime) {
        this.userLoginTime = userLoginTime;
    }

    public Integer getUserLoginStatus() {
        return userLoginStatus;
    }

    public void setUserLoginStatus(Integer userLoginStatus) {
        this.userLoginStatus = userLoginStatus;
    }

    public String getUserLoginSpare() {
        return userLoginSpare;
    }

    public void setUserLoginSpare(String userLoginSpare) {
        this.userLoginSpare = userLoginSpare;
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
        UserLogin other = (UserLogin) that;
        return (this.getUserLoginId() == null ? other.getUserLoginId() == null : this.getUserLoginId().equals(other.getUserLoginId()))
            && (this.getUserLoginAccount() == null ? other.getUserLoginAccount() == null : this.getUserLoginAccount().equals(other.getUserLoginAccount()))
            && (this.getUserLoginPassword() == null ? other.getUserLoginPassword() == null : this.getUserLoginPassword().equals(other.getUserLoginPassword()))
            && (this.getUserLoginVerify() == null ? other.getUserLoginVerify() == null : this.getUserLoginVerify().equals(other.getUserLoginVerify()))
            && (this.getUserLoginTime() == null ? other.getUserLoginTime() == null : this.getUserLoginTime().equals(other.getUserLoginTime()))
            && (this.getUserLoginStatus() == null ? other.getUserLoginStatus() == null : this.getUserLoginStatus().equals(other.getUserLoginStatus()))
            && (this.getUserLoginSpare() == null ? other.getUserLoginSpare() == null : this.getUserLoginSpare().equals(other.getUserLoginSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserLoginId() == null) ? 0 : getUserLoginId().hashCode());
        result = prime * result + ((getUserLoginAccount() == null) ? 0 : getUserLoginAccount().hashCode());
        result = prime * result + ((getUserLoginPassword() == null) ? 0 : getUserLoginPassword().hashCode());
        result = prime * result + ((getUserLoginVerify() == null) ? 0 : getUserLoginVerify().hashCode());
        result = prime * result + ((getUserLoginTime() == null) ? 0 : getUserLoginTime().hashCode());
        result = prime * result + ((getUserLoginStatus() == null) ? 0 : getUserLoginStatus().hashCode());
        result = prime * result + ((getUserLoginSpare() == null) ? 0 : getUserLoginSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userLoginId=").append(userLoginId);
        sb.append(", userLoginAccount=").append(userLoginAccount);
        sb.append(", userLoginPassword=").append(userLoginPassword);
        sb.append(", userLoginVerify=").append(userLoginVerify);
        sb.append(", userLoginTime=").append(userLoginTime);
        sb.append(", userLoginStatus=").append(userLoginStatus);
        sb.append(", userLoginSpare=").append(userLoginSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}