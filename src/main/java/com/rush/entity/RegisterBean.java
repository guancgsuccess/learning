package com.rush.entity;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class RegisterBean {

    private String registerPhone;

    private String registerValidCode;

    private String registerPassword;
}
