<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/25
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>错题集</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/wrong-set.css">
    <script src="${pageContext.request.contextPath}/js/wrong-set.js"></script>
</head>
<body>
                <div class="wrong-module-head">
                    <%--<div class="module-head">--%>
                        <%--<h3>历史错题总数(<span id="wrong-count"></span>)</h3>--%>
                        <%--<h4>未通过错题总数(<span id="nopass-count"></span>)</h4>--%>
                    <%--</div>--%>
                </div>


                    <div class="module-body">
                        <div class="empty-main">
                            <div class="empty-main-title">
                                <p>题目</p>
                                <p>知识点</p>
                                <p>来自</p>
                                <p><input type="checkbox" onclick="isNotPassChecked()" id="not-pass"><span style="color: #00bc9b">只看没通过的</span></p>
                            </div>
                            <div id="module-wrong-set">
                                <%--<div class="empty-main-body">--%>
                                    <%--<p style="position: relative;">--%>
                                        <%--<span class="wrong-icon"></span>--%>
                                        <%--<span class="right-icon"></span>--%>
                                        <%--<a href="javascript:void(0)" onclick="ifClickQuestionContext()" style="margin-left: 10px" title=""></a>--%>
                                    <%--</p>--%>
                                    <%--<p><span></span></p>--%>
                                    <%--<p><a href="javascript:void(0)" onclick="ifClickPaperTitle()" title="questionPaperTitle"></a></p>--%>
                                    <%--<p class="see-detail"><a href="javascript:void(0)" onclick="getQuestionDetail()">查看详情</a></p>--%>
                                 <%--</div>--%>
                            </div>
                        </div>
                    </div>

</body>
</html>
