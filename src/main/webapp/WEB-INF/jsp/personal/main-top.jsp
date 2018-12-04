<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/20
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>main-top</title>
</head>
<body>
<!--主体上方头部-->
<div class="main-top"  style="background-color: #fff;">
    <div class="main-top-info">
        <div class="person-pic"><img src="${pageContext.request.contextPath}/image/${user.userImage}"></div>
        <div class="info-detail">
            <a href="${pageContext.request.contextPath}/transfer/go2PersonalCenter">${user.userName}</a>
            <c:if test="${!empty user.userGender}">
                <c:if test="${user.userGender=='女生'}">
                    <p style="color: #fa9595;">${user.userGender}</p>
                </c:if>
                <c:if test="${user.userGender=='男生'}">
                    <p style="color: #00bc9b;">${user.userGender}</p>
                </c:if>
            </c:if>
            <c:if test="${empty user.userGender}">
                <p>未知性别</p>
            </c:if>
            <c:if test="${!empty user.userSchool}">
                <p>${user.userSchool}</p>
            </c:if>
            <c:if test="${empty user.userSchool}">
                <p>未填写教育信息</p>
            </c:if>
            <c:if test="${!empty user.userWorkExperience}">
                <p>已工作</p>
            </c:if>
            <c:if test="${empty user.userWorkExperience}">
                <p>未填写职业信息</p>
            </c:if>
            <c:if test="${!empty user.userAddress}">
                <p>${user.userAddress}</p>
            </c:if>
            <c:if test="${empty user.userAddress}">
                <p>未填写所在地区</p>
            </c:if>
            <c:if test="${!empty user.userSpare}">
                <p>${user.userSpare}</p>
            </c:if>

        </div>

        <div class="main-top-aside">
            <a href="javascript:void(0);" onclick="go2BasicInfo4Edit()">编辑</a>
        </div>
    </div>
</div>
</body>
</html>
