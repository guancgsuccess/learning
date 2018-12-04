<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/20
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>main-bottom-left</title>
    <script src="${pageContext.request.contextPath}/js/navigation_bar.js"></script>
</head>
<body>
<!--左边导航栏（完美）-->
<div class="main-bottom-left">
    <ul class="profile-menu">
        <li><a href="javascript:void(0);" onclick="go2PersonalInfo()"><img src="${pageContext.request.contextPath}/image/首页.png"><span>首页</span><img src="${pageContext.request.contextPath}/image/右边.png"></a></li>
        <li><a href="javascript:void(0);" onclick="go2BrushQuestion()"><img src="${pageContext.request.contextPath}/image/刷题.png"><span>刷题</span><img src="${pageContext.request.contextPath}/image/右边.png"></a></li>
        <li><a href="javascript:void(0);" onclick="go2Collection()"><img src="${pageContext.request.contextPath}/image/收藏.png"><span>收藏</span><img src="${pageContext.request.contextPath}/image/右边.png"></a></li>
        <li><a href="javascript:void(0);" onclick="go2BasicInfo()"><img src="${pageContext.request.contextPath}/image/基本资料.png"><span>基本资料</span><img src="${pageContext.request.contextPath}/image/右边.png"></a></li>
        <%--<li><a href="${pageContext.request.contextPath}/transfer/go2Resume"><img src="${pageContext.request.contextPath}/images/简历.png"><span>我的简历</span><img src="${pageContext.request.contextPath}/images/右边.png"></a></li>--%>
        <li><a href="javascript:void(0);" onclick="go2Setting()"><img src="${pageContext.request.contextPath}/image/设置.png"><span>设置</span><img src="${pageContext.request.contextPath}/image/右边.png"></a></li>
    </ul>
</div>
</body>
</html>
