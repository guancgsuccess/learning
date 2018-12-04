<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/27
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>真题试卷</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/real_quiz_paper.css">
</head>
<body>
<div class="real-module-head">
    <%--<div class="module-head">--%>
        <%--<h3>练习的试卷(<span id="count-paper"></span>)</h3>--%>
        <%--<label><input type="checkbox" checked="checked" onclick="isComplete()" id="complete">只看已完成的</label>--%>
    <%--</div>--%>
</div>


    <div class="module-body">
        <div class="empty-main">
            <ul id="module-real-quiz-paper">
                <%--<li onclick="paperDetail()">--%>
                <%--<span>2018年思必驰校园招聘IOS在线笔试A卷</span>--%>
                <%--<span>试题数量(20)</span>--%>
                <%--<span>完成度(80%)</span>--%>
                <%--<span>得分(60)</span>--%>
                <%--</li>--%>
            </ul>
            <div class="show-paper-page">
                <div class="button-show-page" id="pagearea">
                    <%--<a href="">首页</a>--%>
                    <%--<a href="">上一页</a>--%>
                    <%--<span>1/50</span>--%>
                    <%--<span>500</span>--%>
                    <%--<a href="">下一页</a>--%>
                    <%--<a href="">末页</a>--%>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
