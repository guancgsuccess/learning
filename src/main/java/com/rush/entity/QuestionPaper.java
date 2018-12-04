package com.rush.entity;

import java.io.Serializable;

/**
 * question_paper
 * @author 
 */
public class QuestionPaper implements Serializable {
    private Integer questionPaperId;

    private Integer questionPaperCompanyId;

    private String questionPaperTitle;

    private Integer questionPaperNumber;

    private String questionPaperBirthday;//试卷所属时间

    private String questionPaperSparec;//语言类型

    private String questionPaperSpared;//试卷所属公司

    private static final long serialVersionUID = 1L;

    public Integer getQuestionPaperId() {
        return questionPaperId;
    }

    public void setQuestionPaperId(Integer questionPaperId) {
        this.questionPaperId = questionPaperId;
    }

    public Integer getQuestionPaperCompanyId() {
        return questionPaperCompanyId;
    }

    public void setQuestionPaperCompanyId(Integer questionPaperCompanyId) {
        this.questionPaperCompanyId = questionPaperCompanyId;
    }

    public String getQuestionPaperTitle() {
        return questionPaperTitle;
    }

    public void setQuestionPaperTitle(String questionPaperTitle) {
        this.questionPaperTitle = questionPaperTitle;
    }

    public Integer getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(Integer questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }

    public String getQuestionPaperBirthday() {
        return questionPaperBirthday;
    }

    public void setQuestionPaperBirthday(String questionPaperBirthday) {
        this.questionPaperBirthday = questionPaperBirthday;
    }

    public String getQuestionPaperSparec() {
        return questionPaperSparec;
    }

    public void setQuestionPaperSparec(String questionPaperSparec) {
        this.questionPaperSparec = questionPaperSparec;
    }

    public String getQuestionPaperSpared() {
        return questionPaperSpared;
    }

    public void setQuestionPaperSpared(String questionPaperSpared) {
        this.questionPaperSpared = questionPaperSpared;
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
        QuestionPaper other = (QuestionPaper) that;
        return (this.getQuestionPaperId() == null ? other.getQuestionPaperId() == null : this.getQuestionPaperId().equals(other.getQuestionPaperId()))
            && (this.getQuestionPaperCompanyId() == null ? other.getQuestionPaperCompanyId() == null : this.getQuestionPaperCompanyId().equals(other.getQuestionPaperCompanyId()))
            && (this.getQuestionPaperTitle() == null ? other.getQuestionPaperTitle() == null : this.getQuestionPaperTitle().equals(other.getQuestionPaperTitle()))
            && (this.getQuestionPaperNumber() == null ? other.getQuestionPaperNumber() == null : this.getQuestionPaperNumber().equals(other.getQuestionPaperNumber()))
            && (this.getQuestionPaperBirthday() == null ? other.getQuestionPaperBirthday() == null : this.getQuestionPaperBirthday().equals(other.getQuestionPaperBirthday()))
            && (this.getQuestionPaperSparec() == null ? other.getQuestionPaperSparec() == null : this.getQuestionPaperSparec().equals(other.getQuestionPaperSparec()))
            && (this.getQuestionPaperSpared() == null ? other.getQuestionPaperSpared() == null : this.getQuestionPaperSpared().equals(other.getQuestionPaperSpared()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getQuestionPaperId() == null) ? 0 : getQuestionPaperId().hashCode());
        result = prime * result + ((getQuestionPaperCompanyId() == null) ? 0 : getQuestionPaperCompanyId().hashCode());
        result = prime * result + ((getQuestionPaperTitle() == null) ? 0 : getQuestionPaperTitle().hashCode());
        result = prime * result + ((getQuestionPaperNumber() == null) ? 0 : getQuestionPaperNumber().hashCode());
        result = prime * result + ((getQuestionPaperBirthday() == null) ? 0 : getQuestionPaperBirthday().hashCode());
        result = prime * result + ((getQuestionPaperSparec() == null) ? 0 : getQuestionPaperSparec().hashCode());
        result = prime * result + ((getQuestionPaperSpared() == null) ? 0 : getQuestionPaperSpared().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", questionPaperId=").append(questionPaperId);
        sb.append(", questionPaperCompanyId=").append(questionPaperCompanyId);
        sb.append(", questionPaperTitle=").append(questionPaperTitle);
        sb.append(", questionPaperNumber=").append(questionPaperNumber);
        sb.append(", questionPaperBirthday=").append(questionPaperBirthday);
        sb.append(", questionPaperSparec=").append(questionPaperSparec);
        sb.append(", questionPaperSpared=").append(questionPaperSpared);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}