<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/23
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-校对答案</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-assessment.css">
</head>
<body>

    <%@include file="head.jsp"%>

    <div class="answer-wrapper">
        <div class="answer-content">
            <div class="menu-box">
                <ul class="menu clearfix">
                    <li class="selected"><a href="${pageContext.request.contextPath}/questionbank/assessment/${answerProofread.questionPaperId}/${answerProofread.userAnswer}/${answerProofread.useTime}">评估报告</a></li>
                    <li class="noselected"><a href="${pageContext.request.contextPath}/questionbank/analysis/${answerProofread.questionPaperId}/${answerProofread.userAnswer}/${answerProofread.useTime}">答案解析</a></li>
                </ul>
            </div>
            <div class="graph-box clearfix">
                <div class="graph-info">
                    <div class="graph-statistic">
                        <span class="graph-score">得分：${answerProofread.correctNum*20}</span>
                    </div>
                    <div class="content-item-order graph-detail">
                        <p><span class="item-label">试卷：</span>
                            ${answerProofread.questionTitle}
                            <span class="stars star-3" title="难度系数"></span>
                        </p>
                        <p>
                            <span class="item-label">正确题数：</span>
                            ${answerProofread.correctNum}/${answerProofread.questionNum}
                        </p>
                        <p>
                            <span class="item-label">未做题数：</span>
                            ${answerProofread.uncompleted}/${answerProofread.questionNum}
                        </p>
                        <p>
                            <span class="item-label">得分：</span>
                            ${answerProofread.correctNum*20}</p>
                        <p>
                            <span class="item-label">用时：</span>
                            ${answerProofread.useTime}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>

</body>
</html>
