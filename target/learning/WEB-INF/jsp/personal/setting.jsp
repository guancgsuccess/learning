<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/18
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设置</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/setting.css">
    <script src="${pageContext.request.contextPath}/js/setting.js"></script>
</head>
<body>
            <div id="setting">
                <script type="text/javascript">
                    function loadSetting() {
                        var setting_body=document.getElementById("setting");
                        setting_body.innerHTML="";
                        setting_body.innerHTML+="<!--右边-->\n" +
                            "                <div class=\"main-bottom-right\" style=\"background-color: #fff;\">\n" +
                            "                    <div class=\"module-body\">\n" +
                            "                        <!--修改登陆手机-->\n" +
                            "                        <div class=\"profile-info-box\">\n" +
                            "                            <div class=\"profile-caption\">\n" +
                            "                                <h3>登陆手机</h3>\n" +
                            "                                <div class=\"profile-caption-oprt\">\n" +
                            "                                    <a href=\"${pageContext.request.contextPath}/transfer/go2ChangePhoneTips\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号已被注册?</span></a>\n" +
                            "                                </div>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"info-box\">\n" +
                            "                                <dl>\n" +
                            "                                    <dt>原手机号码</dt>\n" +
                            "                                    <dd id=\"user-phone\">${user.userPhone}</dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>新手机号码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input type=\"tel\" name=\"phone\" placeholder=\"&nbsp;请输入手机号码\" id=\"input-phone\" onclick=\"inputTel()\" style=\"margin-top: 10px\">\n" +
                            "                                    </dd>\n" +
                            "                                    <span id=\"error-tip1\"></span>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>验证码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input type=\"text\" name=\"验证码\" placeholder=\"&nbsp;请输入验证码\" id=\"input-phone-code\">\n" +
                            "                                        <input type=\"button\" value=\"获取验证码\" onclick=\"sendPhoneCode(this)\">\n" +
                            "                                    </dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <a href=\"javascript:void(0);\" onclick=\"savePhone(${user.userId})\">保存</a>\n" +
                            "                                </dl>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                        <!--绑定邮箱-->\n" +
                            "                        <div class=\"profile-info-box\">\n" +
                            "                            <div class=\"profile-caption\">\n" +
                            "                                <h3>绑定邮箱</h3>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"info-box\">\n" +
                            "                                <dl>\n" +
                            "                                    <dt>原邮箱</dt>\n" +
                            "                                    <dd id=\"user-email\">${user.userEmail}</dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>新邮箱</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input type=\"email\" name=\"email\" placeholder=\"&nbsp;请输入邮箱\" id=\"input-email\" onclick=\"inputEmail()\" style=\"margin-top: 10px\">\n" +
                            "                                    </dd>\n" +
                            "                                    <span id=\"error-tip2\"></span>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>验证码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input type=\"text\" name=\"验证码\" placeholder=\"&nbsp;请输入验证码\" id=\"input-email-code\">\n" +
                            "                                        <input type=\"button\" value=\"获取验证码\" onclick=\"sendEmailCode(this)\">\n" +
                            "                                    </dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <a href=\"javascript:void(0);\" onclick=\"saveEmail(${user.userId})\">保存</a>\n" +
                            "                                </dl>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                        <!--修改登陆密码-->\n" +
                            "                        <div class=\"profile-info-box\">\n" +
                            "                            <div class=\"profile-caption\">\n" +
                            "                                <h3>登陆密码</h3>\n" +
                            "                            </div>\n" +
                            "                            <div class=\"info-box\">\n" +
                            "                                <dl>\n" +
                            "                                    <dt>原密码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input placeholder=\"&nbsp;请输入正确的原密码\" type=\"password\" name=\"password\" id=\"input-password-old\" style=\"margin-top: 10px\" onclick=\"inputOldPwd()\">\n" +
                            "                                    </dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>新密码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input placeholder=\"&nbsp;请输入新密码\" type=\"password\" name=\"password\" id=\"input-password-new\" style=\"margin-top: 10px\" onclick=\"inputNewPwd()\">\n" +
                            "                                    </dd>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <dt>再次输入新密码</dt>\n" +
                            "                                    <dd>\n" +
                            "                                        <input placeholder=\"&nbsp;请确认您的密码\" type=\"password\" name=\"password\" id=\"repassword\" style=\"margin-top: 10px\" onclick=\"inputRePwd()\">\n" +
                            "                                    </dd>\n" +
                            "                                    <span id=\"error-tip3\"></span>\n" +
                            "                                </dl>\n" +
                            "                                <dl>\n" +
                            "                                    <a href=\"javascript:void(0);\" onclick=\"savePassword(${user.userId})\">保存</a>\n" +
                            "                                </dl>\n" +
                            "                            </div>\n" +
                            "                        </div>\n" +
                            "                    </div>\n" +
                            "                </div>";
                    }
                </script>
            </div>
</body>
</html>
