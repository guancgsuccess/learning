package com.rush.dao;

import com.rush.entity.CompanyLogin;
import org.springframework.stereotype.Repository;

/**
 * CompanyLoginDAO继承基类
 */
@Repository
public interface CompanyLoginDAO extends MyBatisBaseDao<CompanyLogin, Integer> {
}