package com.rush.service;

import org.springframework.web.servlet.ModelAndView;

import java.util.List;

public interface WrittenExaminationService {
    ModelAndView selectTestPaperByCompanyId(Integer companyId, Integer i, String answer);
    ModelAndView selectAllCompanyByCompanyId(Integer page);
    Integer selectCompanyCount();
    ModelAndView selectInterviewOffer(Integer companyId, Integer userId);
    List<String> selectAllAnswer(Integer companyId);
    ModelAndView earlyDelivery(Integer companyId, Integer i, String answer);
}
