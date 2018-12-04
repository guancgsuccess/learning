<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/18
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>刷题</title>
    <script src="${pageContext.request.contextPath}/js/brush-questions.js"></script>
</head>
<body>
        <div id="brush-question">
            <!--右边-->
            <div class="main-bottom-right" style="background-color: #fff;">
                <%@include file="brush-question-top.jsp"%>

                <%--真题试卷--%>
                <div id="ajax-real-quiz-paper">
                    <%@include file="real_quiz_paper.jsp"%>
                </div>

                <div id="ajax-online-set" style="display: none">
                    <%@include file="online-set.jsp"%>
                </div>

                <div id="ajax-wrong-set" style="display: none">
                    <%@include file="wrong-set.jsp"%>
                </div>

            </div>
        </div>

</body>
</html>
