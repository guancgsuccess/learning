<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/22
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-question</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-test.css">
</head>
<body>

    <%@include file="head.jsp"%>

    <div class="test-wrapper">
        <div class="test-content">
            <div class="test-content-title">
                <h2 class="test-content-title-h2">${questionPaper.questionPaperTitle}</h2>
            </div>
            <div class="module-body">
                <div class="subject-type">
                    <div class="target-pic" style="width:166px;"><img src="//static.nowcoder.com/images/target.png"></div>
                    <div class="content-item-order type-detail">
                        <p><span class="item-label">客观题：</span>选择题${questionPaper.questionPaperNumber}道</p>
                        <p>
                            <span class="item-label">总分：</span>
                            100分</p>
                    </div>
                </div>
                <div class="exam-notice">
                    <p>1、本套试卷来源于网上，由乐宁网注册用户提供，除非经特别声明，乐宁网不拥有该资料版权，亦不承担任何法律责任。</p>
                    <p>2、未经网站或作者的同意不得转载，否则构成侵权，本网站或作者保留诉诸法律的权利。</p>
                    <p>3、如发现本网站载有侵犯您著作权的侵权信息，可依法向我们提出权利申请，申请方式<a href="javascript:void(0);" class="jsClickContract">点击查看</a>。</p>
                </div>
                <div class="test-content-form">
                    <form id="submitForm" method="post" action="${pageContext.request.contextPath}/questionbank/test/${questionPaper.questionPaperId}">
                        <input id="next" type="submit" name="button" class="btn btn-primary begin-exam-btn" value="开始做题">
                    </form>
                </div>

            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>

</body>
</html>
