package com.rush.dao;

import com.rush.entity.UserLogin;
import org.springframework.stereotype.Repository;

/**
 * UserLoginDAO继承基类
 */
@Repository
public interface UserLoginDAO extends MyBatisBaseDao<UserLogin, Integer> {
}