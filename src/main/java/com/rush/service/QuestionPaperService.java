package com.rush.service;

import com.rush.entity.CollectBean;
import com.rush.entity.QuestionPaper;
import com.rush.entity.UserCollectionQuestion;
import com.rush.util.PageModel;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface QuestionPaperService {

    public Integer getCount();

    public PageModel<QuestionPaper> getQuestionByPage(PageModel<QuestionPaper> page);

    public QuestionPaper selectByQuestionPaperId(Integer questionPaperId);

    public Integer getQuestionNum(Integer questionPaperId);

    public PageModel<QuestionPaper> selectQuestionByPageAndLanguage(PageModel<QuestionPaper> pageModel);

    public PageModel<QuestionPaper> selectQuestionByPageAndCompany(PageModel<QuestionPaper> pageModel);

    public PageModel<QuestionPaper> selectQuestionByPageAndTime(PageModel<QuestionPaper> pageModel);

    public Integer selectCountByLanguage(String language);

    public Integer selectCountByCompany(String company);

    public Integer selectCountByTime(String time);

    public Integer collectQuestionPaper(UserCollectionQuestion userCollectionQuestion);

    public Integer selectByUserAndQuestionpaper(CollectBean collectBean);

    public List<QuestionPaper> getSomeDatas(Integer count);

    /***********************/
    //查询公司试卷
    public ModelAndView questionPapers(Integer companyId, String currentPage);

    //删除试卷
    public Integer deletePaper(Integer id);

    //查询所属公司的试卷数量
    public Integer paperCount(Integer id);
}
