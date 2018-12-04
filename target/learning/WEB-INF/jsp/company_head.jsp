<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/19
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>company_head</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}../../css/company_head.css"/>
</head>
    <body>
        <div class="nowcoder-head">
            <div class="header-main clearfix">
                <a href="/company_login" class="nowcoder-logo" title="乐宁网企业版">
                    <p class="title1">乐宁网</p>
                    <p class="title2">learning</p>
                </a>
               <%-- <ul class="nowcoder-navbar">
                    <li><a href="/test">笔试测试</a></li>
                    <li><a href="/interview">在线面试</a></li>
                </ul>--%>
                <c:choose>
                    <c:when test="${company==null}">
                        <div class="nav-account">
                            <a href="/company_login" class="nav-account-login" id="nav-login">登录</a> /
                            <a href="/company_register" class="nav-account-reg" data-permalink>注册</a>
                        </div>
                    </c:when>
                    <c:when test="${company!=null}">
                        <div class="nav-account">
                            <a href="${pageContext.request.contextPath}/company/logout" class="nav-account-logout">退出登录</a>
                        </div>
                    </c:when>
                </c:choose>
                <%--<div class="nav-account">
                    <a href="/company_login" class="nav-account-login" id="nav-login">登录</a> /
                    <a href="/company_register" class="nav-account-reg" data-permalink>注册</a>
                </div>--%>
            </div>
        </div>
    </body>
</html>
