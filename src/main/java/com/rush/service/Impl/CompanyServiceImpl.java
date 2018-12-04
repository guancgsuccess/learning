package com.rush.service.Impl;

import com.rush.dao.*;
import com.rush.entity.*;
import com.rush.service.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;


@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDAO companyDAO;

	@Autowired
	private HttpServletRequest request;



	//修改公司信息
	@Override
	public Integer updateCompany(Company company) {
		int rows = companyDAO.updateCompanyInfo(company);
		return rows;
	}

	//登录
	@Override
	public Company selectEmailAndPwd(CompanyLoginBean companyLoginBean) {
		Company company = companyDAO.selectEmailAndPwd(companyLoginBean);
		return company;

	}

	//注册
	@Override
	public Boolean registerCompany(CompanyRegisterBean companyRegisterBean) {
		Company com = (Company) request.getSession().getAttribute("company");
		Company company = new Company();
		company.setCompanyName(companyRegisterBean.getCompanyName());
		company.setCompanyPassword(com.getCompanyPassword());
		company.setCompanyAddress(companyRegisterBean.getCompanyAddress());
		company.setCompanyRegistrationCode(companyRegisterBean.getCompanyRegistrationCode());
		company.setCompanyLegalRepresentative(companyRegisterBean.getCompanyLegalRepresentative());
		company.setCompanyPhone(companyRegisterBean.getCompanyPhone());
		company.setCompanyType(companyRegisterBean.getCompanyType());
		company.setCompanyRegisterTime(companyRegisterBean.getCompanyRegisterTime());
		company.setCompanyEmail(com.getCompanyEmail());
		company.setCompanyIntroduction(companyRegisterBean.getCompanyIntroduction());
		company.setCompanyStatus(0);
	 	int rows = 	companyDAO.registerCompany(company);
	 	return rows==1;
	}

	//查询公司信息
	@Override
	public Company getCompanyInfo(Integer companyId) {
		Company companyInfo = companyDAO.getCompanyInfo(companyId);
		return companyInfo;
	}

	//检查邮箱是否注册
	@Override
	public String companyIsExist(String email) {
		return companyDAO.companyIsExist(email);
	}


	//修改密码
	@Override
	public Boolean updateCompanyPassword(Integer userId, String userPassword) {
		Company company = new Company();
		company.setCompanyPassword(userPassword);
		return companyDAO.updateByPrimaryKeySelective(company)>0;
	}


}












