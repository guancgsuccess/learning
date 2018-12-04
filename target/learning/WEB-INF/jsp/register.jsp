<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/9
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/register1.js"></script>
</head>
<body>

<%@include file="head.jsp" %>
<div id="wraper">
    <div id="blank1"></div>
    <div id="register">
        <div id="top">
            <div id="left_login">
                <a href="${pageContext.request.contextPath}/login">
                    登录
                </a>
            </div>
            <div id="right_register">
                <a href="${pageContext.request.contextPath}/register">注册</a>
            </div>
        </div>
        <div id="bottom">
            <div id="bottom_left">
                <form action="${pageContext.request.contextPath}/user/register" onsubmit="return checkAll();">
                    <div>
                        <input type="text" id="login_input1" class="login_input login_inputs" name="registerPhone" placeholder="请输入手机号码" onblur="checkPhone(this);selectPhone(this)" required="required"/>
                        <span id="valid_userName" class="valid_sapn"></span>
                    </div>
                    <div>
                        <input type="text" id="valid_text" onblur="getValidCode();forValid()" class="valid_input" name="registerValidCode" placeholder="请输入验证码" required="required"/>
                        <button id="for_valid" onclick="forValid()">获取验证码</button>
                        <span id="validCode" class="valid_sapn"></span>
                    </div>
                    <div>
                        <input type="password" class="login_input login_inputs" id="pwd1" name="registerPassword" placeholder="请输入密码" onblur="checkPwd(this)" required="required"/>
                        <span id="valid_pwd1" class="valid_sapn"></span>
                    </div>
                    <div>
                        <input type="password" class="login_input login_inputs" id="pwd2" name="registerPassword2" placeholder="请再次输入密码" onblur="checkPwd2(this)" required="required"/>
                        <span id="valid_pwd2" class="valid_sapn"></span>
                    </div>
                    <div>
                        <input type="submit" id="login_submit" class="login_input"  value="立即注册">
                    </div>
                </form>
            </div>
            <%--<div id="bottom_middle">--%>
                <%--或--%>
            <%--</div>--%>
            <div id="bottom_right">
                <div id="bottom_right_div">
                    <img src="${pageContext.request.contextPath}/image/lr.jpg" style="width: 500px;height: 320px;position: absolute;top: -70px;right: -40px;">
                    <%--<a id="login-qq" href="">QQ账号登录</a>--%>
                    <%--<a id="login-wx" href="">微信账号登录</a>--%>
                    <%--<a id="login-wb" href="">微博账号登录</a>--%>
                </div>

            </div>
        </div>
    </div>
    <div id="blank2"></div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
