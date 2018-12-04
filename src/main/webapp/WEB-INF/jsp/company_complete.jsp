<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/29
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>完善信息</title>
    <link rel="stylesheet" href="../../css/company_complete.css"/>
</head>
<body>
<div class="nk-container">
<%@include file="company_head.jsp"%>
    <div class="nk-main clearfix">
        <div class="wrapper">
            <div class="nk-content">
                <div class="wrapper-content clearfix">
                    <div class="profile-caption">
                        <h3 class="info-title prf-base">完善信息</h3>
                    </div>
                    <div class="input-section">
                        <form action="${pageContext.request.contextPath}/company/complete" method="post" id="jsForm">
                            <div class="form-group">
                                <label class="control-label">公司名称</label>
                                <div class="control-group" id="jsCompany">
                                    <input type="text" name="companyName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">工商注册码</label>
                                <div class="control-group" id="jsPwd">
                                    <input type="text" name="companyRegistrationCode"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">法人代表</label>
                                <div class="control-group" id="jsRePwd">
                                    <input type="text" name="companyLegalRepresentative"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">公司电话</label>
                                <div class="control-group" id="jsRed">
                                    <input type="text" name="companyPhone"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">公司类型</label>
                                <div class="control-group" id="">
                                    <input type="text" name="companyType"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">注册时间</label>
                                <div class="control-group" id="1">
                                    <input type="text" name="companyRegisterTime"/>
                                    <span class="input-tip"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">公司地址</label>
                                <div class="control-group2" id="jsEmail">
                                    <textarea rows="4" cols="30" name="companyAddress"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">公司简介</label>
                                <div class="control-group2" id="2">
                                    <textarea rows="4" cols="30" name="companyIntroduction"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-input-login">
                                    <button type="submit" class="btn btn-primary btn-block" id="jsSubmit">立即注册</button>
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
</body>
</html>
