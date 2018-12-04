package com.rush.service;

import com.rush.entity.Recruitment;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

public interface RecruitmentService {
    ModelAndView selectAllRecruitment(Integer page);
    Map<String,List<Recruitment>> selectRecruitmentByCompanyId(int companyId);
    ModelAndView selectOneRecruitment(int recruitmentId);
    ModelAndView selectRecruitmentByKeyword(String keyword);
    Integer selectRecruitmentCount();



    //添加招聘信息
    public Integer addRe(Recruitment recruitment,Integer companyId);

    //删除招聘信息
    public Integer removeRe(Integer id);

    //修改招聘信息
    public Integer updateRe(Recruitment recruitment,Integer id);

    //查询招聘信息
    public ModelAndView getAllRe(Integer companyId, String currentPage);

    //查询公司发布条数
    public Integer getCount(Integer id);
}
