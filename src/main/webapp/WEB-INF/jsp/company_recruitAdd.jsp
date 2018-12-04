<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/27
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>添加招聘</title>
    <link rel="stylesheet" href="../../css/company.css"/>
    <link rel="stylesheet" href="../../css/company_recruitAdd.css"/>
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
                            <a href="${pageContext.request.contextPath}/company/recruitAdd" class="btn btn-primary js-create-project">点击添加</a>
                        </div>
                    </div>
                    <div class="js-tab-content">
                        <div id="jsCpn_6_component" class=" module-body" style="padding-top:0;">
                            <form action="${pageContext.request.contextPath}/company/addRecruit" method="post" name="form1" onsubmit="return myCheck()">
                                <div class="form-group">
                                    <label class="control-label">招聘职位</label>
                                    <div class="control-group" id="jsPwd">
                                        <input type="text" name="recuritmentPosition"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">招聘人数</label>
                                    <div class="control-group" id="jsRePwd">
                                        <input type="text" name="recruitmentNumber"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">薪资</label>
                                    <div class="control-group" id="jsRed">
                                        <input type="text" name="recruitmentTreatment"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">面试时间</label>
                                    <div class="control-group" id="">
                                        <input type="text" name="interviewTime"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">面试地点</label>
                                    <div class="control-group" id="1">
                                        <input type="text" name="interviewLocation"/>
                                        <span class="input-tip"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">招聘要求</label>
                                    <div class="control-group2" id="jsEmail">
                                        <textarea rows="4" cols="32" name="recruitmentRequirements" style="resize:none;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-input-login">
                                        <button type="submit" class="btn btn-primary btn-block" id="jsSubmit">立即添加</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%@include file="company_footer.jsp"%>
    </div>

    <script>
        //表单不能为空
        function myCheck(){
            for(var i=0;i<document.form1.elements.length-2;i++) //下面减一是因为数组的下标为0
            {
                /*alert(document.form.$element.length);
                alert(document.form1.elements[i].value);*/
                if(document.form1.elements[i].value=="")
                {
                    alert("当前表单不能有空");
                    document.form1.elements[i].focus();
                    return false;
                }
            }
            return true;
        }
    </script>
    </body>
</html>
