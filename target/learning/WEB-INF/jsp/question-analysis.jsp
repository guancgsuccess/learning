<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/23
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>乐宁网-答案解析</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-analysis.css">
</head>
<body>
    <%@include file="head.jsp"%>

    <div class="answer-wrapper">
        <div class="answer-content">
            <div class="menu-box">
                <ul class="menu clearfix">
                    <li class="noselected"><a href="${pageContext.request.contextPath}/questionbank/assessment/${answerProofread.questionPaperId}/${answerProofread.userAnswer}/${answerProofread.useTime}">评估报告</a></li>
                    <li class="selected"><a href="${pageContext.request.contextPath}/questionbank/analysis/${answerProofread.questionPaperId}/${answerProofread.userAnswer}/${answerProofread.useTime}">答案解析</a></li>
                </ul>
            </div>
            <div class="answer-content-main">
                <div class="answer-user">
                    <p id="question-title">${answerProofread.questionTitle}</p>
                </div>
                <div class="answer-right">
                    <p>正确答案是：</p><span>${answerProofread.correctAnswer}</span>
                </div>
                <div class="answer-user">
                    <p>你的答案是：</p><sapn id="user-answer">${answerProofread.userAnswer}</sapn>
                </div>
                <div class="result-subject-item result-subject-answer">
                    <% int i = 1;%>
                    <c:forEach items="${answerProofread.questionBanks}" var="questions">
                        <h1><%=i++%>、${questions.questionContext}</h1>
                        <c:choose>
                            <c:when test="${questions.questionAnswer=='A'}">
                                <div class="result-answer-item" style="border-color:#1abc9c;color: #1abc9c">
                                    <pre>A、${questions.questionOptiona}</pre>
                                </div>
                            </c:when>
                            <c:when test="${questions.questionAnswer!='A'}">
                                <div class="result-answer-item">
                                    <pre>A、${questions.questionOptiona}</pre>
                                </div>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${questions.questionAnswer=='B'}">
                                <div class="result-answer-item" style="border-color:#1abc9c;color: #1abc9c">
                                    <pre>B、${questions.questionOptionb}</pre>
                                </div>
                            </c:when>
                            <c:when test="${questions.questionAnswer!='B'}">
                                <div class="result-answer-item">
                                    <pre>B、${questions.questionOptionb}</pre>
                                </div>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${questions.questionAnswer=='C'}">
                                <div class="result-answer-item" style="border-color:#1abc9c;color: #1abc9c">
                                    <pre>C、${questions.questionOptionc}</pre>
                                </div>
                            </c:when>
                            <c:when test="${questions.questionAnswer!='C'}">
                                <div class="result-answer-item">
                                    <pre>C、${questions.questionOptionc}</pre>
                                </div>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${questions.questionAnswer=='D'}">
                                <div class="result-answer-item" style="border-color:#1abc9c;color: #1abc9c">
                                    <pre>D、${questions.questionOptiond}</pre>
                                </div>
                            </c:when>
                            <c:when test="${questions.questionAnswer!='D'}">
                                <div class="result-answer-item">
                                    <pre>D、${questions.questionOptiond}</pre>
                                </div>
                            </c:when>
                        </c:choose>
                        <%--<div class="result-answer-item">
                            <pre>A、${questions.questionOptiona}</pre>
                        </div>
                        <div class="result-answer-item">
                            <pre>B、${questions.questionOptionb}</pre>
                        </div>
                        <div class="result-answer-item">
                            <pre>C、${questions.questionOptionc}</pre>
                        </div>
                        <div class="result-answer-item green-answer-item">
                            <pre>D、${questions.questionOptiond}</pre>
                        </div>--%>
                        <div id="div-hr"></div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
