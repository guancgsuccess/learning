package com.rush.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter
@Getter
@ToString
/**
 * 封装了在线题目的信息
 */
public class OnlineQuestion implements Serializable {
     private Integer questionId;
     private String questionContext;
     private String questionTypeLanguage;
     private Integer questionPaperId;
     private String questionPaperTitle;

    public OnlineQuestion() {
    }

    public OnlineQuestion(Integer questionId, String questionContext, String questionTypeLanguage, Integer questionPaperId, String questionPaperTitle) {
        this.questionId = questionId;
        this.questionContext = questionContext;
        this.questionTypeLanguage = questionTypeLanguage;
        this.questionPaperId = questionPaperId;
        this.questionPaperTitle = questionPaperTitle;
    }
}
