package com.rush.entity;

public class UserQuestionBean {
    private Integer questionNum;//用户做题数量
    private Integer correctNum;//作对的数量
    private Integer erroNum;//做错的数量

    public Integer getQuestionNum() {
        return questionNum;
    }

    public void setQuestionNum(Integer questionNum) {
        this.questionNum = questionNum;
    }

    public Integer getCorrectNum() {
        return correctNum;
    }

    public void setCorrectNum(Integer correctNum) {
        this.correctNum = correctNum;
    }

    public Integer getErroNum() {
        return erroNum;
    }

    public void setErroNum(Integer erroNum) {
        this.erroNum = erroNum;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("UserQuestionBean{");
        sb.append("questionNum=").append(questionNum);
        sb.append(", correctNum=").append(correctNum);
        sb.append(", erroNum=").append(erroNum);
        sb.append('}');
        return sb.toString();
    }
}
