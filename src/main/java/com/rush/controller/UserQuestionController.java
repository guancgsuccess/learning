package com.rush.controller;

import com.rush.entity.User;
import com.rush.entity.UserQuestionBean;
import com.rush.service.UserQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/userquestion")
public class UserQuestionController {

    @Autowired
    private UserQuestionService userQuestionService;

    /**
     * 根据用户id获取用户题目信息
     * @param request 用户请求
     * @return 返回封装的用户题目信息
     */
    @ResponseBody
    @RequestMapping("data")
    public UserQuestionBean getUserQuestionBean(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        UserQuestionBean userQuestionBean = userQuestionService.selectDatasByUserId(user.getUserId());
        return userQuestionBean;
    }
}
