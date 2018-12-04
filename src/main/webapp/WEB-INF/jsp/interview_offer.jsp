<%--
  Created by IntelliJ IDEA.
  User: meteor
  Date: 2018/10/22
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>面试 Offer</title>
    <link href="../../image/offer.png" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="../../css/interview_offer.css">
</head>
<body>
    <%@include file="head.jsp"%>
    <c:if test="${test.writtenTestScore < 60}">
        <div id="interview_offer_icon2"></div>
    </c:if>
    <c:if test="${test.writtenTestScore >= 60}">
        <div id="interview_offer_icon1"></div>
    </c:if>
    <div id="interview_offer">
        <c:if test="${test.writtenTestScore >= 60}">
            <div class="interview_offer_title"><span>恭喜${userName}先生通过${companyName}笔试</span></div>
        </c:if>
        <c:if test="${test.writtenTestScore < 60}">
            <div class="interview_offer_title"><span>很遗憾！${userName}先生没有通过${companyName}的笔试</span></div>
        </c:if>
        <div class="interview_offer_score">笔试成绩：${test.writtenTestScore}分</div>
        <c:if test="${test.writtenTestScore >= 60}">
            <div id="interview_offer_footer">具体面试事宜请等待公司与你联系，请保持手机畅通！</div>
        </c:if>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
