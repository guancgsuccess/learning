package com.rush.dao;

import com.rush.entity.Recruitment;
import com.rush.util.PageModel;
import com.rush.util.PaginationUtil;
import jdk.nashorn.internal.ir.IdentNode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * RecruitmentDAO继承基类
 */
@Repository
public interface RecruitmentDAO extends MyBatisBaseDao<Recruitment, Integer> {
    List<Recruitment> selectAllRecruitments(PaginationUtil pages);
    List<Recruitment> selectRecruitmentByCompanyId(int companyId);
    Integer selectRecruitmentCount();
    List<Recruitment> selectRecruitmentByKeyword(String keyword);

    /*************************/
    //添加招聘信息
    public Integer addRe(Recruitment recruitment);

    //删除招聘信息
    public Integer removeRe(Integer id);

    //修改招聘信息
    public Integer updateReById(Recruitment recruitment);

    //查询招聘信息
    public List<Recruitment> getAllRe(PageModel pageModel);

    //查询招聘发布次数
    public Integer getReCount(Integer companyId);
}