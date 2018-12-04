<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/27
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>试题管理</title>
    <link rel="stylesheet" href="../../fonts/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../../css/company.css"/>
    <link rel="stylesheet" href="../../css/company_paper.css"/>
</head>
<body>
<div class="nk-container">
    <%@include file="company_head.jsp"%>
    <div class="nk-main profile-page clearfix">
        <div class="profile-info-wrapper">
            <div class="profile-level level"></div>
            <div class="profile-info-main">
                <a class="head-pic js-self-avatar" >
                    <img src="../../image/1.jpg" alt="头像"/>
                </a>
                <div class="profile-info-cont">
                    <section>
                        <a class="profile-user-name level-color-5" href="javascript:void(0);"><c:out value="${companyInfo.companyName}"></c:out></a>
                        <span>
                                <a href="" target="_blank" class="profile-noauth"></a>
                            </span>
                    </section>
                    <ul class="profile-cont clearfix">
                        <li class="profile-city hide">
                            <i class="ico-pcity"></i>
                            <c:out value="${companyInfo.companyAddress}"></c:out>
                        </li>
                        <li class="profile-work hide">
                            <i class="ico-legal"></i>
                            <c:out value="${companyInfo.companyLegalRepresentative}"></c:out>
                        </li>
                        <li class="profile-edu hide">
                            <i class="ico-type"></i>
                            <c:out value="${companyInfo.companyType}"></c:out>
                        </li>
                        <li class="profile-authentication">
                            <i class="ico-auth"></i>
                            以经国家认证
                        </li>
                    </ul>
                </div>
            </div>
            <div class="profile-oprt-box">
                <a href="#" class="btn btn-primary btn-sm">
                    编辑
                </a>
                <a href="javascript:void(0)" class="btn btn-primary btn-sm js-log-clock nc-req-auth">
                    <fmt:formatDate value="${companyInfo.companyRegisterTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </a>
            </div>
        </div>
        <div class="nk-bar">
            <div class="module-box">
                <ul class="profile-menu">
                    <li>
                        <a href="${pageContext.request.contextPath}/company/homepage">
                            <i class="profile-icon p-ico-home"></i>
                            首页
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/recruit">
                            <i class="profile-icon p-ico-subject"></i>
                            招聘信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/getQuestions" class="selected">
                            <i class="profile-icon p-ico-class"></i>
                            试题管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/questionPaper">
                            <i class="profile-icon p-ico-project"></i>
                            试卷管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company/set">
                            <i class="profile-icon p-ico-set"></i>
                            设置
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="nk-content profile-project">
            <div class="module-box">
                <div class="menu-box">
                    <ul class="menu clearfix js-tab-ul">
                        <li class="selected">
                            <a href="#">试题管理</a>
                        </li>
                    </ul>
                </div>
                <div class="js-tab-content">
                    <table class="no-border-table">
                        <thead>
                        <tr>
                            <th width="120">试题</th>
                            <th width="50">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${questionList}" var="questions" >
                            <tr>
                                <td class="width"><c:out value="${questions.questionContext}"></c:out></td>
                                <td><a href="${pageContext.request.contextPath}/company/deleteQuestion/${questions.questionId}" class="rzzgr btn_sh">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <c:choose>
                        <c:when test="${questionList!='[]'}">
                            <div class="page">
                                <div class="pager">
                                    <span class="colac f1 pr10 lh30">当前${page.currentPageCode}/${page.totalPages}页</span>
                                    <div class="pagera_sh f1">
                                        <a href="${pageContext.request.contextPath}/company/getQuestions?page=${1}" class="disabled next">首页</a>
                                        <c:if test="${page.currentPageCode !=1}">
                                            <a href="${pageContext.request.contextPath}/company/getQuestions?page=${page.currentPageCode-1}" class="disabled next">上一页</a>
                                        </c:if>

                                        <c:if test="${page.currentPageCode != page.totalPages}">
                                            <a href="${pageContext.request.contextPath}/company/getQuestions?page=${page.currentPageCode+1}" class="disabled next">下一页</a>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/company/getQuestions?page=${page.totalPages}" class="disabled next">末页</a>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>

                    <c:choose>
                        <c:when test="${questionList=='[]'}">
                            <div id="jsCpn_6_component" class=" module-body" style="padding-top:0;">
                                <div class="empty-main clearfix">
                                    <div class="empty-topic-pic">
                                        <img src="../../image/empty3.png"/>
                                    </div>
                                    <div class="empty-topic-letter withbtn">
                                        您还没有发布过试题哦
                                    </div>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
    <%@include file="company_footer.jsp"%>
</div>
</body>
</html>
