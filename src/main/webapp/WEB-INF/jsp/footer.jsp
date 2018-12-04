<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/9
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
   <div id="footer">
        <div id="footer_content">
            <div id="footer-blank"></div>
            <div id="footer_left">
                <div id="app_download">
                    <img src="${pageContext.request.contextPath}/image/app_download.png" alt="">
                    <p>扫一扫，把题目装进口袋</p>
                </div>
                <div id="app_content">
                    <p>乐宁网，程序员必备神器</p>
                </div>
            </div>
            <div id="footer_right">
                <ul class="footer_ul1">
                    <li><a href="${pageContext.request.contextPath}/aboutus">关于我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/commonproblem">常见问题</a></li>
                    <li><a href="">加入我们</a></li>
                    <li><a href="">意见反馈</a></li>
                    <li><a href="">企业服务</a></li>
                    <li><a href="${pageContext.request.contextPath}/contactus">联系我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/disclaimer">免责声明</a></li>
                    <li><a href="${pageContext.request.contextPath}/friendlylink">友情链接</a></li>
                </ul>
                <ul class="footer_ul2">
                    <li>公司地址：暂无</li>
                    <li>联系方式：15770876849(电话)  dlgwork@aliyun.com(邮箱)</li>
                </ul>
            </div>
        </div>
   </div>
</body>
</html>
