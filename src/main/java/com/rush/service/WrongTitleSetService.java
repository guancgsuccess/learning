package com.rush.service;

import com.rush.entity.Comment;
import com.rush.util.WrongQuestion;

import java.util.List;
import java.util.Map;

public interface WrongTitleSetService {
    /**
     * 查看错题详情
     * @param questionId
     * @return
     */
    Map<String,Object> showWrongQuestionDetailByQuestionId(Integer questionId);

    /**
     * 发表评论
     * @param comment
     * @return
     */
    Map<String,Object> postCommentByQuestionIdAndUserId(Comment comment);

    List<WrongQuestion> showAllWrongQuestions(Integer userId);
}
