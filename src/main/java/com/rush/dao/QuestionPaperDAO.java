package com.rush.dao;

import com.rush.entity.QuestionPaper;
import com.rush.util.PageModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * QuestionPaperDAO继承基类
 */
@Repository
public interface QuestionPaperDAO extends MyBatisBaseDao<QuestionPaper, Integer> {

    Integer selectCount();

    List<QuestionPaper> selectQuestionByPage(PageModel<QuestionPaper> pageModel);

    Integer getQuestionPaperNumber(Integer questionPaperId);

    Integer selectCountByLanguage(String language);

    Integer selectCountByCompany(String company);

    Integer selectCountByTime(String time);

    List<QuestionPaper> selectQuestionByPageAndLanguage(PageModel<QuestionPaper> pageModel);

    List<QuestionPaper> selectQuestionByPageAndCompany(PageModel<QuestionPaper> pageModel);

    List<QuestionPaper> selectQuestionByPageAndTime(PageModel<QuestionPaper> pageModel);

    List<QuestionPaper> selectSomeDatas(Integer count);

    List<QuestionPaper> selectQuestionPapersByUserId4Page(@Param("userId") Integer userId, @Param("paperPageModel") PageModel<QuestionPaper> paperPageModel);

    Integer selectAllRecordsByUserIdWithoutRepetition(Integer userId);


    /***************************/
    //查询公司试卷
    List<QuestionPaper> questionPapers(PageModel companyId);

    //删除试卷
    Integer deletePaper(Integer paperId);

    //试卷数量
    Integer paperCount(Integer companyId);

}