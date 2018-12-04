package com.rush.service.Impl;

import com.rush.dao.QuestionBankDAO;
import com.rush.dao.QuestionPaperDAO;
import com.rush.dao.UserQuestionDAO;
import com.rush.entity.QuestionPaper;
import com.rush.entity.UserQuestion;
import com.rush.service.RealQuizPaperService;
import com.rush.util.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class RealQuizPaperServiceImpl implements RealQuizPaperService {
    @Autowired
    private QuestionPaperDAO questionPaperDAO;
    @Autowired
    private QuestionBankDAO questionBankDAO;
    @Autowired
    private UserQuestionDAO userQuestionDAO;

    /**
     * 真题试卷业务层
     * @param userId
     * @param pageCode
     * @return
     */
    @Override
    public Map<String, Object> showQuestionPaper(Integer userId, Integer pageCode) {
        Map<String,Object> map=new HashMap<>();
        PageModel<QuestionPaper> paperPageModel=new PageModel<>();
        //封装当前页码
        if (pageCode==null){
            pageCode=1;
            paperPageModel.setCurrentPageCode(pageCode);
        }else{
            paperPageModel.setCurrentPageCode(pageCode);
        }
        //已做题目的总记录数(不重复)
        Integer totalRecord=questionPaperDAO.selectAllRecordsByUserIdWithoutRepetition(userId);
        paperPageModel.setTotalRecord(totalRecord);
        //封装从第几页开始显示
        paperPageModel.setStartRecord((pageCode-1)*paperPageModel.getPageSize());
        //封装总页数
        paperPageModel.setTotalPages(totalRecord%paperPageModel.getPageSize()==0?totalRecord/paperPageModel.getPageSize()
                :totalRecord/paperPageModel.getPageSize()+1);
        List<QuestionPaper> questionPapers=questionPaperDAO.selectQuestionPapersByUserId4Page(userId,paperPageModel);
        //封装需要显示的试卷（分页后）
        paperPageModel.setModelList(questionPapers);
        //存放已做试卷的id
        List<Integer> list=new ArrayList<>();
        for(QuestionPaper qp:questionPapers){
            Integer questionPaperId=qp.getQuestionPaperId();
            list.add(questionPaperId);
        }
        //map1   key:试卷id  value:试卷上在题库的所有题目
        Map<Integer,List<Integer>> map1=new HashMap<>();
        //map2   key:试卷id value:试卷上的已做题目的正确题目数
        Map<Integer,Integer> map2=new HashMap<>();
        //map3   key:试卷id value:试卷上已做题目的数量
        Map<Integer,Integer> map3=new HashMap<>();
        //遍历已做试卷
        for (Integer id:list){
            //正确题目的数量
            Integer correct=0;
            //已做题目的数量
            Integer did=0;
            //根据试卷id查询出该试卷的所有题目id
            List<Integer> list1=questionBankDAO.selectQuestionByQuestionPaperId(id.toString());
            //map1   key:试卷id  value:试卷上在题库的所有题目
            map1.put(id,list1);
            //遍历某张已做试卷的所有题目id
            for(Integer id1:list1){
                //根据题目id和用户id查询userQuestion表中是否有该题目id，如果有证明已做
                UserQuestion userQuestion= userQuestionDAO.selectUserQuestionByQuestionIdAndUserId(id1,userId);
                //如果题目已做且正确，正确题目数++
                if(userQuestion!=null&&userQuestion.getQuestionCorrect()==0){
                    correct++;
                }
                //如果题目存在，已做题目++
                if(userQuestion!=null){
                    did++;
                }
            }
            //map2   key:试卷id value:试卷上的已做题目的正确题目数
            map2.put(id,correct);
            //map3   key:试卷id value:试卷上已做题目的数量
            map3.put(id,did);
        }
        map.put("map1",map1);
        map.put("map2",map2);
        map.put("map3",map3);
        map.put("paperPageModel",paperPageModel);
        return map;
    }
}
