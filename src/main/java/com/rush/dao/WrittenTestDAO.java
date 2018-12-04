package com.rush.dao;

import com.rush.entity.WrittenTest;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * WrittenTestDAO继承基类
 */
@Repository
public interface WrittenTestDAO extends MyBatisBaseDao<WrittenTest, Integer> {
    WrittenTest selectInterviewOffer(Map<String, Integer> map);
    WrittenTest confirmUserDoneTest(WrittenTest test);
}