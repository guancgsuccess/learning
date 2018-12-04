<%--
  Created by IntelliJ IDEA.
  User: meteor
  Date: 2018/10/18
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>招聘信息详情</title>
    <link href="../../image/详情.png" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="../../css/recruitmentInfo.css">
</head>
<body>
    <%@include file="head.jsp"%>
    <div id="recruitmentInfo">
        <div id="company"><i></i><span>公司：${recruitment.recruitmentSpare}</span></div>
        <div id="position"><i></i><span>招聘职位：${recruitment.recuritmentPosition}</span></div>
        <div id="amount"><i></i><span>招聘人数：${recruitment.recruitmentNumber}</span></div>
        <div id="treatment"><i></i><span>薪资待遇：${recruitment.recruitmentTreatment}</span></div>
        <div id="time"><i></i><span>招聘时间：<fmt:formatDate value="${recruitment.interviewTime}" pattern="yyyy-MM-dd"/></span></div>
        <div id="address"><i></i><span>招聘地点：${recruitment.interviewLocation}</span></div>
        <div id="requirement"><i></i><span>招聘要求：${recruitment.recruitmentRequirements}</span></div>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
