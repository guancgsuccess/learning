package com.rush.entity;

import java.io.Serializable;

/**
 * question_bank
 * @author 
 */
public class QuestionBank implements Serializable {
    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 题目内容
     */
    private String questionContext;

    /**
     * 题目答案
     */
    private String questionAnswer;

    /**
     * 题目类型(按公司分类)
     */
    private String questionTypeCompany;

    /**
     * 题目类型(按语言分类)
     */
    private String questionTypeLanguage;

    /**
     * 题目解析
     */
    private String questionAnswerparsing;

    /**
     * A选项
     */
    private String questionOptiona;

    /**
     * B选项
     */
    private String questionOptionb;

    /**
     * C选项
     */
    private String questionOptionc;

    /**
     * D选项
     */
    private String questionOptiond;

    /**
     * 题目属于的试卷id
     */
    private Integer questionTestPaperId;

    /**
     * 题目状态
     */
    private Integer questionStatus;

    /**
     * 备用
     */
    private String questionBankSpare;

    private static final long serialVersionUID = 1L;

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestionContext() {
        return questionContext;
    }

    public void setQuestionContext(String questionContext) {
        this.questionContext = questionContext;
    }

    public String getQuestionAnswer() {
        return questionAnswer;
    }

    public void setQuestionAnswer(String questionAnswer) {
        this.questionAnswer = questionAnswer;
    }

    public String getQuestionTypeCompany() {
        return questionTypeCompany;
    }

    public void setQuestionTypeCompany(String questionTypeCompany) {
        this.questionTypeCompany = questionTypeCompany;
    }

    public String getQuestionTypeLanguage() {
        return questionTypeLanguage;
    }

    public void setQuestionTypeLanguage(String questionTypeLanguage) {
        this.questionTypeLanguage = questionTypeLanguage;
    }

    public String getQuestionAnswerparsing() {
        return questionAnswerparsing;
    }

    public void setQuestionAnswerparsing(String questionAnswerparsing) {
        this.questionAnswerparsing = questionAnswerparsing;
    }

    public String getQuestionOptiona() {
        return questionOptiona;
    }

    public void setQuestionOptiona(String questionOptiona) {
        this.questionOptiona = questionOptiona;
    }

    public String getQuestionOptionb() {
        return questionOptionb;
    }

    public void setQuestionOptionb(String questionOptionb) {
        this.questionOptionb = questionOptionb;
    }

    public String getQuestionOptionc() {
        return questionOptionc;
    }

    public void setQuestionOptionc(String questionOptionc) {
        this.questionOptionc = questionOptionc;
    }

    public String getQuestionOptiond() {
        return questionOptiond;
    }

    public void setQuestionOptiond(String questionOptiond) {
        this.questionOptiond = questionOptiond;
    }

    public Integer getQuestionTestPaperId() {
        return questionTestPaperId;
    }

    public void setQuestionTestPaperId(Integer questionTestPaperId) {
        this.questionTestPaperId = questionTestPaperId;
    }

    public Integer getQuestionStatus() {
        return questionStatus;
    }

    public void setQuestionStatus(Integer questionStatus) {
        this.questionStatus = questionStatus;
    }

    public String getQuestionBankSpare() {
        return questionBankSpare;
    }

