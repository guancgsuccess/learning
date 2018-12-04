package com.rush.service;

import com.rush.entity.AnswerProofread;
import com.rush.entity.QuestionBank;
import com.rush.entity.QuestionPaper;
import com.rush.util.PageModel;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface QuestionBankService {

    public Integer getCount();

    public PageModel<QuestionBank> getQuestionByPage(PageModel<QuestionBank> page);

    public List<QuestionBank> selectByQuestionPaperId(Integer questionPaperId);

    public AnswerProofread addAnswerProofreadData(QuestionPaper questionPaper,String answer,List<QuestionBank> questionBanks,String useTime,HttpServletRequest request);


    /*******************/
    //添加试题
    public Integer addQuestion(QuestionBank questionBank);

    //删除试题
    public Integer removeQuestion(Integer id);

    //查询所有题目
    public ModelAndView getAllQuestion(String companyName, String currentPage, Integer id);

    //查询试题数量
    public Integer getQuestionCount(String companyName);

}
