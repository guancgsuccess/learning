package com.rush.service.Impl;

import com.rush.dao.UserLoginDAO;
import com.rush.entity.UserLogin;
import com.rush.service.UserLoginService;
import com.rush.util.LoginProcessBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class UserLoginServiceImp implements UserLoginService {

    @Autowired
    private UserLoginDAO userLoginDAO;

    @Override
    public int addUserLogin(UserLogin userLogin) {
        int result = userLoginDAO.insert(userLogin);
        return result;
    }

    /**
     * 存储用户登录信息
     * @param loginProcessBean
     */
    @Override
    public int saveLoginInfo(LoginProcessBean loginProcessBean) {
        String userLoginAccount=null;
        //如果是邮箱登录
        if(loginProcessBean.getLoginBean().getLoginMethodStatus()==1) {
            userLoginAccount = loginProcessBean.getLoginBean().getUserEmail();
        }
        //如果是手机号码登陆
        if(loginProcessBean.getLoginBean().getLoginMethodStatus()==0){
            userLoginAccount=loginProcessBean.getLoginBean().getUserPhone();
        }
        Integer userLoginVerify=loginProcessBean.getLoginBean().getUserLoginVerify();
        Date userLoginTime=loginProcessBean.getLoginBean().getUserLoginTime();
        String userLoginPassword=loginProcessBean.getLoginBean().getUserPassword();
        String loginIp=loginProcessBean.getLoginBean().getLoginIp();
        UserLogin userLogin=new UserLogin(userLoginAccount,userLoginPassword,userLoginVerify,userLoginTime,0,loginIp);
        return userLoginDAO.insertSelective(userLogin);
    }
}
