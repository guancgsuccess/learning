package com.rush.service.Impl;

import com.rush.dao.CompanyDAO;
import com.rush.dao.QuestionBankDAO;
import com.rush.dao.UserQuestionDAO;
import com.rush.entity.*;
import com.rush.service.QuestionBankService;
import com.rush.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Service
public class QuestionBankServiceImp implements QuestionBankService {

    @Autowired
    private QuestionBankDAO questionBankDAO;

    @Autowired
    private UserQuestionDAO userQuestionDAO;

    @Autowired
    private CompanyDAO companyDAO;

    @Override
    public Integer getCount() {
        return questionBankDAO.selectCount();
    }

    /**
     * 根据page信息获取该页面要展示的信息
     * @param page 封装的部分page信息
     * @return 返回封装的完整page信息
     */
    @Override
    public PageModel<QuestionBank> getQuestionByPage(PageModel<QuestionBank> page) {
        List<QuestionBank> questionBanks = questionBankDAO.selectUserByPage(page);
        page.setModelList(questionBanks);
        return page;
    }

    /**
     * 根据题目试卷id获取该试卷所有题目
     * @param questionPaperId 题目诗卷id
     * @return 返回该试卷的所有题目信息
     */
    @Override
    public List<QuestionBank> selectByQuestionPaperId(Integer questionPaperId) {
        List<QuestionBank> questionBanks = questionBankDAO.selectByQuestionPaperId(questionPaperId);
        return questionBanks;
    }

    /**
     * 根据试卷、用户答案、试题、用户所用时间来封装整合成AnswerProofread
     * @param questionPaper 试卷
     * @param answer 用户答案
     * @param questionBanks 试题
     * @param useTime 用户做题时间
     * @param request 用户请求
     * @return 返回封装的AnswerProofread信息
     */
    @Override
    public AnswerProofread addAnswerProofreadData(QuestionPaper questionPaper,String answer,List<QuestionBank> questionBanks,String useTime,HttpServletRequest request) {
        AnswerProofread answerProofread = new AnswerProofread();
        answerProofread.setQuestionPaperId(questionPaper.getQuestionPaperId());
        answerProofread.setQuestionTitle(questionPaper.getQuestionPaperTitle());
        answerProofread.setQuestionNum(questionPaper.getQuestionPaperNumber());
        answerProofread.setUserAnswer(answer);
        answerProofread.setUseTime(useTime);
        answerProofread.setQuestionBanks(questionBanks);
        String correcrAnswer = "";
        int[] questionBankIds = new int[questionPaper.getQuestionPaperNumber()];
        int count = 0;
        for(QuestionBank qb:questionBanks){
            correcrAnswer += qb.getQuestionAnswer();
            questionBankIds[count++] = qb.getQuestionId();
        }
        answerProofread.setCorrectAnswer(correcrAnswer);
        char[] arrCorrect = correcrAnswer.toCharArray();
        char[] userCorrect = answer.toCharArray();
        int correctNum = 0;
        int uncompleted = 0;
        int[] resultArr = new int[questionPaper.getQuestionPaperNumber()];
        for(int i=0;i<arrCorrect.length;i++){
            if(arrCorrect[i]==userCorrect[i]){
                correctNum++;
                resultArr[i] = 0;
            }
            else {
                resultArr[i] = 1;
            }
            if(userCorrect[i]=='E'){
                uncompleted++;
            }
        }
        if(request!=null){
            User user = (User)request.getSession().getAttribute("user");
            if(user!=null){
                for(int j=0;j<questionBankIds.length;j++){
                    UserQuestion userQuestion = new UserQuestion();
                    userQuestion.setUserId(user.getUserId());
                    userQuestion.setQuestionId(questionBankIds[j]);
                    userQuestion.setQuestionCorrect(resultArr[j]);
                    UserQuestion row = userQuestionDAO.selectByUserIdAndQuestionId(userQuestion);
                    if(row!=null){
                        userQuestion.setUserQuestionId(row.getUserQuestionId());
                        if(resultArr[j]==1){
                            userQuestion.setQuestionAnsweredStatus(1);
                        }else {
                            if(row.getQuestionAnsweredStatus()==1){
                                userQuestion.setQuestionAnsweredStatus(1);
                            }else {
                                userQuestion.setQuestionAnsweredStatus(resultArr[j]);
                            }
                        }
                        userQuestionDAO.updateByPrimaryKey(userQuestion);
                    }else {
                        if(resultArr[j]==0){
                            userQuestion.setQuestionAnsweredStatus(0);
                        }else {
                            userQuestion.setQuestionAnsweredStatus(1);
                        }
                        userQuestionDAO.insert(userQuestion);
                    }
                }
            }
        }
        answerProofread.setUncompleted(uncompleted);
        answerProofread.setCorrectNum(correctNum);
        return answerProofread;
    }

    //添加试题
    @Override
    public Integer addQuestion(QuestionBank questionBank) {
        int rows = questionBankDAO.addQuestion(questionBank);
        return rows;
    }

    //删除试题
    @Override
    public Integer removeQuestion(Integer id) {
        int rows = questionBankDAO.removeQuestion(id);
        return rows;
    }

    //查询所有题目
    @Override
    public ModelAndView
    getAllQuestion(String companyName, String currentPage,Integer companyId) {
        PageModel<QuestionPaper> page = new PageModel<>();
        if(currentPage == null){
            page.setCompanyName(companyName);
            page.setCurrentPageCode(1);
            page.setTotalRecord(questionBankDAO.getQuestionCount(companyName));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord(0);
        }else{
            page.setCompanyName(companyName);
            Integer currentPageCode = Integer.parseInt(currentPage);
            page.setCurrentPageCode(currentPageCode);
            page.setTotalRecord(questionBankDAO.getQuestionCount(companyName));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord((currentPageCode-1)*5);
            page.setTotalRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        }

        List<QuestionBank> questionList = questionBankDAO.getAllQuestion(page);
        ModelAndView mav = new ModelAndView();
        Company companyInfo = companyDAO.getCompanyInfo(companyId);
        mav.addObject("questionList",questionList);
        mav.addObject("companyInfo",companyInfo);
        mav.addObject("page",page);
        mav.setViewName("company_questions");
        return mav;
    }

    //查询试题数量
    @Override
    public Integer getQuestionCount(String name) {
        int questionCount = questionBankDAO.getQuestionCount(name);
        return questionCount;
    }
}
