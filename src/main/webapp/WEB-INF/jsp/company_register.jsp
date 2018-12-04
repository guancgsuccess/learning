<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2018/10/19
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业注册-乐宁网企业版</title>
    <link rel="stylesheet" href="../../css/company_register.css"/>
</head>
    <body>
    <div class="nk-container">
        <%@include file="company_head.jsp"%>
        <div class="nk-main clearfix">
            <div class="wrapper">
                <div class="tabbed">
                    <ul class="clearfix">
                        <li>
                            <a href="/company_login"><span class="tab-login"></span>企业登录</a>
                        </li>
                        <li class="tab-selected">
                            <a href="/company_register"><span class="tab-reg"></span>企业注册</a>
                        </li>
                    </ul>
                </div>
                <div class="wrapper-content clearfix">
                    <div class="input-section">
                        <form action="${pageContext.request.contextPath}/company/register" method="post" name="form1" onsubmit="return myCheck()">
                            <div class="form-group">
                                <label class="control-label">公司名称</label>
                                <div class="control-group" id="jsCompany">
                                    <input type="text" name="companyName" id="companyName" placeholder="请输入公司名称"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip" id="showRet"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">电子邮箱</label>
                                <div class="control-group" id="jsEmail">
                                    <input type="text" name="companyEmail" id="companyEmail" onblur="checkEmail(this)" placeholder="请输入公司邮箱"/>
                                    <span class="input-tip" id="errorMsg"></span>
                                    <span class="input-tip" id="valid_email"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">密码</label>
                                <div class="control-group" id="jsPwd">
                                    <input type="password" name="companyPassword" onblur="checkPwd()" placeholder="请输入密码" id="pwd1"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip" id="valid_pwd1"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">确认密码</label>
                                <div class="control-group" id="jsRePwd">
                                    <input type="password" name="password" onblur="checkPwd2()" placeholder="请重新输入密码" id="pwd2"/>
                                    <i class="input-icon fui-cross"></i>
                                    <i class="input-icon fui-check-inverted"></i>
                                    <span class="input-tip" id="valid_pwd2"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label">验证码</label>
                                <div class="btn-group phone-code">
                                    <div class="control-group" id="jsCode">
                                        <input type="text" id="valid_text" name="registerValidCode" placeholder="请输入验证码"/>
                                        <i class="input-icon fui-cross"></i>
                                        <i class="input-icon fui-check-inverted"></i>
                                        <span class="input-tip" id="validCode"></span>
                                    </div>
                                    <span class="input-group-btn">
                                        <button type="button" onclick="forValid()" class="btn btn-primary" id="for_valid">获取验证码</button>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-input-login">
                                    <button type="submit" class="btn btn-primary btn-block" onclick="companyIsExit()">立即注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="company_footer.jsp"%>
    </div>

    <script>

        // 验证邮箱
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

        //验证二次密码
        function checkPwd2(){
            var pwd1 = document.getElementById("pwd1");
            var pwd2 = document.getElementById("pwd2");
            if(pwd1.value!=pwd2.value){
                document.getElementById("valid_pwd2").style.display="block";
                document.getElementById("valid_pwd2").innerText = "两次密码不一致,请重新输入";

            }else{
                document.getElementById("valid_pwd2").style.display="none";
                return true;
            }
        }

        //验证码
        var xhr = null;
        var validTime = 60;
        function forValid(){
            document.getElementById("validCode").style.display = "none";
            document.getElementById("valid_text").innerText = "";
            var emailEle = document.getElementById("companyEmail");
            var flag = checkEmail(emailEle);
            if(flag){
                forValidTime(validTime);
                var companyEmail = emailEle.value;
                var url_forValid = "/company/forValid/"+companyEmail;
                if(window.XMLHttpRequest){
                    xhr = new XMLHttpRequest();
                }else{
                    xhr = new ActiveXObject('Microsoft.XMLHTTP');
                }

                xhr.open("GET",url_forValid,true);
                xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
                // xhr.onreadystatechange = getValidCode();
                xhr.send();
            }
        }

        //验证码时间
        function forValidTime(that) {
            var timer = window.setTimeout("forValidTime("+(validTime--)+")",1*1000);
            if(that>0) {
                document.getElementById("for_valid").innerText = that + "秒后重新获取";
                document.getElementById("for_valid").disabled = true;
            }else {
                document.getElementById("for_valid").innerText = "重新获取验证码";
                document.getElementById("for_valid").disabled = false;
                clearTimeout(timer);
                validTime = 60;
            }
        }


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
