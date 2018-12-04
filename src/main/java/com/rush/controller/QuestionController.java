package com.rush.controller;

import com.rush.entity.Comment;
import com.rush.entity.QuestionBank;
import com.rush.service.*;
import com.rush.util.CollectionQuestion;
import com.rush.util.OnlineQuestion;
import com.rush.util.WrongQuestion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 刷题和收藏Controller
 */
@Controller
@RequestMapping("brushQuestion")
public class QuestionController {
    @Autowired
    private WrongTitleSetService wrongTitleSetService;
    @Autowired
    private RealQuizPaperService realQuizPaperService;
    @Autowired
    private OnlineTopicService onlineTopicService;
    @Autowired
    private CollectionTopicService collectionTopicService;

    /**
     * 获取已做的真题试卷
     * @param userId 用户id（从session中获得）
     * @param pageCode 当前页码
     * @return
     */
    @GetMapping("findQuestionPaper4Show/{userId}")
    @ResponseBody
    public Map<String,Object> findQuestionPaper4Show(@PathVariable Integer userId,Integer pageCode){
        return realQuizPaperService.showQuestionPaper(userId,pageCode);
    }

    /**
     * 获取已做过的真题试卷的分页信息
     * @param userId 用户id
     * @param pageCode 当前页码
     * @return
     */
    @GetMapping("findQuestionPaper4Show/page/{userId}&{pageCode}")
    @ResponseBody
    public Map<String, Object> findQuestionPaper4ShowByPage(@PathVariable Integer userId,@PathVariable Integer pageCode){
        return findQuestionPaper4Show(userId,pageCode);
    }



    /**
     * 根据用户id获取错题集【修改过后的】
     * @param userId
     * @return
     */
    @GetMapping("showAllWrongQuestions/{userId}")
    @ResponseBody
    public List<WrongQuestion> showAllWrongQuestions(@PathVariable Integer userId){
        return wrongTitleSetService.showAllWrongQuestions(userId);
    }



    /**
     * 显示收藏的题目【修改过后的】
     * @param userId
     * @return
     */
    @GetMapping("showAllCollectionsByUserId/{userId}")
    @ResponseBody
    public List<CollectionQuestion> showAllCollectionsByUserId(@PathVariable Integer userId){
        return collectionTopicService.showCollectionTopicsV2(userId);
    }


    /**
     * 获取在线题目【修改过后的】
     */
    @GetMapping("findAllOnlineQuestionsV2")
    @ResponseBody
    public List<OnlineQuestion> findAllOnlineQuestionsV2(){
        return onlineTopicService.showOnlineTopicV2();
    }

    /**
     * 编辑收藏题目的标签名
     */
    @PutMapping("collection/editCollectionQuestion/changeTagName")
    @ResponseBody
    public void changeTagName(Integer userId,Integer questionId,String tagName){
        collectionTopicService.modifyQuestionTagName(userId,questionId,tagName);
    }
    /**
     * 删除收藏的题目
     */
    @DeleteMapping("collection/editCollectionQuestion/deleteQuestion")
    @ResponseBody
    public void deleteQuestion(Integer userId,Integer questionId){
        collectionTopicService.removeQuestionFromCollectionTopics(userId,questionId);
    }

    /**
     * 查看错题详细信息，并且加载评论
     */
    @GetMapping("showWrongQuestion/loadQuestionDetailAndComment/{questionId}")
    public ModelAndView loadQuestionDetailAndComment(@PathVariable Integer questionId){
        ModelAndView mav=new ModelAndView();
        Map<String,Object> detailMap=wrongTitleSetService.showWrongQuestionDetailByQuestionId(questionId);
        mav.addObject("detailMap",detailMap);
        mav.setViewName("personal/question_details");
        return mav;
    }

    /**
     * 发表评论
     * @param comment 评论
     * @return
     */
    @PostMapping("postComment")
    @ResponseBody
    public Map<String,Object> postComment(Comment comment){
        comment.setCommentTime(new Date());
        Map<String,Object> map=wrongTitleSetService.postCommentByQuestionIdAndUserId(comment);
        return map;
    }
}
