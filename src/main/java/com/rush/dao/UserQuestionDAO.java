package com.rush.dao;

import com.rush.entity.UserQuestion;
import com.rush.util.WrongQuestion;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * UserQuestionDAO继承基类
 */
@Repository
public interface UserQuestionDAO extends MyBatisBaseDao<UserQuestion, Integer> {
    UserQuestion selectByUserIdAndQuestionId(UserQuestion userQuestion);
    List<UserQuestion> selectForUserQuestion(Integer userId);

    List<UserQuestion> selectUserQuestionsByUserId(Integer userId);

    Integer selectAllCorrectQuestionsByUserId(Integer userId);

    Integer selectAllCompleteQuestionsByUserId(Integer userId);

    UserQuestion selectUserQuestionByQuestionIdAndUserId(@Param("questionId") Integer questionId, @Param("userId") Integer userId);

    /**
     * 根据用户id查询所有错题
     * @param userId
     * @return
     */
    List<WrongQuestion> selectAllWrongQuestionsByUserId(Integer userId);
}