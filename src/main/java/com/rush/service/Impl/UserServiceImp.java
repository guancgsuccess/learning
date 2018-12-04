package com.rush.service.Impl;

import com.rush.dao.UserDAO;
import com.rush.entity.LoginBean;
import com.rush.entity.RegisterBean;
import com.rush.entity.User;
import com.rush.entity.UserLogin;
import com.rush.service.UserService;
import com.rush.util.GetClientIp;
import com.rush.util.SHAencrypt;
import com.rush.util.SendEmailCode;
import com.rush.util.TelMsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class UserServiceImp implements UserService {

    @Autowired
    private UserDAO userDAO;

    /**
     * 向数据库添加新用户
     * @param user 用户信息
     * @return 返回添加状况
     */
    @Override
    public int addUser(User user) {
        int result = userDAO.insert(user);
        return result;
    }

    /**
     * 根据用户登录信息查询用户
     * @param loginBean 封装的登录信息
     * @return 返回查询的用户信息
     */
    @Override
    public User selectByPhoneAndPwd(LoginBean loginBean) {
        User user = userDAO.selectByPhoneAndPwd(loginBean);
        return user;
    }

    /**
     * 根据注册信息填加一个用户
     * @param registerBean 封装的注册信息
     * @return 返回完善了注册信息的用户
     * @throws Exception
     */
    public User addUserData(RegisterBean registerBean) throws Exception {
        User user = new User();
        user.setUserPhone(registerBean.getRegisterPhone());
        String password = SHAencrypt.encryptSHA(registerBean.getRegisterPassword());
        user.setUserPassword(password);
        user.setUserName(registerBean.getRegisterPhone());
        user.setUserImage("default.jpg");
        user.setUserRegisterTime(new Date());
        user.setUserStatus(0);
        return user;
    }

    /**
     * 添加用户登录信息
     * @param user 用户数据
     * @param request 用户请求
     * @return 返回用户登录的信息
     */
    @Override
    public UserLogin addUserLoginData(User user, HttpServletRequest request) {
        UserLogin userLogin = new UserLogin();
        userLogin.setUserLoginAccount(user.getUserPhone());
        userLogin.setUserLoginPassword(user.getUserPassword());
        userLogin.setUserLoginTime(new Date());
        userLogin.setUserLoginVerify(1);
        userLogin.setUserLoginStatus(0);
        String ipAdr = GetClientIp.getAddressIP(request);
        userLogin.setUserLoginSpare(ipAdr);
        return userLogin;
    }

    /**
     * 根据手机号码查询数据库
     * @param phone 手机号码
     * @return 返回查询结果
     */
    @Override
    public Integer selectPhone(String phone) {
        int result = userDAO.selectPhone(phone);
        return result;
    }


    /**
     * 判断手机号码是否被注册过
     * @param phone 手机号码
     * @return true表示没有被注册，false表示被注册过了
     */
    @Override
    public boolean checkPhoneIsExist(String phone) {
        return userDAO.selectUserByPhone(phone)==null;
    }

    /**
     * 判断邮箱是否被绑定
     * @param email 邮箱
     * @return true表示没有被绑定，false表示被绑定过了
     */
    @Override
    public boolean checkEmailIsExist(String email) {
        return userDAO.selectUserByEmail(email)==null;
    }

    /**
     * 根据用户id查询用户信息
     * @param userId 用户id
     * @return 用户
     */
    @Override
    public User queryUserById(Integer userId) {
        return userDAO.selectByPrimaryKey(userId);
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public boolean modifyUser(User user) {
        return userDAO.updateByPrimaryKeySelective(user)>0;
    }

    /**
     * 实名认证
     * @param userRealName
     * @param userIdCard
     * @param userId
     * @return
     */
    @Override
    public boolean realnameAuthentication(String userRealName, String userIdCard,Integer userId) {
        User user=new User();
        user.setUserId(userId);
        user.setUserRealName(userRealName);
        user.setUserIdcard(userIdCard);
        return userDAO.updateByPrimaryKeySelective(user)>0;
    }

    /**
     * 根据手机验证码修改绑定手机
     * @param userId 用户id
     * @param userPhone 用户手机
     * @param inputCode 输入的验证码
     * @param sessionCode 发送的短信验证码（在session中）
     * @return
     */
    @Override
    public Map<String,Object> changePhoneByCode(Integer userId, String userPhone, String inputCode, String sessionCode) {
        Map<String,Object> map=new HashMap<>();
        User user = new User();
        //先判断改手机号码是否已被注册
        if(userDAO.selectUserByPhone(userPhone)==null) {
            user.setUserId(userId);
            user.setUserPhone(userPhone);
            if(inputCode.equals(sessionCode)) {
                userDAO.updateByPrimaryKeySelective(user);
                map.put("userPhone",userPhone);
            }else {
                map.put("msg","验证码错误");
            }
        }else{
            map.put("msg","该手机号已被注册");
        }
        return map;
    }

    /**
     * 发送手机短信验证码
     * @param userPhone
     * @return
     */
    @Override
    public String sendPhoneCode(String userPhone) {
        String regex="^1[3|4|5|7|8][0-9]\\d{4,8}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(userPhone);
        if(userPhone.length()==11&&m.matches()){
            TelMsgUtils.sendMsgTo(userPhone);
            String code=TelMsgUtils.randNum;
            return code;
        }
        return null;
    }

    /**
     * 向用户的Email发送验证码
     * @param userEmail 用户Email
     * @return 返回验证码
     */
    @Override
    public String sendEmailCode(String userEmail) {
        String regex="^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(userEmail);
        if(m.matches()){
            String code=SendEmailCode.sendEmailCode(userEmail);
            return code;
        }
        return null;
    }

    /**
     * 根据用户密码和id检查用户密码是否正确
     * @param userPassword 用户填写密码
     * @param userId 用户id
     * @return  返回检查接口
     */
    @Override
    public Map<String,String> checkOldPwd(String userPassword,Integer userId) throws Exception {
        Map<String,String> map=new HashMap<>();
        String password=SHAencrypt.encryptSHA(userPassword);
        User user=userDAO.selectUserByUserIdAndPwd(userId,password);
        if(user==null){
            map.put("msg","原密码输入错误！");
        }
        return map;
    }

    /**
     * 根据用户id、用户原Email、验证码和用户填写的验证码更改用户Email
     * @param userId 用户id
     * @param userEmail 用户Email
     * @param inputCode 用户输入的验证码
     * @param sessionCode 系统验证码
     * @return 返回检测状况
     */
    @Override
    public Map<String,Object> changeEmailByCode(Integer userId, String userEmail,String inputCode,String sessionCode) {
        Map<String,Object> map=new HashMap<>();
        User user=new User();
        //先判断该邮箱是否存在
        if(userDAO.selectUserByEmail(userEmail)==null) {
            user.setUserId(userId);
            user.setUserEmail(userEmail);
            if(inputCode.equals(sessionCode)) {
                userDAO.updateByPrimaryKeySelective(user);
                map.put("userEmail",userEmail);
            }else {
                map.put("msg", "验证码错误");
            }
        }
        else{
            map.put("msg","该邮箱已被注册");
        }
        return map;
    }

    /**
     * 根据用户id和密码更改用户密码
     * @param userId 用户id
     * @param userPassword 用户密码
     * @return 返回更改状况
     */
    @Override
    public boolean changePwd(Integer userId, String userPassword) throws Exception {
        User user=new User();
        user.setUserId(userId);
        String password=SHAencrypt.encryptSHA(userPassword);
        user.setUserPassword(password);
        return userDAO.updateByPrimaryKeySelective(user)>0;
    }
}
