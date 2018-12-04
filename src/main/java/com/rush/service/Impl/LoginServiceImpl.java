package com.rush.service.Impl;

import com.rush.dao.CompanyDAO;
import com.rush.dao.CompanyLoginDAO;
import com.rush.dao.UserDAO;
import com.rush.dao.UserLoginDAO;
import com.rush.entity.*;
import com.rush.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private UserLoginDAO userLoginDAO;
    @Autowired
    private CompanyDAO companyDAO;
    @Autowired
    private CompanyLoginDAO companyLoginDAO;

    /**
     * 用户登录
     * @param loginBean 用户登录信息（账户、密码、验证码、IP、登录时间）
     * @return 返回用户是否登录成功
     */
    @Override
    public boolean userLoginVerify(LoginBean loginBean) {
        String password = userDAO.selectPasswordByPhone(loginBean.getLoginAccount());
        if (loginBean.getLoginPassword().equals(password)) {
            UserLogin userLogin = new UserLogin();
            userLogin.setUserLoginAccount(loginBean.getLoginAccount());
            if (loginBean.getLoginVerifyCode() == null) {
                userLogin.setUserLoginPassword(password);
                userLogin.setUserLoginVerify(1);
            } else {
                userLogin.setUserLoginVerify(0);
            }
            userLogin.setUserLoginStatus(0);
            userLogin.setUserLoginTime(loginBean.getLoginTime());
            userLoginDAO.insert(userLogin);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 企业登录
     * @param loginBean 企业登录信息（账户、密码、验证码、IP、登录时间）
     * @return 返回企业用户是否登录成功
     */
    @Override
    public boolean companyLoginVerify(LoginBean loginBean) {
        String password = companyDAO.selectPasswordByEmail(loginBean.getLoginAccount());
        if (loginBean.getLoginPassword().equals(password)) {
            CompanyLogin companyLogin = new CompanyLogin();
            companyLogin.setCompanyLoginEmail(loginBean.getLoginAccount());
            if (loginBean.getLoginVerifyCode() == null) {
                companyLogin.setCompanyLoginPassword(loginBean.getLoginPassword());
                companyLogin.setCompanyLoginVerify(1);
            } else {
                companyLogin.setCompanyLoginVerify(0);
            }
            companyLogin.setCompanyLoginTime(loginBean.getLoginTime());
            companyLogin.setCompanyLoginStatus(0);
            companyLoginDAO.insert(companyLogin);
            return true;
        } else {
            return false;
        }
    }
}
