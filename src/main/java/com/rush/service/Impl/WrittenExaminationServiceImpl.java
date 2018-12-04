package com.rush.service.Impl;

import com.rush.dao.*;
import com.rush.entity.Company;
import com.rush.entity.QuestionBank;
import com.rush.entity.User;
import com.rush.entity.WrittenTest;
import com.rush.service.WrittenExaminationService;
import com.rush.util.PaginationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class WrittenExaminationServiceImpl implements WrittenExaminationService {

    @Autowired
    private CompanyPaperDAO companyPaperDAO;
    @Autowired
    private QuestionBankDAO questionBankDAO;
    @Autowired
    private CompanyDAO companyDAO;
    @Autowired
    private UserDAO userDAO;
    @Autowired
    private WrittenTestDAO testDAO;
    @Autowired
    private HttpServletRequest request;

    /**
     * 查找公司ID对应试卷对应序号试题
     * @param companyId 公司ID
     * @param i 题目序号
     * @param answer 上一题目的答案
     * @return 返回题目详情
     */
    @Override
    public ModelAndView selectTestPaperByCompanyId(Integer companyId,Integer i,String answer) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            Integer companyPaperId = companyPaperDAO.selectCompanyPaperByCompanyId(companyId);
            WrittenTest test = new WrittenTest(user.getUserId(), companyId, companyPaperId, 0);
            if (testDAO.confirmUserDoneTest(test) == null) {
                List<QuestionBank> questionList = questionBankDAO.selectQuestionByCompanyPaperId(companyPaperId);
                ModelAndView mav = new ModelAndView();
                Map<Integer, String> testAnswer = (Map<Integer, String>) request.getSession().getAttribute("testAnswer");
                if (!answer.equals("answer") && !answer.equals("status") && !answer.equals("previous")) {
                    if (testAnswer == null) {
                        testAnswer = new HashMap<>();
                    }
                    testAnswer.put(i - 1, answer);
                    request.getSession().setAttribute("testAnswer", testAnswer);
                }
                mav.addObject("i", i);
                if (testAnswer != null) {
                    mav.addObject("answer", testAnswer.get(i));
                }
                if (answer.equals("status")) {
                    mav.addObject("index", "3600");
                } else if (!answer.equals("answer")) {
                    mav.addObject("index", "start");
                }
                mav.addObject("companyId", companyId);
                mav.addObject("questionBankList", questionList);
                mav.setViewName("writtenExamination");
                return mav;
            } else {
                return selectInterviewOffer(companyId, user.getUserId());
            }
        } else {
            ModelAndView mav = selectAllCompanyByCompanyId(1);
            mav.addObject("message","message");
            return mav;
        }
    }

    /**
     * 按页码查找公司试卷信息
     * @param page 当前页码
     * @return 返回当前页码显示的公司试卷信息
     */
    @Override
    public ModelAndView selectAllCompanyByCompanyId(Integer page) {
        PaginationUtil<Company> pages = new PaginationUtil<>();
        Integer currentPage = null;
        if (page == null)
            currentPage = 1;
        else
            currentPage = page;
        int totalCount = selectCompanyCount();
        pages.setPageSize(8);
        pages.setTotalRecord(totalCount);
        pages.setCurrentPageCode(currentPage);
        pages.setTotalPages(totalCount%pages.getPageSize() == 0?(totalCount/pages.getPageSize()):(totalCount/pages.getPageSize()+1));
        pages.setStartRecord((currentPage - 1)*pages.getPageSize());
        List<Integer> list = companyPaperDAO.selectAllCompanyByCompanyId(pages);
        List<Company> companyList = new LinkedList<>();
        for (Integer i : list) {
            Company company = companyDAO.selectByPrimaryKey(i);
            company.setCompanySpare(companyPaperDAO.selectCompanyPaperDeadlineByCompanyPaperId(i));
            String companyName = company.getCompanyName().replace("有限公司","");
            company.setCompanyName(companyName);
            companyList.add(company);
        }
        pages.setModelList(companyList);
        ModelAndView mav = new ModelAndView();
        mav.addObject("companyList",companyList);
        mav.addObject("pages",pages);
        request.getSession().removeAttribute("testAnswer");
        mav.setViewName("companyPaper");
        return mav;
    }

    /**
     * 查找公司试卷的总数
     * @return 返回公司试卷总数
     */
    @Override
    public Integer selectCompanyCount() {
        return companyPaperDAO.selectCompanyCount();
    }

    /**
     * 查找笔试结果
     * @param companyId 公司ID
     * @param userId 用户ID
     * @return 返回该用户在该公司的笔试结果
     */
    @Override
    public ModelAndView selectInterviewOffer(Integer companyId, Integer userId) {
        ModelAndView mav = new ModelAndView();
        String companyName = companyDAO.selectCompanyNameByPrimaryId(companyId);
        String userName = userDAO.selectUserNameByUserId(userId);
        Map<String,Integer> map = new HashMap<>();
        map.put("companyId",companyId);
        map.put("userId",userId);
        WrittenTest test = testDAO.selectInterviewOffer(map);
        mav.addObject("companyName",companyName);
        mav.addObject("userName",userName);
        mav.addObject("test",test);
        mav.setViewName("interview_offer");
        return mav;
    }

    /**
     * 查找公司试卷的试题答案
     * @param companyId 公司ID
     * @return 返回试题答案
     */
    @Override
    public List<String> selectAllAnswer(Integer companyId) {
        Integer paperId = companyPaperDAO.selectCompanyPaperByCompanyId(companyId);
        List<String> answer = questionBankDAO.selectAllAnswer(paperId);
        return answer;
    }

    /**
     * 提前交卷或交卷
     * @param companyId 公司ID
     * @param i 当前试题序号
     * @param answer 当前试题答案
     * @return 返回笔试结果
     */
    @Override
    public ModelAndView earlyDelivery(Integer companyId, Integer i, String answer) {
        Map<Integer,String> testAnswer = (Map<Integer, String>) request.getSession().getAttribute("testAnswer");
        if (!answer.equals("answer")) {
            if (testAnswer == null) {
                testAnswer = new HashMap<>();
            }
            testAnswer.put(i, answer);
            System.out.println(i);
            System.out.println(testAnswer.get(i));
            request.getSession().setAttribute("testAnswer", testAnswer);
        }
        int count = 0;
        List<String> questionAnswer = selectAllAnswer(companyId);
        for (Integer k : testAnswer.keySet()) {
            if (testAnswer.get(k).equals(questionAnswer.get(k))){
                count++;
            }
        }
        Integer paperId = companyPaperDAO.selectCompanyPaperByCompanyId(companyId);
        int score = (count/(questionAnswer.size())) * 100;
        User user = (User) request.getSession().getAttribute("user");
        WrittenTest test = new WrittenTest();
        test.setCompanyId(companyId);
        test.setCompanyPaperId(paperId);
        test.setUserId(user.getUserId());
        test.setWrittenTestScore(score);
        test.setWrittenTestStatus(0);
        testDAO.insert(test);
        return selectInterviewOffer(companyId,user.getUserId());
    }
}