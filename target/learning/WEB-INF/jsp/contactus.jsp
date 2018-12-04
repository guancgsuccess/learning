<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/10
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-联系我们</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactus.css">
</head>
<body>
<%@include file="head.jsp"%>

<div id="aboutus">
    <div id="aboutus_blank_top"></div>
    <div id="aboutus_content">
        <div id="aboutus_left">
            <ul>
                <li><a href="${pageContext.request.contextPath}/aboutus">关于我们</a></li>
                <li><a href="${pageContext.request.contextPath}/commonproblem">常见问题</a></li>
                <li><a href="">企业服务</a></li>
                <li><a href="${pageContext.request.contextPath}/friendlylink">友情链接</a></li>
                <li><a href="">意见反馈</a></li>
                <li class="selected"><a href="${pageContext.request.contextPath}/contactus">联系我们</a></li>
                <li><a href="">加入我们</a></li>
                <li><a href="${pageContext.request.contextPath}/disclaimer">免责声明</a></li>
            </ul>
        </div>
        <div id="aboutus_right">
            <h1>联系我们</h1>
            <div class="aboutus-content-box">
                <div class="module-box">
                    <div class="module-head clearfix"><h2>市场合作</h2></div>
                    <div class="module-body">
                        <div class="contact-mod">
                            <p>电子邮箱：dlgwork@aliyun.com</p>
                            <p>固定电话：15770876849</p>
                        </div>
                    </div>
                </div>
                <div class="module-box">
                    <div class="module-head clearfix"><h2>ACM校赛合作</h2></div>
                    <div class="module-body">
                        <div class="contact-mod">
                            <p>联系方式：（QQ）2461629979，备注校赛合作</p>
                        </div>
                    </div>
                </div>
                <div class="module-box">
                    <div class="module-head clearfix"><h2>企业服务</h2></div>
                    <div class="module-body">
                        <div class="contact-mod">
                            <p>电子邮箱：dlgwork@aliyun.com</p>
                            <p>固定电话：15770876849</p>
                        </div>
                    </div>
                </div>
                <div class="module-box">
                    <div class="module-head clearfix"><h2>其他合作</h2></div>
                    <div class="module-body">
                        <div class="contact-mod">
                            <p>电子邮箱：dlgwork@aliyun.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="aboutus_blank_footer"></div>
</div>

<%@include file="footer.jsp"%>
</body>
</html>
