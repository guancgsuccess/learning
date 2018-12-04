<%--
  Created by IntelliJ IDEA.
  User: meteor
  Date: 2018/10/18
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>招聘信息</title>
    <link href="../../image/recruitment.png" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="../../css/recruitment.css">
    <script src="../../js/recruitment.js"></script>
</head>
<body>
    <%@include file="head.jsp"%>
    <div id="recruitment">
        <div id="recruitment_inquire">
            <i class="search_icon" onclick="recruitment()"></i>
            <input type="text" class="recruitment_condition" id="recruitment_condition" placeholder="请输入关键字">
        </div>
        <c:if test="${empty recruitmentList}">
            <span id="emptyKeyword">未搜索到含“${keyword}”的招聘信息</span>
        </c:if>
        <c:if test="${!empty recruitmentList}">
            <div id="recruitment_context">
            <c:forEach var="recruitmentList" items="${recruitmentList}">
                <a onclick="location.href='${pageContext.request.contextPath}/recruitment/selectRecruitmentByRecruitmentId/${recruitmentList.recruitmentId}'">
                    <span class="position">${recruitmentList.recuritmentPosition}</span>
                    <span class="company">${recruitmentList.recruitmentSpare}</span>
                    <span class="address">${recruitmentList.interviewLocation}</span>
                </a>
            </c:forEach>
        </div>
        </c:if>
        <c:if test="${empty keyword}">
            <div id="recruitment_pagination">
                <div style="margin: 0 auto; width: 272px">
                    <c:if test="${pages.currentPageCode != 1}">
                        <a class="recruitment_previous" href="${pageContext.request.contextPath}/recruitment/selectAllRecruitment/${pages.currentPageCode - 1}"><img src="../../image/分页-01.png"></a>
                    </c:if>
                    <c:if test="${pages.currentPageCode == 1}">
                        <a class="recruitment_previous" href="javascript:return false" style="opacity: 0.2"><img src="../../image/分页-01.png"></a>
                    </c:if>

                    <a class="recruitment_now">当前${pages.currentPageCode}/${pages.totalPages}页</a>
                    <c:if test="${pages.currentPageCode != pages.totalPages}">
                        <a class="recruitment_next" href="${pageContext.request.contextPath}/recruitment/selectAllRecruitment/${pages.currentPageCode + 1}"><img src="../../image/分页-02.png"></a>
                    </c:if>
                    <c:if test="${pages.currentPageCode == pages.totalPages}">
                        <a class="recruitment_next" href="javascript:return false" style="opacity: 0.2"><img src="../../image/分页-02.png"></a>
                    </c:if>
                    <a class="recruitment_total">共${pages.totalRecord}条招聘信息</a>
                </div>
            </div>
        </c:if>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>
