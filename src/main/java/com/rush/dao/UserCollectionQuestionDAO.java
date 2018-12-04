package com.rush.dao;

import com.rush.entity.CollectBean;
import com.rush.entity.UserCollectionQuestion;
import com.rush.util.CollectionQuestion;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * UserCollectionQuestionDAO继承基类
 */
@Repository
public interface UserCollectionQuestionDAO extends MyBatisBaseDao<UserCollectionQuestion, Integer> {

    public Integer selectByUserIdAndQuestionId(CollectBean collectBean);



    /**
     * 获得该用户的所有收藏记录
     * @param userId
     * @return
     */
    List<UserCollectionQuestion> selectUserCollectionQuestionsByUserId(Integer userId);

    int updateTagNameByUserIdAndQuestionId(@Param("userId") Integer userId, @Param("questionId") Integer questionId, @Param("tagName") String tagName);

    int deleteQuestionByUserIdAndQuestionId(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 获得该用户最近的8条收藏记录
     * @param userId
     * @return
     */
    List<UserCollectionQuestion> selectUserCollectionsByUserId(Integer userId);

    /**
     * 查询收藏界面展示所需要的信息
     * @param userId
     * @return
     */
    List<CollectionQuestion> selectAllCollectionQuestionsByUserId(Integer userId);

}