package com.rush.service.Impl;

import com.rush.dao.CompanyDAO;
import com.rush.dao.RecruitmentDAO;
import com.rush.entity.Company;
import com.rush.entity.Recruitment;
import com.rush.service.RecruitmentService;
import com.rush.util.PageModel;
import com.rush.util.PaginationUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {

    @Autowired
    private RecruitmentDAO recruitmentDAO;
    @Autowired
    private CompanyDAO companyDAO;
    @Autowired
    private HttpServletRequest request;

    /**
     * 按分页查找招聘信息
     * @param page 当前显示页码
     * @return 返回当前页需要显示的所有招聘信息
     */
    @Override
    public ModelAndView selectAllRecruitment(Integer page) {
        ModelAndView mav = new ModelAndView();
        PaginationUtil<Recruitment> pages = new PaginationUtil<>();
        Integer currentPage = null;
        if (page < 1)
            currentPage = 1;
        else
            currentPage = page;
        int totalCount = selectRecruitmentCount();
        pages.setPageSize(5);
        pages.setTotalRecord(totalCount);
        pages.setCurrentPageCode(currentPage);
        pages.setTotalPages(totalCount%pages.getPageSize() == 0?(totalCount/pages.getPageSize()):(totalCount/pages.getPageSize()+1));
        pages.setStartRecord((currentPage - 1)*pages.getPageSize());
        List<Recruitment> recruitmentList = recruitmentDAO.selectAllRecruitments(pages);
        for (Recruitment recruitment : recruitmentList){
            String companyName = companyDAO.selectCompanyNameByPrimaryId(recruitment.getCompanyId());
            recruitment.setRecruitmentSpare(companyName);
        }
        pages.setModelList(recruitmentList);
        mav.addObject("recruitmentList",recruitmentList);
        mav.addObject("pages",pages);
        mav.setViewName("recruitment");
        request.getSession().removeAttribute("testAnswer");
        return mav;
    }

    /**
     * 按公司ID查找其对应的招聘信息
     * @param companyId 公司ID
     * @return 返回公司名和对应的招聘信息
     */
    @Override
    public Map<String, List<Recruitment>> selectRecruitmentByCompanyId(int companyId) {
        Map<String,List<Recruitment>> map = new HashMap<>();
        List<Recruitment> recruitments = recruitmentDAO.selectRecruitmentByCompanyId(companyId);
        String companyName = companyDAO.selectCompanyNameByPrimaryId(companyId);
        map.put(companyName,recruitments);
        return map;
    }

    /**
     * 按招聘信息ID查找招聘详情
     * @param recruitmentId 招聘信息ID
     * @return 返回招聘信息详情
     */
    @Override
    public ModelAndView selectOneRecruitment(int recruitmentId) {
        ModelAndView mav = new ModelAndView();
        Recruitment recruitment = recruitmentDAO.selectByPrimaryKey(recruitmentId);
        String companyName = companyDAO.selectCompanyNameByPrimaryId(recruitment.getCompanyId());
        recruitment.setRecruitmentSpare(companyName);
        mav.addObject("recruitment",recruitment);
        mav.setViewName("recruitmentInfo");
        return mav;
    }

    /**
     * 按关键字搜索招聘信息，搜索字段有职位和公司
     * @param keyword 关键字
     * @return 返回招聘信息
     */
    @Override
    public ModelAndView selectRecruitmentByKeyword(String keyword) {
        ModelAndView mav = new ModelAndView();
        List<Integer> list = companyDAO.selectCompanyIdByKeyword(keyword);
        List<Recruitment> recruitments = recruitmentDAO.selectRecruitmentByKeyword(keyword);
        List<Recruitment> recruitmentList = new ArrayList<>();
        for (Integer i: list) {
            List<Recruitment> oneList = recruitmentDAO.selectRecruitmentByCompanyId(i);
            for (Recruitment r: oneList) {
                String companyName = companyDAO.selectCompanyNameByPrimaryId(r.getCompanyId());
                r.setRecruitmentSpare(companyName);
                recruitmentList.add(r);
            }
        }
        for (Recruitment r : recruitments) {
            String companyName = companyDAO.selectCompanyNameByPrimaryId(r.getCompanyId());
            r.setRecruitmentSpare(companyName);
            recruitmentList.add(r);
        }
        mav.addObject("recruitmentList",recruitmentList);
        mav.addObject("keyword",keyword);
        mav.setViewName("recruitment");
        return mav;
    }

    /**
     * 查找所有招聘信息总记录数
     * @return 返回总记录数
     */
    @Override
    public Integer selectRecruitmentCount() {
        return recruitmentDAO.selectRecruitmentCount();
    }




    /****************************************/
    //1.添加招聘
    @Override
    public Integer addRe(Recruitment recruitment, Integer companyId) {
        Recruitment recruit = new Recruitment();
        recruit.setCompanyId(companyId);
        recruit.setRecuritmentPosition(recruitment.getRecuritmentPosition());
        recruit.setRecruitmentRequirements(recruitment.getRecruitmentRequirements());
        recruit.setRecruitmentTreatment(recruitment.getRecruitmentTreatment());
        recruit.setInterviewTime(recruitment.getInterviewTime());
        recruit.setInterviewLocation(recruitment.getInterviewLocation());
        recruit.setRecruitmentNumber(recruitment.getRecruitmentNumber());
        recruit.setRecruitmentInformationStatus(1);
        int rows = recruitmentDAO.addRe(recruit);
        return rows;
    }

    //2.删除招聘
    @Override
    public Integer removeRe(Integer id) {
        int rows = recruitmentDAO.removeRe(id);
        return rows;
    }

    //3修改招聘信息
    @Override
    public Integer updateRe(Recruitment recruitment,Integer id) {
        Recruitment re = new Recruitment();
        re.setRecuritmentPosition(recruitment.getRecuritmentPosition());
        re.setRecruitmentRequirements(recruitment.getRecruitmentRequirements());
        re.setRecruitmentTreatment(recruitment.getRecruitmentTreatment());
        re.setInterviewTime(recruitment.getInterviewTime());
        re.setInterviewLocation(recruitment.getInterviewLocation());
        re.setRecruitmentNumber(recruitment.getRecruitmentNumber());
        re.setRecruitmentInformationStatus(1);
        int rows = recruitmentDAO.updateReById(re);
        return rows;
    }

    //4查询招聘信息
    @Override
    public ModelAndView getAllRe(Integer companyId,String currentPage) {
        PageModel<Recruitment> page = new PageModel<>();
        if(currentPage == null){
            page.setCompanyId(companyId);
            page.setCurrentPageCode(1);
            page.setTotalRecord(recruitmentDAO.getReCount(companyId));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord(0);
        }else{
            page.setCompanyId(companyId);
            Integer currentPageCode = Integer.parseInt(currentPage);
            page.setCurrentPageCode(currentPageCode);
            page.setTotalRecord(recruitmentDAO.getReCount(companyId));
            int totalPage = page.getTotalRecord() % page.getPageSize() ==0 ? page.getTotalRecord() / page.getPageSize() : page.getTotalRecord() / page.getPageSize() +1;
            page.setTotalPages(totalPage);
            page.setStartRecord((currentPageCode-1)*5);
            page.setTotalRecord((page.getCurrentPageCode()-1)*page.getPageSize());
        }
        List<Recruitment> recruitmentList = recruitmentDAO.getAllRe(page);
        Company companyInfo = companyDAO.getCompanyInfo(companyId);
        ModelAndView mav = new ModelAndView();
        mav.addObject("recruitmentList",recruitmentList);
        mav.addObject("companyInfo",companyInfo);
        mav.addObject("page",page);
        mav.setViewName("company_recruit");
        return mav;
    }

    //查询招聘总条数
    @Override
    public Integer getCount(Integer id) {
        int num = recruitmentDAO.getReCount(id);
        return num;
    }
}
