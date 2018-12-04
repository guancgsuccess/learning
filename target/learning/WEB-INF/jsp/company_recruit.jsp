<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/22
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>招聘信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}../../css/company_recruit.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}../../css/company.css"/>
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
                        <fmt:formatDate value="${companyInfo.companyRegisterTime}" pattern="yy-MM-dd"></fmt:formatDate>
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
                            <a href="${pageContext.request.contextPath}/company/recruit"  class="selected">
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
            <div class="nk-content profile-project">
                <div class="module-box">
                    <div class="menu-box">
                        <ul class="menu clearfix js-tab-ul">
                            <li class="selected">
                                <a href="${pageContext.request.contextPath}/company/recruit">招聘信息</a>
                            </li>
                        </ul>
                        <div class="menu-oprtbar">
                            <a href="${pageContext.request.contextPath}/company/recruitAdd" class="btn btn-primary js-create-project">+点击添加</a>
                        </div>
                    </div>
                    <div class="js-tab-content">
                        <div class="zwlb  mt20">
                            <div class="zwlbb">
                                <div class="zwlbb_title">
                                    <span class="zwlb_zwmc col_sh">公司名称</span>
                                    <span class="zwlb_gzdd col_sh">招聘职位</span>
                                    <span class="zwlb_gsmc col_sh">招聘人数</span>
                                    <span class="zwlb_fbrq col_sh">薪资</span>
                                    <div class="cb"></div>
                                </div>
                                <ul>
                                <c:forEach items="${recruitmentList}" var="recruitment" >

                                    <li class="hides">
                                        <span class="zwlb_zwmc"><c:out value="${companyInfo.companyName}"></c:out></span>
                                        <span class="zwlb_gzdd"><c:out value="${recruitment.recuritmentPosition}"></c:out></span>
                                        <span class="zwlb_gsmc"><c:out value="${recruitment.recruitmentNumber}"></c:out></span>
                                        <span class="zwlb_fbrq"><c:out value="${recruitment.recruitmentTreatment}"></c:out></span>
                                        <div class="cb"></div>
                                        <div class="rzzg">
                                            <div class="rzzgl col_sh">招聘详情:</div>
                                            <div class="rzzgm">
                                                1.时间:<fmt:formatDate value="${recruitment.interviewTime}"></fmt:formatDate> ; <br>
                                                2.地点:<c:out value="${recruitment.interviewLocation}"></c:out> <br>
                                            </div>
                                            <div class="cb"></div>
                                            <div class="rzzgl col_sh">职位要求:</div>
                                            <div class="rzzgm">
                                                <c:out value="${recruitment.recruitmentRequirements}"></c:out>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/company/deleteRecruit/${recruitment.recruitmentId}" class="rzzgr btn_sh" onclick="del()">删除</a>
                                            <div class="cb"></div>
                                        </div>
                                    </li>
                                </c:forEach>
                                </ul>
                            </div>
                            <c:choose>
                                <c:when test="${recruitmentList!='[]'}">
                                    <div class="page">
                                        <div class="pager">
                                            <span class="colac f1 pr10 lh30">当前${page.currentPageCode}/${page.totalPages}页</span>
                                            <div class="pagera_sh f1">
                                                <a href="${pageContext.request.contextPath}/company/recruit?page=${1}" class="disabled next">首页</a>
                                                <c:if test="${page.currentPageCode !=1}">
                                                    <a href="${pageContext.request.contextPath}/company/recruit?page=${page.currentPageCode-1}" class="disabled next">上一页</a>
                                                </c:if>

                                                <c:if test="${page.currentPageCode != page.totalPages}">
                                                    <a href="${pageContext.request.contextPath}/company/recruit?page=${page.currentPageCode+1}" class="disabled next">下一页</a>
                                                </c:if>
                                                <a href="${pageContext.request.contextPath}/company/recruit?page=${page.totalPages}" class="disabled next">末页</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                            </c:choose>
                        </div>
                        <c:choose>
                            <c:when test="${recruitmentList=='[]'}">
                                <div id="jsCpn_6_component" class=" module-body" style="padding-top:0px;">
                                    <div class="empty-main clearfix">
                                        <div class="empty-topic-pic">
                                            <img src="../../image/empty3.png"/>
                                        </div>
                                        <div class="empty-topic-letter withbtn">
                                            您还没有发布招聘信息
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
    <script>
        window.onload = function(){
            var obj_li = document.getElementsByTagName("li");
            for(k in obj_li){
                obj_li[k].onclick=function(){
                    this.className = this.className == "hides"?"show":"hides";
                }
            }
        };

        function del(){
            if(!confirm("确认要删除？")){
                window.event.returnValue = false;
            }
        }
    </script>

    </body>
</html>
