package com.rush.entity;

import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class AnswerProofread {
    private Integer correctNum;//正确的个数
    private String correctAnswer;//正确的答案
    private String userAnswer;//用户答案
    private Integer questionNum;//题目数量
    private String questionTitle;//试卷名称
    private String useTime;//做题时间
    private Integer questionPaperId;//试卷Id
    private List<QuestionBank> questionBanks;//试题
    private Integer uncompleted;//没有做的题目数量
}
