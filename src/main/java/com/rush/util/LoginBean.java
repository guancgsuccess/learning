package com.rush.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Setter
@Getter
@ToString
public class LoginBean {
    private Integer userId;//用户id
    private String userName;//用户昵称
    private String userPhone;//电话号码
    private String userPassword;//用户密码
    private String userEmail;//用户邮箱
    private Date userLoginTime;//登录时间
    private Integer userLoginVerify;//验证码
    private String loginIp;//登录IP
    private String userImage;//用户头像
    private Integer loginMethodStatus;//登录方式（0为手机号，1为邮箱，2为验证码）

}
