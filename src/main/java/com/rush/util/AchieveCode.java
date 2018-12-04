package com.rush.util;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class AchieveCode {

    //生成随机验证码
    public String achieveCode() {
        String[] beforeShuffle = new String[]{"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(4, 8);
        return result;
    }

    // 发送验证码
    public String sendEmailCode(String email) {
        HtmlEmail send = new HtmlEmail();// 获取随机验证码
        String resultCode = achieveCode();
        try {
            send.setHostName("smtp.qq.com");
            send.setSmtpPort(465); //端口号
            send.setSSLOnConnect(true); //开启SSL加密
            send.setCharset("utf-8");
            send.addTo(email); //接收者的QQEmail
            send.setFrom("itmeteor@foxmail.com", "欢迎来到Learning学习网站！");//第一个参数是发送者的QQEmail   第二个参数是发送者QQ昵称"
            send.setAuthentication("itmeteor@foxmail.com", "zfgawuwirskubcge"); //第一个参数是发送者的QQEamil,第二个参数是刚刚获取的授权码
            send.setSubject("老DJ给您送上验证码"); //Email的标题  第一个参数是我写的判断上下午，删掉即可
            send.setMsg("<div style=\"text-align:center; font-family: 微软雅黑;font-size: 18px\">\n" +
                    "    感谢使用Learning学习网站！ <br>\n" +
                    "        验证码：<a style=\"color:blue; font-size: 25px; text-decoration: none\">" + resultCode + "</a>\n" +
                    "  </div>"); //Eamil的内容
            send.send(); //发送
        } catch (EmailException e) {
            e.printStackTrace();
        }
        return resultCode; //同等验证码
    }


}
