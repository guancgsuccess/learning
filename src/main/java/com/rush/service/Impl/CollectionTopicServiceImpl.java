package com.rush.service.Impl;

import com.rush.dao.UserCollectionQuestionDAO;
import com.rush.service.CollectionTopicService;
import com.rush.util.CollectionQuestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class CollectionTopicServiceImpl implements CollectionTopicService {
    @Autowired
    private UserCollectionQuestionDAO userCollectionQuestionDAO;



    /**
     * 根据用户id查询该用户所有的收藏题目【方法二】
     * @param userId 用户id
     * @return
     */
    @Override
    public List<CollectionQuestion> showCollectionTopicsV2(Integer userId) {
        return userCollectionQuestionDAO.selectAllCollectionQuestionsByUserId(userId);
    }

    /**
     * 修改标签名
     * @param userId 用户id
     * @param questionId 题目id
     * @param tagName 标签名
     * @return
     */
    @Override
    public boolean modifyQuestionTagName(Integer userId, Integer questionId,String tagName) {
        return userCollectionQuestionDAO.updateTagNameByUserIdAndQuestionId(userId,questionId,tagName)>0;
    }

    /**
     * 删除标签名
     * @param userId 用户id
     * @param questionId 题目id
     * @return
     */
    @Override
    public boolean removeQuestionFromCollectionTopics(Integer userId, Integer questionId) {
        return userCollectionQuestionDAO.deleteQuestionByUserIdAndQuestionId(userId,questionId)>0;
    }


}
