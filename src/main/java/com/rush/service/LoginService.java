package com.rush.service;

import com.rush.entity.Company;
import com.rush.entity.LoginBean;
import com.rush.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface LoginService {
    boolean userLoginVerify(LoginBean loginBean);

    boolean companyLoginVerify(LoginBean loginBean);
}
