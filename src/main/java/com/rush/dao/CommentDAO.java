package com.rush.dao;

import com.rush.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * CommentDAO继承基类
 */
@Repository
public interface CommentDAO extends MyBatisBaseDao<Comment, Integer> {
    List<Comment> selectAllCommentsByUserId(int userId);
    List<Comment> selectAllCommentsByQuestionID(int questionId);

    Comment selectOneLatestCommentByUserId(Integer commentUserId);

    List<Comment> selectAllCommentByUserId(Integer commentUserId);

    List<Comment> selectCommentsByQuestionId(Integer commentQuestionId);
}