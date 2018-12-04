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
    <link rel="stylesheet" href="../../css/company_set.css"/>
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
            <div class="module-box profile-setting">
                <div class="module-body">
                    <div class="profile-info-box edit-box" id="setLoginPwd">
                        <div class="profile-caption">
                            <h3 class="info-title prf-none">修改密码</h3>
                        </div>
                        <div class="info-box set-msg-box info-edit-box">
                            <form action="${pageContext.request.contextPath }/company/" method="post" onsubmit="fromSubmit()">
                            <dl>
                                <dt>原密码</dt>
                                <dd class="control-group js-pwd-old" id="jsCpn_13_component_4">
                                    <input type="password" name="companyPassword" class="form-control-old-pw"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip"></span>
                                </dd>
                            </dl>
                            <dl>
                                <dt>新密码</dt>
                                <dd class="control-group js-pwd-new" id="jsCpn_14_component_5">
                                    <input type="password" name="companyPassword" class="form-control-new-pw"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip"></span>
                                </dd>
                            </dl>
                            <dl>
                                <dt>重输新密码</dt>
                                <dd class="control-group js-pwd-new2" id="jsCpn_15_component_6">
                                    <input type="password" class="form-control-new-repw"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip"></span>
                                </dd>
                            </dl>
                            <div class="info-edit-box">
                                <dl>
                                    <dt>&nbsp;</dt>
                                    <dd><a href="${pageContext.request.contextPath}/company/updatePwd" class="btn  btn-primary btn-lg btn-info-save js-btn-submit">保存</a></dd>
                                </dl>
                            </div>
                            </form>
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
