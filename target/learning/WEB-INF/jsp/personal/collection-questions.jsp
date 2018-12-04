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
    <title>收藏的题目</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/collection-questions.css">
    <script src="${pageContext.request.contextPath}/js/collection-question.js"></script>
</head>
<body>

        <div id="collection-question">
            <!--右边-->
            <div class="main-bottom-right" style="background-color: #fff;">
                <div class="menu-box">
                    <ul class="profile-menu">
                        <li><a href="#">收藏的题目</a></li>
                    </ul>
                </div>

                <div class="module-head">
                    <h3>收藏的题目(<span id="collection"></span>)</h3>
                </div>

                <div class="module-body">
                    <div class="empty-main">
                        <ul id="module-collection">
                            <%--<li>--%>
                                <%--<span onclick="ifQuestionClickC()">题目</span>--%>
                                <%--<span>题目类型</span>--%>
                                <%--<span onclick="ifPaperClickC()">所属试卷</span>--%>
                                <%--<a href="javascript:void(0);" onclick="editCollection()">编辑</a>--%>
                            <%--</li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>
