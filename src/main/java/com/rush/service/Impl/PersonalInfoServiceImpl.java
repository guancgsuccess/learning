package com.rush.service.Impl;

import com.rush.dao.CommentDAO;
import com.rush.dao.UserCollectionQuestionDAO;
import com.rush.dao.UserDAO;
import com.rush.dao.UserQuestionDAO;
import com.rush.entity.Comment;
import com.rush.entity.User;
import com.rush.entity.UserCollectionQuestion;
import com.rush.service.PersonalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {
    @Autowired
    private CommentDAO commentDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private UserQuestionDAO userQuestionDAO;
    @Autowired
    private UserCollectionQuestionDAO userCollectionQuestionDAO;

    /**
     * 根据用户id展示用户信息
     * @param userId 用户id
     * @return 封装的用户信息
     */
    @Override
    public Map<String, Object> showIntroduction(Integer userId) {
        Map<String,Object> map=new HashMap<>();
        //获得该用户的评论数
        Integer commentCount=commentDAO.selectAllCommentByUserId(userId).size();
        map.put("commentCount",commentCount);

        //获得该用户的最新评论
        Comment comment=commentDAO.selectOneLatestCommentByUserId(userId);
        if(comment!=null) {
            String commentContent = comment.getCommentContent();
            map.put("commentContent", commentContent);
        }
        if(comment==null){
            map.put("commentContent", "暂无评论，赶紧去评论吧！");
        }
        //获得该用户的工作经验
        User user=userDAO.selectByPrimaryKey(userId);
        String workexp=user.getUserWorkExperience();
        if(workexp!=null||workexp!="") {
            map.put("workexp", workexp);
        }
        if (workexp==null||workexp==""){
            map.put("workexp", "赶紧去完善您的工作信息吧");
        }
        //获得该用户最近的8条收藏记录
        List<UserCollectionQuestion> userCollectionQuestions=userCollectionQuestionDAO.selectUserCollectionsByUserId(userId);
        //获得该用户最近添加的8个标签
        List<String> tagNames=new ArrayList<>();
        for(UserCollectionQuestion ucq:userCollectionQuestions){
            tagNames.add(ucq.getUserCollectionQuestionSpare());
        }
        //获得该用户有多少个收藏题目数量
        Integer collectionCount=userCollectionQuestionDAO.selectUserCollectionQuestionsByUserId(userId).size();
        map.put("collectionCount",collectionCount);
        map.put("tagNames",tagNames);
        //获得该用户的正确题数
        Integer correctCount=userQuestionDAO.selectAllCorrectQuestionsByUserId(userId);
        map.put("correctCount",correctCount);
        return map;
    }
}
