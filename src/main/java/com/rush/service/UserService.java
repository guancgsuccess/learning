package com.rush.service;

import com.rush.entity.LoginBean;
import com.rush.entity.RegisterBean;
import com.rush.entity.User;
import com.rush.entity.UserLogin;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface UserService {

    public int addUser(User user);

    public User selectByPhoneAndPwd(LoginBean loginBean);

    public User addUserData(RegisterBean registerBean) throws Exception;

    public UserLogin addUserLoginData(User user, HttpServletRequest request);

    public Integer selectPhone(String phone);


    boolean checkPhoneIsExist(String phone);

    boolean checkEmailIsExist(String email);

    User queryUserById(Integer userId);

    boolean modifyUser(User user);

    boolean realnameAuthentication(String userRealName,String userIdCard,Integer userId);

    Map<String,Object> changePhoneByCode(Integer userId, String userPhone, String inputCode, String sessionCode);

    Map<String,Object> changeEmailByCode(Integer userId,String userEmail,String inputCode,String sessionCode);

    boolean changePwd(Integer userId,String userPassword) throws Exception;

    String sendPhoneCode(String userPhone);

    String sendEmailCode(String userEmail);

    Map<String,String> checkOldPwd(String userPassword,Integer userId) throws Exception;
}
