package com.rush.controller;

import com.rush.util.AchieveCode;
import com.rush.util.TelMsgUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/verifyCode")
public class VerifytCodeController {
    @Autowired
    private AchieveCode achieveCode;
    @Autowired
    private TelMsgUtils telMsgUtils;


    /**
     * 邮箱验证码
     * @param email 收件人邮箱
     * 将邮箱验证码存入session中，用K,V存取
     */
    @PostMapping("/email")
    @ResponseBody
    public void receiveEmailVerifyCode(String email, HttpServletRequest request) {
        request.getSession().setAttribute("emailVerifyCode",achieveCode.sendEmailCode(email));
    }

    /**
     * 短信验证码
     * @param phone 收件人电话号码
     * 将短信验证码存入session中，用K,V存取
     */
    @PostMapping("/phone")
    @ResponseBody
    public void receivePhoneVerifyCode(String phone,HttpServletRequest request) {
        telMsgUtils.sendMsgTo(phone);
        request.getSession().setAttribute("phoneVerifyCode",telMsgUtils.randNum);
    }
}
