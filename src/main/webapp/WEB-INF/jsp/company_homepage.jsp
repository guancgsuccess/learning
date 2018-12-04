<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/24
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>公司主页</title>
    <link rel="stylesheet" href="../../css/company.css"/>
    <link rel="stylesheet" href="../../css/company_homepage.css"/>
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
                            <a href="${pageContext.request.contextPath}/company/homepage" class="selected">
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
                            <a href="${pageContext.request.contextPath}/company/getQuestions">
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
            <div class="nk-content">
                <div class="module-box">
                    <div class="module-head clearfix">
                        <h1>公司信息</h1>
                    </div>
                    <div class="module-body paw-wrapper">
                        <div class="paw-mod">
                            <div class="paw-mod-hd">
                                <h2>
                                    <a href="${pageContext.request.contextPath}/company/recruit">招聘信息</a>
                                </h2>
                            </div>
                            <ul class="web-statistics">
                                <li>
                                    <p class="ws-num"><c:out value="${reCount}"></c:out></p>
                                    <p>次招聘</p>
                                </li>
                                <li>
                                    <p class="ws-num">0</p>
                                    <p>人应聘</p>
                                </li>
                                <li>
                                    <p class="ws-num">0</p>
                                    <p>人合格</p>
                                </li>
                            </ul>
                        </div>
                        <div class="paw-mod">
                            <div class="paw-mod-hd">
                                <h2>
                                    <a href="#">试题笔试</a>
                                </h2>
                            </div>
                            <ul class="web-statistics2">
                                <li>
                                    <p class="ws-num"><c:out value="${questions}"></c:out></p>
                                    <p>个试题</p>
                                </li>
                                <li>
                                    <p class="ws-num"><c:out value="${papers}"></c:out></p>
                                    <p>个试卷</p>
                                </li>
                                <li>
                                    <p class="ws-num">0</p>
                                    <p>人做过试卷</p>
                                </li>
                                <li>
                                    <p class="ws-num">0</p>
                                    <p>人通过</p>
                                </li>
                            </ul>
                        </div>
                        <div class="paw-mod paw-mod-full">
                            <div class="paw-mod-hd">
                                <h2>
                                    <a href="#">使用技术</a>
                                </h2>
                            </div>
                            <div class="paw-mod-bd">
                                <div class="paw-mod-tips">
                                    <span>暂未标记使用过的技术</span>
                                    <a href="#" class="link-green">点击查看</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <%@include file="company_footer.jsp"%>
    </div>
    </body>
</html>
