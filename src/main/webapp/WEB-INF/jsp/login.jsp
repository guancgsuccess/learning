<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/9
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript">
        var xhr=null;
        function remember() {
            var remFlag=document.getElementById("remember-me");
            if(remFlag.checked){
                //cookie存用户名和密码，回显的是真实的用户名和密码，存在安全问题
                var conFlag=confirm("记录密码功能不宜在公共场所使用,以防密码泄露.您确定要使用此功能吗?");
                if(conFlag){
                    remFlag.value=0;
                }else{
                    remFlag.checked=false;
                    remFlag.value=1;
                }
            }else{
                remFlag.value=1;
            }
        }


        function getCookie(){
            var url_getCookie="${pageContext.request.contextPath}/user/getCookie";
            //创建ajax对象
            if(window.XMLHttpRequest){
                xhr=new XMLHttpRequest();
            }else{
                xhr=new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",url_getCookie,true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange=afterGetCookie;
            xhr.send();
        }

        function afterGetCookie(){
            if(xhr.readyState==4&&xhr.status==200){
                var rememberMap=JSON.parse(xhr.responseText);
                if(rememberMap.loginAccount!=""&&rememberMap.loginAccount!=null&&rememberMap.loginPassword!=null&&rememberMap.loginPassword!="") {
                    document.getElementById("remember-me").checked=true;
                    document.getElementById("login_input1").value = rememberMap.loginAccount;
                    document.getElementById("input-pwd").value = rememberMap.loginPassword;
                }
                else {
                    document.getElementById("remember-me").checked=false;
                    document.getElementById("remember-me").value=1;
                }
            }
        }

        window.onload=function () {
            getCookie();
        }
    </script>
</head>
<body>

    <%@include file="head.jsp" %>
    <div id="wraper">
        <div id="blank1"></div>
        <div id="login">
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
                    <form action="${pageContext.request.contextPath}/user/login" method="post">
                        <div>
                            <input type="text" id="login_input1" autocomplete="off" class="login_input login_inputs" name="loginAccount" placeholder="请输入手机号码" required="required"/>
                            <span id="" style="height: 14px; width: 250px;display: block;font-size: 12px;color: #FF411C;">${loginFailureMsg}</span>
                        </div>
                        <div>
                            <input type="password" id="input-pwd" autocomplete="off" class="login_input login_inputs" name="loginPassword" placeholder="请输入密码"/>
                        </div>
                        <div id="pwd">
                            <input type="checkbox" name="rememberStatus" onclick="remember()" id="remember-me" value=""/>
                            <span>记住密码(7天免登陆)</span>
                            <%--<span><a href="${pageContext.request.contextPath}/forgot-pwd">忘记密码？</a></span>--%>
                        </div>
                        <div>
                            <input type="submit" id="login_submit" class="login_input" value="立即登录">
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
                        <%--<ul>
                            <li><a href="">QQ账号登录</a></li>
                            <li><a href="">微信账号登录</a></li>
                            <li><a href="">微博账号登录</a></li>
                        </ul>--%>
                    </div>

                </div>
            </div>
        </div>
        <div id="blank2"></div>
    </div>

<%@include file="footer.jsp"%>
</body>
</html>
