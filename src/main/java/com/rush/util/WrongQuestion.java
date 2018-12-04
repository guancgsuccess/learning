package com.rush.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Setter
@Getter
@ToString
/**
 * 封装错题集需要的信息
 */
public class WrongQuestion implements Serializable {
    private Integer questionId;//题目id
    private Integer questionCorrect;//题目正确状态
    private Integer questionAnsweredStatus;//题目已做状态【0代表以前错过，但是再次做做对了，1代表自从错过就没对过】
    private String  questionContext;//题目内容
    private String questionTypeLanguage;//题目语言类型
    private Integer questionPaperId;//题目所在试卷id
    private String questionPaperTitle;//题目所在试卷的标题

    public WrongQuestion() {
    }

    public WrongQuestion(Integer questionId, Integer questionCorrect, Integer questionAnsweredStatus, String questionContext, String questionTypeLanguage, Integer questionPaperId, String questionPaperTitle) {
        this.questionId = questionId;
        this.questionCorrect = questionCorrect;
        this.questionAnsweredStatus = questionAnsweredStatus;
        this.questionContext = questionContext;
        this.questionTypeLanguage = questionTypeLanguage;
        this.questionPaperId = questionPaperId;
        this.questionPaperTitle = questionPaperTitle;
    }
}
