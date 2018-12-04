<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/21
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-找回密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgot-pwd1.css">
</head>
<body>

    <%@include file="head.jsp"%>

    <div class="forgot-wrapper">
        <div class="forgot-content">
            <h2 class="forgot-title">密码找回</h2>
            <input type="text" class="forgot-phone" placeholder="请输入手机号码"/>
            <div class="forgot-content-middle">
                <input type="text" class="forgot-valid" placeholder="请输入验证码"/>
                <button onclick="" class="forgot-forvalid">获取验证码</button>
            </div>

            <a href="" class="fotgot-a">确定</a>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
