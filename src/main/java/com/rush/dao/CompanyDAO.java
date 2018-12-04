package com.rush.dao;

import com.rush.entity.Company;
import com.rush.entity.CompanyLoginBean;
import com.rush.entity.Recruitment;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;
import java.util.Map;

/**
 * CompanyDAO继承基类
 */
@Repository
public interface CompanyDAO extends MyBatisBaseDao<Company, Integer> {
    String selectPasswordByEmail(String companyEmail);
    int updatePasswordByEmail(Map<String, String> company);
    String selectCompanyNameByPrimaryId(int companyId);
    List<Integer> selectCompanyIdByKeyword(String keyword);



    /****************/

    //更改密码
    public Boolean updatePasswordByEmail(String email);

    //修改公司信息
    public Integer updateCompanyInfo(Company company);

    //查询公司信息
    public Company getCompanyInfo(Integer companyId);

    //登录
    public Company selectEmailAndPwd(CompanyLoginBean companyLoginBean);

    //注册
    public Integer registerCompany(Company company);

    //判断用户是否注册
    public String companyIsExist(String email);

}