<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/9
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>head</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css">
</head>
<body>
    <div id="head">
        <div id="content">
            <div id="left">
                <ul>
                    <li id="left-1">乐宁网</li>
                    <li id="left-2">LEARNING</li>
                </ul>
            </div>
            <div id="right">
                <ul id="nav">
                    <li><a href="${pageContext.request.contextPath}/homepage">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/question-company">题库</a></li>
                    <li><a href="${pageContext.request.contextPath}/recruitment/selectAllRecruitment/1">招聘</a></li>
                    <li><a href="${pageContext.request.contextPath}/test/selectAllCompany/1">笔试</a></li>
                    <li><a href="${pageContext.request.contextPath}/company_login" target="_blank">企业</a></li>
                    <c:if test="${user!=null}">
                        <li><a href="${pageContext.request.contextPath}/user/logout">退出登录</a></li>
                    </c:if>

                </ul>
                <c:choose>
                    <c:when test="${user==null}">
                        <div>
                            <sapn><a id="login_register" href="${pageContext.request.contextPath}/login">登录/注册</a></sapn>
                        </div>
                        <div id="goto">
                            <span>好神奇哟，这里可以登陆注册呢==》</span>
                        </div>
                    </c:when>
                    <c:when test="${user!=null}">
                        <div id="after_login_wrapper">
                            <div id="after_login">
                                <a href="${pageContext.request.contextPath}/user/personal/showInfo/${user.userId}" class="nav-profile">
                                    <div class="img-box">
                                        <%--<img src="https://images.nowcoder.com/images/20180804/861989627_1533349295344_7C2C60506876716CCF0E706DB13D4511@0e_100w_100h_0c_1i_1o_90Q_1x">--%>
                                        <img src="${pageContext.request.contextPath}/image/${user.userImage}" alt="">
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div id="goto">
                            <span>点击头像去完善信息吧==》</span>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <div id="head_blank"></div>

</body>
</html>