    public void setQuestionBankSpare(String questionBankSpare) {
        this.questionBankSpare = questionBankSpare;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        QuestionBank other = (QuestionBank) that;
        return (this.getQuestionId() == null ? other.getQuestionId() == null : this.getQuestionId().equals(other.getQuestionId()))
            && (this.getQuestionContext() == null ? other.getQuestionContext() == null : this.getQuestionContext().equals(other.getQuestionContext()))
            && (this.getQuestionAnswer() == null ? other.getQuestionAnswer() == null : this.getQuestionAnswer().equals(other.getQuestionAnswer()))
            && (this.getQuestionTypeCompany() == null ? other.getQuestionTypeCompany() == null : this.getQuestionTypeCompany().equals(other.getQuestionTypeCompany()))
            && (this.getQuestionTypeLanguage() == null ? other.getQuestionTypeLanguage() == null : this.getQuestionTypeLanguage().equals(other.getQuestionTypeLanguage()))
            && (this.getQuestionAnswerparsing() == null ? other.getQuestionAnswerparsing() == null : this.getQuestionAnswerparsing().equals(other.getQuestionAnswerparsing()))
            && (this.getQuestionOptiona() == null ? other.getQuestionOptiona() == null : this.getQuestionOptiona().equals(other.getQuestionOptiona()))
            && (this.getQuestionOptionb() == null ? other.getQuestionOptionb() == null : this.getQuestionOptionb().equals(other.getQuestionOptionb()))
            && (this.getQuestionOptionc() == null ? other.getQuestionOptionc() == null : this.getQuestionOptionc().equals(other.getQuestionOptionc()))
            && (this.getQuestionOptiond() == null ? other.getQuestionOptiond() == null : this.getQuestionOptiond().equals(other.getQuestionOptiond()))
            && (this.getQuestionTestPaperId() == null ? other.getQuestionTestPaperId() == null : this.getQuestionTestPaperId().equals(other.getQuestionTestPaperId()))
            && (this.getQuestionStatus() == null ? other.getQuestionStatus() == null : this.getQuestionStatus().equals(other.getQuestionStatus()))
            && (this.getQuestionBankSpare() == null ? other.getQuestionBankSpare() == null : this.getQuestionBankSpare().equals(other.getQuestionBankSpare()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getQuestionId() == null) ? 0 : getQuestionId().hashCode());
        result = prime * result + ((getQuestionContext() == null) ? 0 : getQuestionContext().hashCode());
        result = prime * result + ((getQuestionAnswer() == null) ? 0 : getQuestionAnswer().hashCode());
        result = prime * result + ((getQuestionTypeCompany() == null) ? 0 : getQuestionTypeCompany().hashCode());
        result = prime * result + ((getQuestionTypeLanguage() == null) ? 0 : getQuestionTypeLanguage().hashCode());
        result = prime * result + ((getQuestionAnswerparsing() == null) ? 0 : getQuestionAnswerparsing().hashCode());
        result = prime * result + ((getQuestionOptiona() == null) ? 0 : getQuestionOptiona().hashCode());
        result = prime * result + ((getQuestionOptionb() == null) ? 0 : getQuestionOptionb().hashCode());
        result = prime * result + ((getQuestionOptionc() == null) ? 0 : getQuestionOptionc().hashCode());
        result = prime * result + ((getQuestionOptiond() == null) ? 0 : getQuestionOptiond().hashCode());
        result = prime * result + ((getQuestionTestPaperId() == null) ? 0 : getQuestionTestPaperId().hashCode());
        result = prime * result + ((getQuestionStatus() == null) ? 0 : getQuestionStatus().hashCode());
        result = prime * result + ((getQuestionBankSpare() == null) ? 0 : getQuestionBankSpare().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", questionId=").append(questionId);
        sb.append(", questionContext=").append(questionContext);
        sb.append(", questionAnswer=").append(questionAnswer);
        sb.append(", questionTypeCompany=").append(questionTypeCompany);
        sb.append(", questionTypeLanguage=").append(questionTypeLanguage);
        sb.append(", questionAnswerparsing=").append(questionAnswerparsing);
        sb.append(", questionOptiona=").append(questionOptiona);
        sb.append(", questionOptionb=").append(questionOptionb);
        sb.append(", questionOptionc=").append(questionOptionc);
        sb.append(", questionOptiond=").append(questionOptiond);
        sb.append(", questionTestPaperId=").append(questionTestPaperId);
        sb.append(", questionStatus=").append(questionStatus);
        sb.append(", questionBankSpare=").append(questionBankSpare);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}