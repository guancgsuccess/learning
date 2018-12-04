package com.rush.service;

import com.rush.entity.*;

public interface CompanyService {

	//修改公司信息
	public Integer updateCompany(Company company);

	//修改密码
	public Boolean updateCompanyPassword(Integer userId, String userPassword);

	//登录
	public Company selectEmailAndPwd(CompanyLoginBean companyLoginBean);

	//注册
	public Boolean registerCompany(CompanyRegisterBean companyRegisterBean);

	//查询公司信息
	public Company getCompanyInfo(Integer companyId);

	//判断用户是否注册
	public String companyIsExist(String email);


}
