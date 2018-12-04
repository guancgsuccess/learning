<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/19
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业登录-乐宁网企业版</title>
    <link rel="stylesheet" type="text/css" href="../../css/verify.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}../../css/company_login.css"/>
    <script type="text/javascript" src="../../js/company_login.js"></script>
</head>
<body>

<div class="nk-container">
    <%@include file="company_head.jsp"%>
    <div class="nk-main clearfix">
        <div class="wrapper">
            <div class="tabbed">
                <ul class="clearfix">
                    <li class="tab-selected">
                        <a href="${pageContext.request.contextPath}/company_login"><span class="tab-login"></span>企业登录</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/company_register"><span class="tab-reg"></span>企业注册</a>
                    </li>
                </ul>
            </div>
            <div class="wrapper-content clearfix">
                <form action="${pageContext.request.contextPath }/company/login" method="post" onsubmit="fromSubmit()">
                <div class="input-section">
                    <div class="form-group">
                        <label class="control-label">邮箱</label>
                        <div class="control-group" id="jsEmail">
                            <input type="text" name="companyEmail" id="companyEmail" onblur="checkEmail(this)" placeholder="请输入邮箱"/>
                            <i class="input-icon fui-cross"></i>
                            <i class="input-icon fui-check-inverted"></i>
                            <span style="margin-top:-10px; width: 250px;display: block;font-size: 12px;color: #FF411C;">${errorMsg}</span>
                            <span class="input-tip" id="valid_email"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label">密码</label>
                        <div class="control-group" id="jsPwd">
                            <input type="password" name="companyPassword" onblur="checkPwd()" placeholder="请输入密码"/>
                            <i class="input-icon fui-cross"></i>
                            <i class="input-icon fui-check-inverted"></i>
                            <span class="input-tip" id="valid_pwd1"></span>
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                        <%--<label class="control-label">输入验证码</label>--%>
                        <%--<div id="mpanel2" >--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="form-group about-pwd">
                        <div class="keep-pwd">
                            <label><input checked name="remember-me" type="hidden" id="jsEmMe"/></label>
                        </div>
                        <a href="#" class="forget-pwd">忘记密码?</a>
                    </div>
                    <div class="form-group">
                        <div class="col-input-login">
                            <input type="submit" class="btn btn-primary btn-block verify-btn" id="check-btn" value="立即登录">
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="company_footer.jsp"%>
</div>

<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/verify.js" ></script>
<script type="text/javascript">
    function checkEmail(){
        var email = document.getElementById("companyEmail");
        var regular = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        if(!regular.test(email.value)){
            document.getElementById("valid_email").style.display="block";
            document.getElementById("valid_email").innerText = "请填写正确的邮箱";
        }else{
            document.getElementById("valid_email").style.display="none";
            return true;
        }
    }

    //验证密码
    function checkPwd(){
        var pwd1 = document.getElementById("pwd1");
        var regular = /^[a-zA-Z]\w{5,17}$/;
        if(!regular.test(pwd1.value)){
            document.getElementById("valid_pwd1").style.display="block";
            document.getElementById("valid_pwd1").innerText = "必须以字母开头,且不少于6位";

        }else{
            document.getElementById("valid_pwd1").style.display="none";
            return true;
        }
    }

    $('#mpanel2').codeVerify({
        type : 1,
        width : '260px',
        height : '42px',
        fontSize : '30px',
        codeLength : 6,
        btnId : 'check-btn',
        ready : function() {
        },

        success : function() {
            alert('验证码正确！');
        },
        error : function() {
            alert('验证码不匹配！');
        }
    });
</script>
<script>

</script>

</body>
</html>
