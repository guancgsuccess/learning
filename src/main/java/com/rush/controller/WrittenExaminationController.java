package com.rush.controller;

import com.rush.service.WrittenExaminationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/test")
public class WrittenExaminationController {

    @Autowired
    private WrittenExaminationService service;

    /**
     * 按分页查找公司试卷信息
     * @param page 要显示的当前页的页码
     * @return 返回当前页码需要显示的所有公司试卷信息
     */
    @GetMapping("/selectAllCompany/{page}")
    public ModelAndView selectAllCompany(@PathVariable Integer page) {
        return service.selectAllCompanyByCompanyId(page);
    }

    /**
     * 根据公司ID和题目序号查找试题
     * @param companyId 公司试卷的公司ID
     * @param i 需要显示的题目的序号
     * @param answer 上一个做过题目的答案
     * @return 返回 公司试题和试题编号
     */
    @GetMapping("/selectCompanyPaper/{companyId}&{i}&{answer}")
    public ModelAndView selectCompanyPaper(@PathVariable Integer companyId,@PathVariable Integer i,@PathVariable String answer) {
        return service.selectTestPaperByCompanyId(companyId,i,answer);
    }

    /**
     * 根据公司ID和用户ID查询用户笔试成绩
     * @param companyId 公司ID
     * @param userId 当前用户的用户ID
     * @return 返回当前用户在该公司的笔试成绩
     */
    @GetMapping("/selectInterviewOffer/{companyId}&{userId}")
    public ModelAndView interviewOffer(@PathVariable Integer companyId,@PathVariable Integer userId) {
        return service.selectInterviewOffer(companyId,userId);
    }

    /**
     * 交卷或提前交卷
     * @param companyId 公司试题的所属公司ID
     * @param i 当前题目的序号
     * @param answer 当前题目的答案
     * @return 返回到所有公司试题页面
     */
    @GetMapping("/earlyDelivery/{companyId}&{i}&{answer}")
    public ModelAndView earlyDelivery(@PathVariable Integer companyId,@PathVariable Integer i,@PathVariable String answer) {
        return service.earlyDelivery(companyId,i,answer);
    }
}
