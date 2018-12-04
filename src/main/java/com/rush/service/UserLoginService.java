package com.rush.service;

import com.rush.entity.UserLogin;
import com.rush.util.LoginProcessBean;
import org.springframework.stereotype.Service;

@Service
public interface UserLoginService {
    public int addUserLogin(UserLogin userLogin);

    public int saveLoginInfo(LoginProcessBean loginProcessBean);
}
