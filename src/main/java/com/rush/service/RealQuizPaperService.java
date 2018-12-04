package com.rush.service;
import java.util.Map;

/**
 * 真题试卷业务层
 */
public interface RealQuizPaperService {
    /**
     * 真题试卷展示
     * @param userId
     * @param pageCode
     * @return
     */
    Map<String,Object> showQuestionPaper(Integer userId, Integer pageCode);


}
