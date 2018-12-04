package com.rush.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * user
 * @author 
 */
public class User implements Serializable {
    /**
     * 用户id(主键)
     */
    private Integer userId;

    /**
     * 用户昵称
     */
    private String userName;

    /**
     * 电话号码
     */
    private String userPhone;

    /**
     * 用户密码
     */
    private String userPassword;

    /**
     * 用户性别
     */
    private String userGender;

    /**
     * 用户年龄
     */
    private Integer userAge;

    /**
     * 用户邮箱
     */
    private String userEmail;

    /**
     * 用户头像
     */
    private String userImage;

    /**
     * 用户真实姓名
     */
    private String userRealName;

    /**
     * 用户身份证号码
     */
    private String userIdcard;

    /**
     * 用户住址
     */
    private String userAddress;

    /**
     * 毕业院校
     */
    private String userSchool;

    /**
     * 工作经验
     */
    private String userWorkExperience;

    /**
     * 注册时间
     */
    private Date userRegisterTime;

    /**
     * 用户状态
     */
    private Integer userStatus;

    /**
     * 备用
     */
    private String userSpare;

    private static final long serialVersionUID = 1L;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public Integer getUserAge() {
        return userAge;
    }

    public void setUserAge(Integer userAge) {
        this.userAge = userAge;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getUserRealName() {
        return userRealName;
    }

    public void setUserRealName(String userRealName) {
        this.userRealName = userRealName;
    }

    public String getUserIdcard() {
        return userIdcard;
    }

    public void setUserIdcard(String userIdcard) {
        this.userIdcard = userIdcard;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserSchool() {
        return userSchool;
    }

    public void setUserSchool(String userSchool) {
        this.userSchool = userSchool;
    }

    public String getUserWorkExperience() {
        return userWorkExperience;
    }

    public void setUserWorkExperience(String userWorkExperience) {
        this.userWorkExperience = userWorkExperience;
    }

    public Date getUserRegisterTime() {
        return userRegisterTime;
    }

    public void setUserRegisterTime(Date userRegisterTime) {
        this.userRegisterTime = userRegisterTime;
    }

    public Integer getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(Integer userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserSpare() {
        return userSpare;
    }

    public void setUserSpare(String userSpare) {
        this.userSpare = userSpare;
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
        User other = (User) that;
        return (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getUserName() == null ? other.getUserName() == null : this.getUserName().equals(other.getUserName()))
            && (this.getUserPhone() == null ? other.getUserPhone() == null : this.getUserPhone().equals(other.getUserPhone()))
            && (this.getUserPassword() == null ? other.getUserPassword() == null : this.getUserPassword().equals(other.getUserPassword()))
            && (this.getUserGender() == null ? other.getUserGender() == null : this.getUserGender().equals(other.getUserGender()))
            && (this.getUserAge() == null ? other.getUserAge() == null : this.getUserAge().equals(other.getUserAge()))
            && (this.getUserEmail() == null ? other.getUserEmail() == null : this.getUserEmail().equals(other.getUserEmail()))
            && (this.getUserImage() == null ? other.getUserImage() == null : this.getUserImage().equals(other.getUserImage()))
            && (this.getUserRealName() == null ? other.getUserRealName() == null : this.getUserRealName().equals(other.getUserRealName()))
            && (this.getUserIdcard() == null ? other.getUserIdcard() == null : this.getUserIdcard().equals(other.getUserIdcard()))
            && (this.getUserAddress() == null ? other.getUserAddress() == null : this.getUserAddress().equals(other.getUserAddress()))
            && (this.getUserSchool() == null ? other.getUserSchool() == null : this.getUserSchool().equals(other.getUserSchool()))
            && (this.getUserWorkExperience() == null ? other.getUserWorkExperience() == null : this.getUserWorkExperience().equals(other.getUserWorkExperience()))
            && (this.getUserRegisterTime() == null ? other.getUserRegisterTime() == null : this.getUserRegisterTime().equals(other.getUserRegisterTime()))
            && (this.getUserStatus() == null ? other.getUserStatus() == null : this.getUserStatus().equals(other.getUserStatus()))
            && (this.getUserSpare() == null ? other.getUserSpare() == null : this.getUserSpare().equals(other.getUserSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getUserName() == null) ? 0 : getUserName().hashCode());
        result = prime * result + ((getUserPhone() == null) ? 0 : getUserPhone().hashCode());
        result = prime * result + ((getUserPassword() == null) ? 0 : getUserPassword().hashCode());
        result = prime * result + ((getUserGender() == null) ? 0 : getUserGender().hashCode());
        result = prime * result + ((getUserAge() == null) ? 0 : getUserAge().hashCode());
        result = prime * result + ((getUserEmail() == null) ? 0 : getUserEmail().hashCode());
        result = prime * result + ((getUserImage() == null) ? 0 : getUserImage().hashCode());
        result = prime * result + ((getUserRealName() == null) ? 0 : getUserRealName().hashCode());
        result = prime * result + ((getUserIdcard() == null) ? 0 : getUserIdcard().hashCode());
        result = prime * result + ((getUserAddress() == null) ? 0 : getUserAddress().hashCode());
        result = prime * result + ((getUserSchool() == null) ? 0 : getUserSchool().hashCode());
        result = prime * result + ((getUserWorkExperience() == null) ? 0 : getUserWorkExperience().hashCode());
        result = prime * result + ((getUserRegisterTime() == null) ? 0 : getUserRegisterTime().hashCode());
        result = prime * result + ((getUserStatus() == null) ? 0 : getUserStatus().hashCode());
        result = prime * result + ((getUserSpare() == null) ? 0 : getUserSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userId=").append(userId);
        sb.append(", userName=").append(userName);
        sb.append(", userPhone=").append(userPhone);
        sb.append(", userPassword=").append(userPassword);
        sb.append(", userGender=").append(userGender);
        sb.append(", userAge=").append(userAge);
        sb.append(", userEmail=").append(userEmail);
        sb.append(", userImage=").append(userImage);
        sb.append(", userRealName=").append(userRealName);
        sb.append(", userIdcard=").append(userIdcard);
        sb.append(", userAddress=").append(userAddress);
        sb.append(", userSchool=").append(userSchool);
        sb.append(", userWorkExperience=").append(userWorkExperience);
        sb.append(", userRegisterTime=").append(userRegisterTime);
        sb.append(", userStatus=").append(userStatus);
        sb.append(", userSpare=").append(userSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}