package com.rush.controller;

import com.rush.entity.*;
import com.rush.service.*;
import com.rush.util.AchieveCode;
import com.rush.util.PageModel;
import org.jdom.Content;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private CompanyLoginService companyLoginService;

	@Autowired
	private RecruitmentService recruitmentService;

	@Autowired
	private QuestionBankService questionBankService;

	@Autowired
	private QuestionPaperService questionPaperService;

	@Autowired
	private HttpServletRequest request;


	@RequestMapping("register")
	public String registerCompany(CompanyRegisterBean companyRegisterBean){
		String validCode = (String) request.getSession().getAttribute("validCode");
		System.out.println(validCode);
		if(validCode.equals(companyRegisterBean.getRegisterValidCode())){
			String email =companyService.companyIsExist(companyRegisterBean.getCompanyEmail());
			if(email==null){
				Company company = new Company();
				company.setCompanyPassword(companyRegisterBean.getCompanyPassword());
				company.setCompanyEmail(companyRegisterBean.getCompanyEmail());
				request.getSession().setAttribute("company",company);
				return "company_complete";
			}else {
				return "company_login";
			}
		}else {
			return "company_register";
		}

	}


	@RequestMapping("forValid/{companyEmail}")
	@ResponseBody
	public String getValidCode(@PathVariable String companyEmail){
		AchieveCode achieveCode = new AchieveCode();
		String validCode = achieveCode.sendEmailCode(companyEmail+".com");
		System.out.println(validCode+"========================");
		request.getSession().setAttribute("validCode",validCode);
		return validCode;
	}

	@RequestMapping("complete")
	public String completeCompany(CompanyRegisterBean companyRegisterBean){
		companyService.registerCompany(companyRegisterBean);
		return "company_login";
	}

	@RequestMapping("login")
	public ModelAndView companyLogin(CompanyLoginBean companyLoginBean) {
		Company company = companyService.selectEmailAndPwd(companyLoginBean);
		if(company!=null){
			CompanyLogin companyLogin = new CompanyLogin();
			companyLogin.setCompanyLoginEmail(company.getCompanyEmail());
			companyLogin.setCompanyLoginPassword(company.getCompanyPassword());
			companyLogin.setCompanyLoginTime(new Date());
			companyLogin.setCompanyLoginVerify(1);
			companyLogin.setCompanyLoginStatus(1);
			companyLoginService.addCompanyLogin(companyLogin);
			request.getSession().setAttribute("company",company);
			return getCompanyInfo();
		}else{
			ModelAndView mav = new ModelAndView();
			mav.addObject("errorMsg","用户名或密码不正确");
			mav.setViewName("company_login");
			return  mav;
		}

	}

	@RequestMapping("logout")
	public String companyLogout(){
		request.getSession().removeAttribute("company");
		return "company_login";
	}

	//查询到公司信息
	@RequestMapping("homepage")
	public ModelAndView getCompanyInfo(){
		Company company = (Company) request.getSession().getAttribute("company");
		Company companyInfo = companyService.getCompanyInfo(company.getCompanyId());
		int questions = questionBankService.getQuestionCount(company.getCompanyName());
		int reCount = recruitmentService.getCount(company.getCompanyId());
		int papers = questionPaperService.paperCount(company.getCompanyId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("companyInfo",companyInfo);
		mav.addObject("questions",questions);
		mav.addObject("reCount",reCount);
		mav.addObject("papers",papers);
		mav.setViewName("company_homepage");
		return mav;
	}

	//查询所有招聘信息
	@RequestMapping("recruit")
	public ModelAndView getAllRecruit(){
		Company company = (Company) request.getSession().getAttribute("company");
		int id = company.getCompanyId();
		String currentPage = request.getParameter("page");
		return recruitmentService.getAllRe(id,currentPage);
	}


	//添加招聘页面
	@RequestMapping("recruitAdd")
	public ModelAndView recruitAdd(){
		Company company = (Company) request.getSession().getAttribute("company");
		ModelAndView mav = new ModelAndView();
		Company companyInfo = companyService.getCompanyInfo(company.getCompanyId());
		mav.addObject("companyInfo",companyInfo);
		mav.setViewName("company_recruitAdd");
		return mav;
	}


	//添加招聘信息
	@RequestMapping("addRecruit")
	public ModelAndView addRecruits(Recruitment recruitment){
		Company company = (Company) request.getSession().getAttribute("company");
		int id = company.getCompanyId();
		ModelAndView mav = new ModelAndView();
		Company companyInfo = companyService.getCompanyInfo(company.getCompanyId());
		mav.addObject("companyInfo",companyInfo);
		recruitmentService.addRe(recruitment,id);
		mav.setViewName("company_recruit");
		return mav;

	}


	//删除招聘信息
	@RequestMapping("deleteRecruit/{recruitId}")
	public ModelAndView deleteRecruit(@PathVariable Integer recruitId){
		recruitmentService.removeRe(recruitId);
		return getAllRecruit();
	}


	//修改招聘信息
	@RequestMapping("updateRecruit/{recruitId}")
	public String updateRe(Recruitment recruitment,@PathVariable Integer id){
		recruitmentService.updateRe(recruitment,id);
		return "company_recruit";
	}

	//查询试卷
	@RequestMapping("questionPaper")
	public ModelAndView getAllPaper(){
		Company company = (Company) request.getSession().getAttribute("company");
		String currentPage = request.getParameter("page");
		int id = company.getCompanyId();
		return questionPaperService.questionPapers(id,currentPage);
	}

	//删除试卷
	@RequestMapping("deletePaper/{paperId}")
	public String deletePaper(@PathVariable Integer paperId){
		questionPaperService.deletePaper(paperId);

		return "company_paper";
	}

	//查询试题信息
	@RequestMapping("getQuestions")
	public ModelAndView getQuestions(){
		Company company = (Company) request.getSession().getAttribute("company");
		String currentPage = request.getParameter("page");
		String name = company.getCompanyName();
		Integer id = company.getCompanyId();
		return questionBankService.getAllQuestion(name,currentPage,id);
	}

	//删除试题
	@RequestMapping("deleteQuestion/{questionId}")
	public String deleteQuestion(@PathVariable Integer questionId){
		questionBankService.removeQuestion(questionId);
		return "company_questions";
	}

	//设置
	@RequestMapping("set")
	public ModelAndView companySet(){
		Company company = (Company) request.getSession().getAttribute("company");
		Company companyInfo = companyService.getCompanyInfo(company.getCompanyId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("companyInfo",companyInfo);
		mav.setViewName("company_set");
		return mav;
	}

	//修改密码
	/*@RequestMapping("set")
	public ModelAndView modifyPwd(String oldPwd, String newPwd){
		Company company = (Company) request.getSession().getAttribute("company");
		int id =company.getCompanyId();
		return companyService.updateCompanyPassword(id,oldPwd,newPwd);
	}*/

}










