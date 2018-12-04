package com.rush.service.Impl;

import com.rush.dao.*;
import com.rush.entity.Comment;
import com.rush.entity.QuestionBank;
import com.rush.entity.QuestionPaper;
import com.rush.entity.UserQuestion;
import com.rush.service.WrongTitleSetService;
import com.rush.util.WrongQuestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class WrongTitleSetServiceImpl implements WrongTitleSetService {
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private UserQuestionDAO userQuestionDAO;
    @Autowired
    private QuestionBankDAO questionBankDAO;
    @Autowired
    private CommentDAO commentDAO;

    /**
     * 根据题目id查询所有的评论及题目详细信息
     * @param questionId
     * @return
     */
    @Override
    public Map<String, Object> showWrongQuestionDetailByQuestionId(Integer questionId) {
        Map<String,Object> detailMap=new HashMap<>();

        //根据题目id查询题目详细信息
        QuestionBank questionBank=questionBankDAO.selectByPrimaryKey(questionId);
        //获得该题目的题目内容
        String questionContext=questionBank.getQuestionContext();
        //获得该题目的题目正确答案
        String questionAnswer=questionBank.getQuestionAnswer();
        //获得该题目的A选型
        String questionOptiona=questionBank.getQuestionOptiona();
        //获得该题目的B选型
        String questionOptionb=questionBank.getQuestionOptionb();
        //获得该题目的C选型
        String questionOptionc=questionBank.getQuestionOptionc();
        //获得该题目的D选型
        String questionOptiond=questionBank.getQuestionOptiond();

        detailMap.put("questionContext",questionContext);
        detailMap.put("questionAnswer",questionAnswer);
        detailMap.put("questionOptiona",questionOptiona);
        detailMap.put("questionOptionb",questionOptionb);
        detailMap.put("questionOptionc",questionOptionc);
        detailMap.put("questionOptiond",questionOptiond);

        //根据题目id查询出该题目的所有评论
        List<Comment> comments=commentDAO.selectCommentsByQuestionId(questionId);
        Map<Integer,String> userNameMap=new HashMap<>();
        for (Comment c:comments){
            Integer userId=c.getCommentUserId();
            String userName=userDAO.selectUserNameByPrimaryKey(userId);
            userNameMap.put(userId,userName);
        }
        detailMap.put("userNameMap",userNameMap);
        detailMap.put("comments",comments);
        detailMap.put("questionId",questionId);
        return detailMap;
    }

    @Override
    public Map<String, Object> postCommentByQuestionIdAndUserId(Comment comment) {
        int rows=commentDAO.insertSelective(comment);
        if(rows>0){
            return showWrongQuestionDetailByQuestionId(comment.getCommentQuestionId());
        }
        return null;
    }

    /**
     * 查询某用户的所有错题信息
     * @param userId
     * @return
     */
    @Override
    public List<WrongQuestion> showAllWrongQuestions(Integer userId) {
        return userQuestionDAO.selectAllWrongQuestionsByUserId(userId);
    }


}
