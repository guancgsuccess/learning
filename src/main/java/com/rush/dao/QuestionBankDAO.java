package com.rush.dao;

import com.rush.entity.QuestionBank;
import com.rush.util.OnlineQuestion;
import com.rush.util.PageModel;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * QuestionBankDAO继承基类
 */
@Repository
public interface QuestionBankDAO extends MyBatisBaseDao<QuestionBank, Integer> {

    public Integer selectCount();

    public List<QuestionBank> selectUserByPage(PageModel<QuestionBank> pageModel);

    public List<QuestionBank> selectByQuestionPaperId(Integer quetionPaperId);

    List<QuestionBank> selectQuestionByCompanyPaperId(Integer companyPaperId);

    List<String> selectAllAnswer(Integer companyPaperId);

    /**
     * 根据试卷id获得该张试卷的所有题目id
     * @param questionBankSpare 试卷id
     * @return
     */
    List<Integer> selectQuestionByQuestionPaperId(String questionBankSpare);

    List<QuestionBank> selectAllQuestions();


    List<OnlineQuestion> selectAllQuestionsV2();


    /******************/
    //添加试题
    public Integer addQuestion(QuestionBank questionBank);

    //删除试题
    public Integer removeQuestion(Integer id);

    //查询所有题目
    public List<QuestionBank> getAllQuestion(PageModel pageModel);

    //查询试题数量
    public Integer getQuestionCount(String companyName);

}