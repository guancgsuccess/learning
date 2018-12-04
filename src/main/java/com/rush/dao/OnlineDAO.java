package com.rush.dao;

import com.rush.entity.Online;
import org.springframework.stereotype.Repository;

/**
 * OnlineDAO继承基类
 */
@Repository
public interface OnlineDAO extends MyBatisBaseDao<Online, Integer> {
}