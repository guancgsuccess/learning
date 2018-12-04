package com.rush.entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class LoginBean {
    private String loginAccount;

    private String loginPassword;

    private String loginVerifyCode;

    private String loginIP;

    private Date loginTime;

    private Integer rememberStatus;

}
