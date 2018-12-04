package com.rush.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class LoginProcessBean {
    private LoginBean loginBean;
    private Integer status;
    private String msg;
}
