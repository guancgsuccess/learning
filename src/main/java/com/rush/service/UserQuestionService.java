package com.rush.service;

import com.rush.entity.UserQuestion;
import com.rush.entity.UserQuestionBean;

public interface UserQuestionService {
    UserQuestionBean selectDatasByUserId(Integer userId);
}
