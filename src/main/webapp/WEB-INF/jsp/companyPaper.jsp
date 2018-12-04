<%--
  Created by IntelliJ IDEA.
  User: meteor
  Date: 2018/10/19
  Time: 8:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>试卷库</title>
    <link href="../../image/试卷库.png" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="../../css/companyPaper.css">
</head>
<body>
    <%@include file="head.jsp"%>
    <div id="paper">
        <div id="all_paper">
            <c:forEach var="company" items="${companyList}">
                <div class="companyPaper" onclick="location.href='${pageContext.request.contextPath}/test/selectCompanyPaper/${company.companyId}&0&status'">
                    <div class="companyName">${company.companyName}</div>
                    <div class="companyDeadline">截止日期：${company.companySpare}</div>
                </div>
            </c:forEach>
        </div>
        <div id="paper_pagination">
            <div style="margin: 0 auto; width: 272px">
                <c:if test="${pages.currentPageCode != 1}">
                    <a class="paper_previous" href="${pageContext.request.contextPath}/test/selectAllCompany/${pages.currentPageCode - 1}"><img src="../../image/分页-01.png"></a>
                </c:if>
                <c:if test="${pages.currentPageCode == 1}">
                    <a class="paper_previous" href="javascript:return false" style="opacity: 0.2"><img src="../../image/分页-01.png"></a>
                </c:if>
                <a class="paper_now">当前${pages.currentPageCode}/${pages.totalPages}页</a>
                <c:if test="${pages.currentPageCode != pages.totalPages}">
                    <a class="paper_next" href="${pageContext.request.contextPath}/test/selectAllCompany/${pages.currentPageCode + 1}"><img src="../../image/分页-02.png"></a>
                </c:if>
                <c:if test="${pages.currentPageCode == pages.totalPages}">
                    <a class="paper_next" href="javascript:return false" style="opacity: 0.2"><img src="../../image/分页-02.png"></a>
                </c:if>
                <a class="paper_total">共${pages.totalRecord}套试卷</a>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
<script>
    if ('message' == '${message}') {
        alert('请先登录！！！');
    }
</script>
</html>
