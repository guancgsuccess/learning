package com.rush.controller;

import com.rush.entity.AnswerProofread;
import com.rush.entity.QuestionBank;
import com.rush.entity.QuestionPaper;
import com.rush.service.QuestionBankService;
import com.rush.service.QuestionPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/questionbank")
public class QuestionBankController {

    @Autowired
    private QuestionBankService questionBankService;

    @Autowired
    private QuestionPaperService questionPaperService;

    /**
     * 根据试卷id进入练习
     * @param questionPaperId 题目所属试卷id
     * @return 跳转到题目练习界面
     */
    @RequestMapping("test/{questionPaperId}")
    public ModelAndView testQuestion(@PathVariable Integer questionPaperId){
        ModelAndView mav = new ModelAndView();
        List<QuestionBank> questionBanks = questionBankService.selectByQuestionPaperId(questionPaperId);
        int questionNum = questionPaperService.getQuestionNum(questionPaperId);
        mav.addObject("questionBanks",questionBanks);
        mav.addObject("questionNum",questionNum);
        mav.addObject("questionPaperId",questionPaperId);
        mav.setViewName("question-practice");
        return mav;
    }

    /**
     * 提交答案、试卷id以及做题使用时间
     * @param answer 做题人的答案
     * @param questionPaperId 试卷id
     * @param useTime 做题者使用时间
     * @param request 用户请求
     * @return 跳转到评估界面，做出系统分析
     */
    @RequestMapping("submitanswer/{answer}/{questionPaperId}/{useTime}")
    public ModelAndView submitAnswer(@PathVariable String answer,@PathVariable Integer questionPaperId,@PathVariable String useTime,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        QuestionPaper questionPaper = questionPaperService.selectByQuestionPaperId(questionPaperId);
        List<QuestionBank> questionBanks = questionBankService.selectByQuestionPaperId(questionPaperId);
        AnswerProofread answerProofread = questionBankService.addAnswerProofreadData(questionPaper,answer,questionBanks,useTime,request);
        mav.addObject("answerProofread",answerProofread);
        mav.setViewName("question-assessment");
        return mav;
    }

    /**
     * 系统根据用户做题情况做出粗略分析
     * @param questionPaperId 试卷id
     * @param answer 用户答案
     * @param useTime 用户使用时间
     * @return 跳转到评估界面
     */
    @RequestMapping("assessment/{questionPaperId}/{answer}/{useTime}")
    public ModelAndView getAssessment(@PathVariable Integer questionPaperId,@PathVariable String answer,@PathVariable String useTime){
        return submitAnswer(answer,questionPaperId,useTime,null);
    }

    /**
     * 系统结合用户做题情况给出解析
     * @param questionPaperId 试卷id
     * @param answer 用户答案
     * @param useTime 用户使用时间
     * @return 跳转到解析界面
     */
    @RequestMapping("analysis/{questionPaperId}/{answer}/{useTime}")
    public ModelAndView getAnalysis(@PathVariable Integer questionPaperId,@PathVariable String answer,@PathVariable String useTime){
        ModelAndView mav = submitAnswer(answer,questionPaperId,useTime,null);
        mav.setViewName("question-analysis");
        return mav;
    }
}
