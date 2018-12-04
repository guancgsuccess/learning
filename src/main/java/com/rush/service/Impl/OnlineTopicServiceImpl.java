package com.rush.service.Impl;

import com.rush.dao.QuestionBankDAO;
import com.rush.dao.QuestionPaperDAO;
import com.rush.entity.QuestionBank;
import com.rush.entity.QuestionPaper;
import com.rush.service.OnlineTopicService;
import com.rush.util.OnlineQuestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class OnlineTopicServiceImpl implements OnlineTopicService {
    @Autowired
    private QuestionBankDAO questionBankDAO;
    @Autowired
    private QuestionPaperDAO questionPaperDAO;
    @Override
    public Map<String, Object> showOnlineTopic() {
        Map<String,Object> map=new HashMap<>();
        //题目集
        List<QuestionBank> questionBanks=questionBankDAO.selectAllQuestions();

        //试卷集
        List<Map<Integer,QuestionPaper>> mapList=new ArrayList<>();

        //遍历在线题目集
        for(QuestionBank qb:questionBanks){
            //获取题目的试卷id
            Integer questionPaperId=Integer.parseInt(qb.getQuestionBankSpare());
            //获取该题目的试卷信息
            QuestionPaper questionPaper=questionPaperDAO.selectByPrimaryKey(questionPaperId);
            Map<Integer,QuestionPaper> map1=new HashMap<>();
            //key:题目id   value：试卷信息
            map1.put(qb.getQuestionId(),questionPaper);
            mapList.add(map1);
        }
        map.put("questionBanks",questionBanks);
        map.put("mapList",mapList);
        return map;
    }

    /**
     * 获得在线题目集
     * @return
     */
    @Override
    public List<OnlineQuestion> showOnlineTopicV2() {
        return questionBankDAO.selectAllQuestionsV2();
    }
}
