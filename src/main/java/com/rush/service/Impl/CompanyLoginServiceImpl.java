package com.rush.service.Impl;

import com.rush.dao.CompanyLoginDAO;
import com.rush.entity.CompanyLogin;
import com.rush.entity.CompanyLoginBean;
import com.rush.entity.LoginBean;
import com.rush.service.CompanyLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyLoginServiceImpl implements CompanyLoginService {

	@Autowired
	private CompanyLoginDAO companyLoginDAO;

	@Override
	public int addCompanyLogin(CompanyLogin companyLogin) {
		int result = companyLoginDAO.insert(companyLogin);
		return result;
	}
}
