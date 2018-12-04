package com.rush.controller;

import com.rush.entity.*;
import com.rush.service.QuestionBankService;
import com.rush.service.QuestionPaperService;
import com.rush.util.PageModel;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/questionpaper")
public class QuestionPaperController {

    @Autowired
    private QuestionPaperService questionPaperService;

    @Autowired
    private QuestionBankService questionBankService;

    /**
     *  分页查询用户数据
     * @param pagecode 指定要查询的页码
     * @return  返回当前页码的页码相关信息与数据集合
     */
    @RequestMapping("all")
    @ResponseBody  // java ---json
    public PageModel<QuestionPaper> getByPage(Integer pagecode){
        PageModel<QuestionPaper> page =  new PageModel<QuestionPaper>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.questionPaperService.getCount());
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page =  this.questionPaperService.getQuestionByPage(page);
        return page;
    }

    /**
     * 获取将要进入页面的页码进行跳转
     * @param num 将要进入的页面页码
     * @return 跳转到所求页码页面
     */
    @ResponseBody
    @RequestMapping("all/page/{num}")
    public PageModel<QuestionPaper> getByPage2(@PathVariable Integer num) {
        return  getByPage(num);
    }

    /**
     * 根据试卷id跳转到练习界面
     * @param questionPaperId 试卷id
     * @return 跳转到练习界面
     */
    @RequestMapping("test/{questionPaperId}")
    public ModelAndView testQuestion(@PathVariable Integer questionPaperId){
        ModelAndView mav = new ModelAndView();
        QuestionPaper questionPaper = questionPaperService.selectByQuestionPaperId(questionPaperId);
        mav.addObject("questionPaper",questionPaper);
        mav.setViewName("question-test");
        return mav;
    }

    /**
     * 根据用户所选语言进行分页
     * @param language 用户所选语言
     * @param pagecode 跳转的页码
     * @return 返回封装的PageModel<QuestionPaper>信息
     */
    @RequestMapping("all/page/language/{language}")
    @ResponseBody
    public PageModel<QuestionPaper> getByPageAndLanguage(@PathVariable String language,Integer pagecode){
        PageModel<QuestionPaper> page =  new PageModel<QuestionPaper>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.questionPaperService.selectCountByLanguage(language));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page.setRecord(language);
        page =  this.questionPaperService.selectQuestionByPageAndLanguage(page);
        return page;
    }

    /**
     * 根据语言分页后的页面跳转
     * @param language 用户所选语言
     * @param num 要跳转的页面页码
     * @return 返回PageModel<QuestionPaper>信息
     */
    @ResponseBody
    @RequestMapping("all/page/language/{language}/{num}")
    public PageModel<QuestionPaper> getByPageAndLanguage2(@PathVariable String language,@PathVariable Integer num) {
        return  getByPageAndLanguage(language,num);
    }

    /**
     * 根据用户所选公司进行分页
     * @param company 用户所选公司
     * @param pagecode 要跳转的页面页码
     * @return 返回封装的PageModel<QuestionPaper>的信息
     */
    @ResponseBody
    @RequestMapping("all/page/company/{company}")
    public PageModel<QuestionPaper> getByPageAndCompany(@PathVariable String company,Integer pagecode){
        PageModel<QuestionPaper> page =  new PageModel<QuestionPaper>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.questionPaperService.selectCountByCompany(company));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page.setRecord(company);
        page =  this.questionPaperService.selectQuestionByPageAndCompany(page);
        return page;
    }

    /**
     * 根据公司分页后的页面跳转
     * @param company 所选公司
     * @param num 要跳转的页码
     * @return 返回PageModel<QuestionPaper>信息
     */
    @ResponseBody
    @RequestMapping("all/page/company/{company}/{num}")
    public PageModel<QuestionPaper> getByPageAndCompany2(@PathVariable String company,@PathVariable Integer num) {
        return  getByPageAndCompany(company,num);
    }

    /**
     * 根据用户所选时间进行分页
     * @param time 用户所选时间
     * @param pagecode 将要跳转的页码
     * @return 返回PageModel<QuestionPaper>信息
     */
    @ResponseBody
    @RequestMapping("all/page/time/{time}")
    public PageModel<QuestionPaper> getByPageAndTime(@PathVariable String time,Integer pagecode){
        PageModel<QuestionPaper> page =  new PageModel<QuestionPaper>();
        if(pagecode == null){//首页
            page.setCurrentPageCode(1);
        }else{
            page.setCurrentPageCode(pagecode);
        }
        page.setTotalRecord(this.questionPaperService.selectCountByTime(time));
        page.setTotalPages(page.getTotalRecord()%page.getPageSize() ==0?page.getTotalRecord()/page.getPageSize() :page.getTotalRecord()/page.getPageSize() +1);
        page.setStartRecord((page.getCurrentPageCode()-1) * page.getPageSize());
        page.setRecord(time);
        page =  this.questionPaperService.selectQuestionByPageAndTime(page);
        return page;
    }

    /**
     * 根据时间分页后的页面跳转
     * @param time 所选时间
     * @param num 将要跳转的页码
     * @return 返回PageModel<QuestionPaper>信息
     */
    @ResponseBody
    @RequestMapping("all/page/time/{time}/{num}")
    public PageModel<QuestionPaper> getByPageAndTime2(@PathVariable String time,@PathVariable Integer num) {
        return  getByPageAndTime(time,num);
    }

    /**
     * 根据用户所作试卷的id收藏试卷
     * @param questionPaperId 试卷id
     * @param request 用户请求
     * @return 返回收藏状况
     */
    @ResponseBody
    @RequestMapping("collect/{questionPaperId}")
    public String collectQuestion(@PathVariable Integer questionPaperId, HttpServletRequest request){
        CollectBean collectBean = new CollectBean();
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getUserId();
        collectBean.setUserId(userId);
        List<QuestionBank> questionBanks = questionBankService.selectByQuestionPaperId(questionPaperId);
        int result = 0;
        for(QuestionBank qb:questionBanks){
            UserCollectionQuestion userCollectionQuestion = new UserCollectionQuestion();
            userCollectionQuestion.setUserId(userId);
            userCollectionQuestion.setQuestionId(qb.getQuestionId());
            userCollectionQuestion.setUserCollectionQuestionStatus(0);
            collectBean.setQuestionId(qb.getQuestionId());
            int row = questionPaperService.selectByUserAndQuestionpaper(collectBean);
            if(row>0){
                return "1";
            }
            result = questionPaperService.collectQuestionPaper(userCollectionQuestion);
        }
        if(result>0){
            return "2";
        }else {
            return "3";
        }

    }

    /**
     * 在页面上展示部分内容
     * @param count 要展示的数据量
     * @return 返回内容信息
     */
    @ResponseBody
    @RequestMapping("some/{count}")
    public List<QuestionPaper> getSomeDatas(@PathVariable Integer count){
          List<QuestionPaper> questionPapers = questionPaperService.getSomeDatas(count);
        return questionPapers;
    }
}
