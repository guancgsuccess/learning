<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/10
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-友情链接</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
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
                    <li class="selected"><a href="${pageContext.request.contextPath}/friendlylink">友情链接</a></li>
                    <li><a href="">意见反馈</a></li>
                    <li><a href="${pageContext.request.contextPath}/contactus">联系我们</a></li>
                    <li><a href="">加入我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/disclaimer">免责声明</a></li>
                </ul>
            </div>
            <div id="aboutus_right">
                <h1>友情链接</h1>
                <div class="aboutus-content-box">
                    <div class="aboutus-content-txt">
                        <!-- 读取后台配置-->
                        <p>it面试网  <a href="http://www.itmian4.com" target="_blank">www.itmian4.com</a></p>
                        <p>人人都是产品经理  <a href="http://www.woshipm.com" target="_blank">www.woshipm.com</a></p>
                        <p>萌码  <a href="http://www.mengma.com" target="_blank">www.mengma.com</a></p>
                        <p>PHP开发学习门户  <a href="http://www.phpthinking.com" target="_blank">www.phpthinking.com</a></p>
                        <p>哪上班  <a href="http://www.nashangban.com" target="_blank">www.nashangban.com</a></p>
                        <p>实验楼  <a href="http://www.shiyanlou.com" target="_blank">www.shiyanlou.com</a></p>
                        <p>汇智网  <a href="http://www.hubwiz.com" target="_blank">www.hubwiz.com</a></p>
                        <p>OurCoders  <a href="http://ourcoders.com" target="_blank">ourcoders.com</a></p>
                        <p>程序员客栈  <a href="http://www.proginn.com" target="_blank">www.proginn.com</a></p>
                        <p>我赢职场  <a href="http://www.wyzc.com" target="_blank">www.wyzc.com</a></p>
                        <p>天码营  <a href="http://tianmaying.com" target="_blank">tianmaying.com</a></p>
                        <p>Leangoo敏捷工具  <a href="http://www.leangoo.com" target="_blank">www.leangoo.com</a></p>
                        <p>乐视云  <a href="http://www.lecloud.com" target="_blank">www.lecloud.com</a></p>
                        <p>小牛学堂  <a href="http://www.edu360.cn" target="_blank">www.edu360.cn</a></p>
                        <p>王道论坛  <a href="http://www.cskaoyan.com/forum.php" target="_blank">www.cskaoyan.com/forum.php</a></p>
                        <p>一路捞  <a href="http://www.16lao.com" target="_blank">www.16lao.com</a></p>
                        <p>安全网址导航  <a href="http://www.duba.com" target="_blank">www.duba.com</a></p>
                        <p>360安全浏览器  <a href="http://browser.360.cn" target="_blank">browser.360.cn</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div id="aboutus_blank_footer"></div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
