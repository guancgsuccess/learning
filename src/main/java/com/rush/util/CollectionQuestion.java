package com.rush.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

@Setter
@Getter
@ToString
public class CollectionQuestion implements Serializable {
    private Integer questionId;
    private String questionContext;
    private String questionTypeLanguage;
    private Integer questionPaperId;
    private String questionPaperTitle;

    public CollectionQuestion() {
    }

    public CollectionQuestion(Integer questionId, String questionContext, String questionTypeLanguage, Integer questionPaperId, String questionPaperTitle) {
        this.questionId = questionId;
        this.questionContext = questionContext;
        this.questionTypeLanguage = questionTypeLanguage;
        this.questionPaperId = questionPaperId;
        this.questionPaperTitle = questionPaperTitle;
    }
}
