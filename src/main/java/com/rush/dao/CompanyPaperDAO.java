package com.rush.dao;

import com.rush.entity.CompanyPaper;
import com.rush.util.PaginationUtil;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

/**
 * CompanyPaperDAO继承基类
 */
@Repository
public interface CompanyPaperDAO extends MyBatisBaseDao<CompanyPaper, Integer> {
    Integer selectCompanyPaperByCompanyId(Integer companyId);
    List<Integer> selectAllCompanyByCompanyId(PaginationUtil pages);
    String selectCompanyPaperDeadlineByCompanyPaperId(int companyPaperId);
    Integer selectCompanyCount();
}