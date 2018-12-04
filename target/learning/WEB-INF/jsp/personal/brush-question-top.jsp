<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/25
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>刷题导航</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/brush-question-top.css">
    <script src="${pageContext.request.contextPath}/js/brush-questions.js"></script>
</head>
<body>
<div class="menu-box">
    <ul class="profile-menu">
        <li onclick="go2RealQuizPaper()"><a href="javascript:void(0);" id="q1">真题试卷</a></li>
        <li onclick="go2WrongTitleSet()"><a href="javascript:void(0);" id="q2">错题集</a></li>
        <li onclick="go2OnlineTopics()"><a href="javascript:void(0);" id="q3">在线题目</a></li>
    </ul>
</div>
</body>
</html>
