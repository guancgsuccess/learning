package com.rush.ui;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("transfer")
public class Transfer {
    //跳转到注册界面
    @RequestMapping("go2Register")
    public String go2Register(){
        return "register";
    }

    //跳转到登陆界面
    @RequestMapping("go2Login")
    public String go2Login(){
        return "login";
    }


    //跳转刷题页面
    @RequestMapping("go2BrushQuestions")
    public String go2BrushQuestions(){
        return "personal/brush-questions";
    }

    //跳转错题页面
    @RequestMapping("go2WrongSet")
    public String go2WrongSet(){
        return "personal/wrong-set";
    }

    //跳转在线题目页面
    @RequestMapping("go2OnlineSet")
    public String go2OnlineSet(){
        return "personal/online-set";
    }


    //跳转实名认证界面
    @RequestMapping("go2RealNameAuthentication")
    public String go2RealNameAuthentication(){
        return "personal/realName-authentication";
    }

    //跳转个人首页
    @RequestMapping("go2PersonalCenter")
    public String go2PersonalCenter(){
        return "personal-center";
    }

    //去错题详情页面
    @RequestMapping("go2WrongQuestionDetail")
    public String go2WrongQuestionDetail(){
        return "personal/question_details";
    }

    //跳转点击手机已被注册后的界面
    @RequestMapping("go2ChangePhoneTips")
    public String go2ChangePhoneTips(){
        return "personal/change-phone";
    }

}
