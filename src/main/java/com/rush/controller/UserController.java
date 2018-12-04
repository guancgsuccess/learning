package com.rush.controller;


import com.rush.entity.LoginBean;
import com.rush.entity.RegisterBean;
import com.rush.entity.User;
import com.rush.entity.UserLogin;
import com.rush.service.PersonalInfoService;
import com.rush.service.UserLoginService;
import com.rush.service.UserService;
import com.rush.util.SHAencrypt;
import com.rush.util.TelMsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserLoginService userLoginService;

    @Autowired
    private PersonalInfoService personalInfoService;

    /**
     * 用户注册
     * @param registerBean 封装的注册信息
     * @param request 用户请求
     * @return 返回注册信息
     * @throws Exception
     */
    @RequestMapping("register")
    public String register(RegisterBean registerBean,HttpServletRequest request) throws Exception {
        String valid = (String)request.getSession().getAttribute("validCode");
        String userValid = registerBean.getRegisterValidCode()+registerBean.getRegisterPhone();
        if(valid.equals(userValid)){
            User user = userService.addUserData(registerBean);
            int result = userService.addUser(user);
            if(result>0){
                return "login";
            }else {
                return "register";
            }
        }
        return "register";
    }

    /**
     * 根据用户手机填写的号码发送验证码
     * @param phone 用户填写的手机号码
     * @param request 用户请求
     * @return 返回验证码和用户手机号码组成的字符串
     */
    @RequestMapping("forValid/{phone}")
    @ResponseBody
    public String getValidCode(@PathVariable String phone, HttpServletRequest request){
        TelMsgUtils telMsgUtils = new TelMsgUtils();
        telMsgUtils.sendMsgTo(phone);
        String validCode = telMsgUtils.randNum+phone;
        request.getSession().setAttribute("validCode",validCode);
        return validCode;
    }

    /**
     * 用户登录
     * @param loginBean 封装的用户登录信息
     * @param request 用户请求
     * @return 返回登录状况
     * @throws Exception
     */
    @RequestMapping("login")
    public String userLogin(LoginBean loginBean, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String prePassword=loginBean.getLoginPassword();
        Integer rememberStatus=loginBean.getRememberStatus();
        if(rememberStatus==null){
            rememberStatus=1;
        }
        String password = SHAencrypt.encryptSHA(loginBean.getLoginPassword());
        loginBean.setLoginPassword(password);
        User user = userService.selectByPhoneAndPwd(loginBean);
        if(user!=null){
            Cookie[] cookies=request.getCookies();
            int addFlag=1;
            for(int i=0;i<cookies.length;i++) {
                if("loginAccount".equals(cookies[i].getName())){
                    addFlag=0;
                }
            }
            //如果用户没有存cookie才可以添加
            if(addFlag==1) {
                Cookie cookieAccount = new Cookie("loginAccount", loginBean.getLoginAccount());
                Cookie cookiePassword = new Cookie("loginPassword", prePassword);
                if (rememberStatus==0) {
                    //设置Cookie的父路经
                    cookieAccount.setPath(request.getContextPath() + "/");
                    cookiePassword.setPath(request.getContextPath() + "/");
                    //保存Cookie的时间长度，单位为秒
                    cookieAccount.setMaxAge(7 * 24 * 60 * 60);
                    cookiePassword.setMaxAge(7 * 24 * 60 * 60);
                }
                if (rememberStatus==1) {
                    cookieAccount.setMaxAge(0);
                    cookiePassword.setMaxAge(0);
                }
                response.addCookie(cookieAccount);
                response.addCookie(cookiePassword);
            }
            UserLogin userLogin = userService.addUserLoginData(user,request);
            userLoginService.addUserLogin(userLogin);
            request.getSession().setAttribute("user",user);
            return "homepage";
        }else {
            request.setAttribute("loginFailureMsg","用户名或密码错误");
            return "login";
        }
    }


    /**
     * 获得记住密码产生的cookie
     * @param request
     * @return
     */
    @GetMapping("getCookie")
    @ResponseBody
    public Map<String,String> getCookie(HttpServletRequest request){
        String loginAccount="";
        String loginPassword="";
        Cookie[] cookies=request.getCookies();
        if(cookies!=null&&cookies.length>0){
            //遍历cookie
            for(int i=0;i<cookies.length;i++){
                Cookie cookie=cookies[i];
                if("loginAccount".equals(cookie.getName())){
                    loginAccount=cookie.getValue();
                }
                if("loginPassword".equals(cookie.getName())){
                    loginPassword=cookie.getValue();
                }
            }
        }
        Map<String,String> rememberMap=new HashMap<>();
        rememberMap.put("loginAccount",loginAccount);
        rememberMap.put("loginPassword",loginPassword);
        return rememberMap;
    }

    /**
     * 用户退出登录
     * @param request 用户请求
     * @return 跳转到退出登录的页面
     */
    @RequestMapping("logout")
    public String userLogout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "homepage";
    }

    /**
     * 验证用户填写的手机号码是否已被注册
     * @param userphone 用户填写的手机号码
     * @return 返回判断情况
     */
    @ResponseBody
    @RequestMapping("checkphone/{userphone}")
    public String checkPhone(@PathVariable String userphone){
        int result = userService.selectPhone(userphone);
        if(result>0){
            return "1";
        }
        return "2";
    }


    /**
     * 根据session里面的用户id查询用户基本信息，即展示基本用户信息
     * @param userId 用户id
     * @return
     */
    @GetMapping("basicInfo/showBasicInfo/{userId}")
    public ModelAndView showBasicInfo(@PathVariable Integer userId){
        User user=userService.queryUserById(userId);
        ModelAndView mav=new ModelAndView();
        mav.addObject("user",user);
        mav.setViewName("personal/basic-information");
        System.out.println(user);
        return mav;
    }

    /**
     * 编辑用户信息
     * @param user
     * @return
     */
    @PutMapping("basicInfo/editInfo")
    @ResponseBody
    public Map<String,Object> editInfo(User user, HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        Boolean flag=userService.modifyUser(user);
        User user1=userService.queryUserById(user.getUserId());
        HttpSession session=request.getSession();
        session.setAttribute("user",user1);
        session.setAttribute("infoMap",personalInfoService.showIntroduction(user.getUserId()));
        if(flag) {
            map.put("status", "success");
        }else{
            map.put("status","failed");
        }
        return map;
    }

    /**
     * 实名认证
     * @param userRealName 用户真实姓名
     * @param userIdcard 用户身份证号
     * @param userId 用户id
     * @param request 请求
     * @return 返回到个人中心首页
     */
    @PostMapping("basicInfo/realNameAuthentication")
    public String realNameAuthentication(String userRealName,String userIdcard,Integer userId,HttpServletRequest request){
        userService.realnameAuthentication(userRealName,userIdcard,userId);
        User user=userService.queryUserById(userId);
        request.getSession().setAttribute("user",user);
        return "personal-center";
    }


    /**
     * 修改绑定手机
     * @param userPhone 手机号码
     * @param userId 用户id
     * @param inputCode 手机短信验证码
     * @param request
     * @return
     */
    @PutMapping("setting/phone")
    @ResponseBody
    public Map<String, Object> settingPhone(String userPhone,Integer userId,String inputCode,HttpServletRequest request,HttpServletResponse response){
        String sessionCode=(String) request.getSession().getAttribute("phoneCode");
        Map<String,Object> map=userService.changePhoneByCode(userId,userPhone,inputCode,sessionCode);
        Cookie[] cookies=request.getCookies();
        for(int i=0;i<cookies.length;i++) {
            Cookie cookie = cookies[i];
            if ("loginAccount".equals(cookie.getName())) {
                cookie.setValue(userPhone);
                cookie.setPath(request.getContextPath() + "/");
                response.addCookie(cookie);
            }
        }
        return map;
    }

    /**
     * 根据邮箱验证码修改绑定邮箱
     * @param userEmail
     * @param userId 在.com后拼接一段无意义的参数防止邮箱被错误解析
     * @param inputCode
     * @param request
     * @return
     */
    @PutMapping("setting/email")
    @ResponseBody
    public Map<String, Object> settingEmail(String userEmail,Integer userId,String inputCode,HttpServletRequest request){
        String sessionCode=(String)request.getSession().getAttribute("emailCode");
        return userService.changeEmailByCode(userId,userEmail,inputCode,sessionCode);
    }

    /**
     * 修改密码
     * @param userPassword
     * @param userId
     * @return
     */
    @PutMapping("setting/password")
    @ResponseBody
    public String settingPassword(String userPassword,Integer userId,HttpServletRequest request,HttpServletResponse response){
        try {
            if(userService.changePwd(userId,userPassword)){
                Cookie[] cookies=request.getCookies();
                for(int i=0;i<cookies.length;i++){
                    Cookie cookie=cookies[i];
                    if("loginPassword".equals(cookie.getName())){
                        cookie.setValue(userPassword);
                        cookie.setPath(request.getContextPath() + "/");
                        response.addCookie(cookie);
                    }
                }
                return "修改密码成功";
            }else{
                return "修改密码失败";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "修改密码失败";
        }
    }

    /**
     * 根据手机号码发送手机短信验证码
     * @param userPhone 目标手机
     * @param request
     */
    @GetMapping("setting/sendPhoneCode/{userPhone}")
    public void sendPhoneCode(@PathVariable String userPhone,HttpServletRequest request){
        String phoneCode=userService.sendPhoneCode(userPhone);
        if(phoneCode!=null){
            request.getSession().setAttribute("phoneCode",phoneCode);
        }
    }

    /**
     * 根据邮箱发送邮箱验证码
     * @param userEmail 目标邮箱
     * @param request
     */
    @GetMapping("setting/sendEmailCode/{userEmail}&{userId}")
    public void sendEmailCode(@PathVariable String userEmail,@PathVariable Integer userId,HttpServletRequest request){
        String emailCode=userService.sendEmailCode(userEmail);
        if(emailCode!=null){
            request.getSession().setAttribute("emailCode",emailCode);
        }
    }


    /**
     * 判断用户输入的原密码是否正确
     * @param userPassword
     * @param request
     * @return
     */
    @GetMapping("setting/checkOldPwd/{userPassword}")
    @ResponseBody
    public Map<String, String> checkOldPwd(@PathVariable String userPassword,HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        Integer userId=user.getUserId();
        try {
            return userService.checkOldPwd(userPassword,userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 根据用户id展示用户信息
     * @param userId 用户id
     * @param session
     * @return 跳转到个人中心
     */
    @GetMapping("personal/showInfo/{userId}")
    public String showInfo(@PathVariable Integer userId,HttpSession session){
        Map<String,Object> infoMap=personalInfoService.showIntroduction(userId);
        session.setAttribute("infoMap",infoMap);
        return "personal-center";
    }
}
