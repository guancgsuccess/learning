package com.rush.service.Impl;

import com.rush.dao.UserQuestionDAO;
import com.rush.entity.UserQuestion;
import com.rush.entity.UserQuestionBean;
import com.rush.service.UserQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserQuestionServiceImpl implements UserQuestionService {

    @Autowired
    private UserQuestionDAO userQuestionDAO;

    /**
     * 根据用户id查询题目信息
     * @param userId 用户id
     * @return 返回封装的题目信息
     */
    @Override
    public UserQuestionBean selectDatasByUserId(Integer userId) {
        List<UserQuestion> userQuestions = userQuestionDAO.selectForUserQuestion(userId);
        UserQuestionBean userQuestionBean = new UserQuestionBean();
        int questionNum = 0;
        int correctNum = 0;
        int erroNum = 0;
        for(UserQuestion uq:userQuestions){
            questionNum++;
            if(uq.getQuestionCorrect()==0){
                correctNum++;
            }else {
                erroNum++;
            }
        }
        userQuestionBean.setQuestionNum(questionNum);
        userQuestionBean.setCorrectNum(correctNum);
        userQuestionBean.setErroNum(erroNum);
        return userQuestionBean;
    }
}
