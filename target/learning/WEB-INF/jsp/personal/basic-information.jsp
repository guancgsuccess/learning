<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/18
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>基本资料</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basic-information.css">
    <!--js-->
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
            <div id="basic-information">
                <!--右边-->
                <div class="main-bottom-right"  style="background-color: #fff;">
                    <!--基本资料-->
                    <div class="module-box">
                        <div class="module-body">
                            <div class="profile-info-box">
                                <div class="profile-caption">
                                <span class="ctr-btn-box">
                                    <a href="javascript:void(0);" onclick="transfer2Edit()" class="btn-info-edit" id="id-edit">编辑</a>
                                </span>
                                    <span class="ctr-btn-box">
                                    <a href="javascript:void(0);" onclick="saveEdit()" class="btn-info-edit" id="id-save">保存</a>
                                </span>
                                    <span class="ctr-btn-box">
                                    <a href="javascript:void(0);" onclick="transfer2Cancel()" class="btn-info-edit" id="id-cancel">取消</a>
                                </span>
                                    <h3 class="info-title">基本信息</h3>
                                    <span class="info-id">(乐宁ID：${user.userId})</span>
                                    <input type="hidden" name="userId" value="${user.userId}" id="user-id">
                                </div>
                                <!--**************显示*************-->
                                <div class="info-box">
                                    <dl><dt>我的昵称</dt><dd>${user.userName}</dd></dl>
                                    <dl><dt>我的性别</dt><dd>${user.userGender}</dd></dl>
                                    <dl><dt>我的简介</dt><dd>${user.userSpare}</dd></dl>
                                    <c:if test="${empty user.userRealName}">
                                        <dl id="real-name1"><dt>实名认证</dt><dd><a href="${pageContext.request.contextPath}/transfer/go2RealNameAuthentication">暂未认证，点击申请 &gt;</a></dd></dl>
                                    </c:if>
                                    <c:if test="${!empty user.userRealName}">
                                        <dl id="real-name1"><dt>实名认证</dt><dd style="color: #52bc9b">已认证</dd></dl>
                                    </c:if>
                                    <dl><dt>我居住地</dt><dd>${user.userAddress}</dd></dl>
                                    <dl><dt>毕业院校</dt><dd>${user.userSchool}</dd></dl>
                                    <dl><dt>工作经验</dt><dd>${user.userWorkExperience}</dd></dl>
                                </div>
                                <!--******************隐藏***************-->
                                <div class="info-box info-edit-box" style="display: none">

                                </div>
                                <script type="text/javascript">
                                    function transfer2Edit() {
                                        document.getElementById("id-edit").style.display="none";
                                        document.getElementsByClassName("info-box")[0].style.display="none";
                                        document.getElementById("id-save").style.display="block";
                                        document.getElementById("id-cancel").style.display="block";
                                        document.getElementsByClassName("info-edit-box")[0].style.display="block";
                                        document.getElementsByClassName("info-edit-box")[0].innerHTML="";
                                        if(realName!=null&&realName!="") {
                                            document.getElementsByClassName("info-edit-box")[0].innerHTML += "<dl>\n" +
                                                "                                        <dt>我的昵称</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userName\" value=\"${user.userName}\" class=\"input-text\" id=\"user-name\"/>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我的性别</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <a href=\"javascript:void(0);\" onclick=\"checkBoy()\" class=\"boy\" id=\"boy\">男生</a>\n" +
                                                "                                            <a href=\"javascript:void(0);\" onclick=\"checkGirl()\" class=\"girl\" id=\"girl\">女生</a>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我的简介</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userSpare\" value=\"${user.userSpare}\" class=\"input-text\" id=\"user-spare\" placeholder=\"中文9个英文字母17个哦..\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>实名认证</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <a style=\"color: #52bc9b;\">已认证</a>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我居住地</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userAddress\" value=\"${user.userAddress}\" class=\"input-text\" id=\"user-address\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>毕业院校</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userSchool\" value=\"${user.userSchool}\" class=\"input-text\" id=\"user-school\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl id=\"work-exp\">\n" +
                                                "                                        <dt>工作经验</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <textarea name=\"userWorkExperience\" id=\"user-exp\" cols=\"38\" rows=\"5\">${user.userWorkExperience}</textarea>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>";
                                        }
                                        if(realName==""||realName==null){
                                            document.getElementsByClassName("info-edit-box")[0].innerHTML += "<dl>\n" +
                                                "                                        <dt>我的昵称</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userName\" value=\"${user.userName}\" class=\"input-text\" id=\"user-name\"/>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我的性别</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <a href=\"javascript:void(0);\" onclick=\"checkBoy()\" class=\"boy\" id=\"boy\">男生</a>\n" +
                                                "                                            <a href=\"javascript:void(0);\" onclick=\"checkGirl()\" class=\"girl\" id=\"girl\">女生</a>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我的简介</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userSpare\" value=\"${user.userSpare}\" class=\"input-text\" id=\"user-spare\" placeholder=\"中文9个英文字母17个哦..\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>实名认证</dt>\n" +
                                                "                                            <dd>\n" +
                                                "                                                <a href=\"${pageContext.request.contextPath}/transfer/go2RealNameAuthentication\" style=\"color: #52bc9b;\">暂未认证，点击认证 &gt;</a>\n" +
                                                "                                            </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>我居住地</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userAddress\" value=\"${user.userAddress}\" class=\"input-text\" id=\"user-address\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl>\n" +
                                                "                                        <dt>毕业院校</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <input type=\"text\" name=\"userSchool\" value=\"${user.userSchool}\" class=\"input-text\" id=\"user-school\">\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>\n" +
                                                "                                    <dl id=\"work-exp\">\n" +
                                                "                                        <dt>工作经验</dt>\n" +
                                                "                                        <dd>\n" +
                                                "                                            <textarea name=\"userWorkExperience\" id=\"user-exp\" cols=\"38\" rows=\"5\">${user.userWorkExperience}</textarea>\n" +
                                                "                                        </dd>\n" +
                                                "                                    </dl>";
                                        }
                                        if(sessionGender=='男生'){
                                            document.getElementById("boy").style.backgroundColor="#00bfff";
                                        }
                                        if(sessionGender=='女生'){
                                            document.getElementById("girl").style.backgroundColor="#e773a3";
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>
</html>
