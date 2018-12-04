package com.rush.service.Impl;

import com.rush.dao.CompanyDAO;
import com.rush.dao.QuestionPaperDAO;
import com.rush.dao.UserCollectionQuestionDAO;
import com.rush.entity.CollectBean;
import com.rush.entity.Company;
import com.rush.entity.QuestionPaper;
import com.rush.entity.UserCollectionQuestion;
import com.rush.service.QuestionPaperService;
import com.rush.util.PageModel;
import org.apache.commons.collections4.QueueUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Service
public class QuestionPaperServiceImpl implements QuestionPaperService {

    @Autowired
    private QuestionPaperDAO questionPaperDAO;

    @Autowired
    private UserCollectionQuestionDAO userCollectionQuestionDAO;

    @Autowired
    private CompanyDAO companyDAO;

    @Override
    public Integer getCount() {
        return questionPaperDAO.selectCount();
    }

    /**
     * 根据部分page信息完善page
     * @param page 部分page信息
     * @return 返回完整的page信息
     */
    @Override
    public PageModel<QuestionPaper> getQuestionByPage(PageModel<QuestionPaper> page) {
        List<QuestionPaper> questionPapers = questionPaperDAO.selectQuestionByPage(page);
        page.setModelList(questionPapers);
        return page;
    }

    /**
     * 根据试卷id查询该试卷
     * @param questionPaperId 试卷id
     * @return 返回完整的试卷信息
     */
    @Override
    public QuestionPaper selectByQuestionPaperId(Integer questionPaperId) {
        QuestionPaper questionPaper = questionPaperDAO.selectByPrimaryKey(questionPaperId);
        return questionPaper;
    }

    /**
     * 根据试卷id查询该试卷的题目数量
     * @param questionPaperId 试卷id
     * @return 返回试卷题目数量
     */
    @Override
    public Integer getQuestionNum(Integer questionPaperId) {
        int result = questionPaperDAO.getQuestionPaperNumber(questionPaperId);
        return result;
    }

    /**
     * 根据所选语言进行分页
     * @param page 部分按语言分页信息
     * @return 返回完整按语言分页信息
     */
    @Override
    public PageModel<QuestionPaper> selectQuestionByPageAndLanguage(PageModel<QuestionPaper> page) {
        List<QuestionPaper> questionPapers = questionPaperDAO.selectQuestionByPageAndLanguage(page);
        page.setModelList(questionPapers);
        return page;
    }

    /**
     * 根据所选公司进行分页
     * @param page 部分按公司分页信息
     * @return 返回完整的按公司的分页信息
     */
    @Override
    public PageModel<QuestionPaper> selectQuestionByPageAndCompany(PageModel<QuestionPaper> page) {
        List<QuestionPaper> questionPapers = questionPaperDAO.selectQuestionByPageAndCompany(page);
        page.setModelList(questionPapers);
        return page;
    }

    /**
     * 根据所选时间进行分页
     * @param page 部分按时间分页的信息
     * @return 返回完整的按时间的分页信息
     */
    @Override
    public PageModel<QuestionPaper> selectQuestionByPageAndTime(PageModel<QuestionPaper> page) {
        List<QuestionPaper> questionPapers = questionPaperDAO.selectQuestionByPageAndTime(page);
        page.setModelList(questionPapers);
        return page;
    }

    /**
     * 按语言分页的所有信息条数
     * @param language 所选语言
     * @return 返回信息条数
     */
    @Override
    public Integer selectCountByLanguage(String language) {
        int count = questionPaperDAO.selectCountByLanguage(language);
        return count;
    }

    /**
     * 按公司分页的所有信息条数
     * @param company 所选公司
     * @return 返回信息条数
     */
    @Override
    public Integer selectCountByCompany(String company) {
        int count = questionPaperDAO.selectCountByCompany(company);
        return count;
    }

    /**
     * 按时间分页的所有信息条数
     * @param time 所选时间
     * @return 返回信息条数
     */
    @Override
    public Integer selectCountByTime(String time) {
        int count = questionPaperDAO.selectCountByTime(time);
        return count;
    }

    /**
     * 根据封装的收集的试题信息进行收藏
     * @param userCollectionQuestion 封装的将要收藏的试题信息
     * @return 返回收藏情况
     */
    @Override
    public Integer collectQuestionPaper(UserCollectionQuestion userCollectionQuestion) {
        int result = userCollectionQuestionDAO.insert(userCollectionQuestion);
        return result;
    }

    /**
     * 根据根据用户和试卷信息查询
     * @param collectBean 封装的部分用户和试卷信息
     * @return 返回用户收藏情况
     */
    public Integer selectByUserAndQuestionpaper(CollectBean collectBean){
        int result = userCollectionQuestionDAO.selectByUserIdAndQuestionId(collectBean);
        return result;
    }

    /**
     * 根据要展示信息条数获取部分数据
     * @param count 要展示的信息条数
     * @return 返回试卷信息
     */
    @Override
    public List<QuestionPaper> getSomeDatas(Integer count) {
        List<QuestionPaper> questionPapers = questionPaperDAO.selectSomeDatas(count);
        return questionPapers;
    }



/*******************************************/

    //查询试卷
    @Override
    public ModelAndView questionPapers(Integer companyId, String currentPage) {
        PageModel<QuestionPaper> page = new PageModel<>();
        if(currentPage == null){
            page.setCompanyId(companyId);
            page.setCurrentPageCode(1);
            page.setTotalRecord(questionPaperDAO.paperCount(companyId));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord(0);
        }else{
            page.setCompanyId(companyId);
            Integer currentPageCode = Integer.parseInt(currentPage);
            page.setCurrentPageCode(currentPageCode);
            page.setTotalRecord(questionPaperDAO.paperCount(companyId));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord((currentPageCode-1)*5);
            page.setTotalRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        }

        List<QuestionPaper> questionPaperList = questionPaperDAO.questionPapers(page);
        ModelAndView mav = new ModelAndView();
        Company companyInfo = companyDAO.getCompanyInfo(companyId);
        mav.addObject("questionPaperList",questionPaperList);
        mav.addObject("companyInfo",companyInfo);
        mav.addObject("page",page);
        mav.setViewName("company_paper");
        return mav;
    }

    //删除试卷
    @Override
    public Integer deletePaper(Integer id) {
        int rows = questionPaperDAO.deletePaper(id);
        return rows;
    }

    //获取试卷数量
    @Override
    public Integer paperCount(Integer id) {
        int paperCount = questionPaperDAO.paperCount(id);
        return paperCount;
    }
}
