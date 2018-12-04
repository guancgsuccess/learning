package com.rush.controller;

import com.rush.service.RecruitmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/recruitment")
public class RecruitmentController {

    @Autowired
    private RecruitmentService recruitmentService;

    /**
     * 按分页查找所有招聘信息
     * @param page 当前页面页码
     * @return 当前页面所需要展示的招聘信息，返回类型是ArrayList类型
     */
    @GetMapping("/selectAllRecruitment/{page}")
    public ModelAndView selectAllRecruitment(@PathVariable Integer page) {
        return recruitmentService.selectAllRecruitment(page);
    }

    /**
     * 按照招聘信息ID查找具体的招聘信息
     * @param recruitmentId 招聘信息ID
     * @return 返回具体的招聘信息，返回类型是Recruitment
     */
    @GetMapping("/selectRecruitmentByRecruitmentId/{recruitmentId}")
    public ModelAndView selectRecruitmentByRecruitmentId(@PathVariable int recruitmentId) {
        return recruitmentService.selectOneRecruitment(recruitmentId);
    }

    /**
     * 按条件查询招聘信息
     * @param keyword 关键字
     * @return 对试卷进行评分，并返回笔试结果
     */
    @GetMapping("/selectRecruitmentByKeyword/{keyword}")
    public ModelAndView selectRecruitmentByKeyword(@PathVariable String keyword) {
        return  recruitmentService.selectRecruitmentByKeyword(keyword);
    }
}
