package com.rush.service;
import com.rush.entity.QuestionBank;
import com.rush.util.CollectionQuestion;
import java.util.List;

/**
 * 收藏模块业务层
 */
public interface CollectionTopicService {

    /**
     * 获得某用户的所有收藏题目方法二（效率高）
     * @param userId 用户id
     * @return
     */
    List<CollectionQuestion>showCollectionTopicsV2(Integer userId);

    boolean modifyQuestionTagName(Integer userId, Integer questionId, String tagName);

    boolean removeQuestionFromCollectionTopics(Integer userId, Integer questionId);


}
