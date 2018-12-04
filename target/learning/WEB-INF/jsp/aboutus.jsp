<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/10
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网—关于我们</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css">
</head>
<body>
    <%@include file="head.jsp"%>

    <div id="aboutus">
        <div id="aboutus_blank_top"></div>
        <div id="aboutus_content">
            <div id="aboutus_left">
                <ul>
                    <li class="selected"><a href="${pageContext.request.contextPath}/aboutus">关于我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/commonproblem">常见问题</a></li>
                    <li><a href="">企业服务</a></li>
                    <li><a href="${pageContext.request.contextPath}/friendlylink">友情链接</a></li>
                    <li><a href="">意见反馈</a></li>
                    <li><a href="${pageContext.request.contextPath}/contactus">联系我们</a></li>
                    <li><a href="">加入我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/disclaimer">免责声明</a></li>
                </ul>
            </div>
            <div id="aboutus_right">
                <h1>关于我们</h1>
                <div class="aboutus-content-box">
                    <div class="aboutus-content-banner">
                        <img src="//static.nowcoder.com/images/res/us/nkFamily.jpg" width="650" height="250" alt="乐宁大家庭">
                    </div>
                    <div class="aboutus-content-txt">
                        <p>乐宁网成立于 2018 年 10 月 1 日，是以科技和创新为宗旨的教育科技公司。乐宁网坚持以前沿技术服务于技术、以人工智能和大数据提升学习效率，专注探索在线教育创新模式，致力于为技术求职者提供能力提升解决方案，同时为企业级用户提供更高效的招聘解决方案，并为二者搭建桥梁，构建从学习到职业的良性生态圈。</p>
                        <p>发展至今，乐宁网在技术类求职备考、社群交流、企业招聘服务等多个垂直领域皆有涉猎，产品矩阵包括IT题库、在线编程练习、交流社区、竞赛平台、笔面试服务等，用户覆盖全国高校百万IT学习者并在高速增长中，同时也为京东、百度、腾讯、滴滴、今日头条、华为等200多家企业提供校园招聘、编程竞赛等线上服务，并收获良好口碑。</p>
                        <p>新浪微博：@乐宁网</p>
                        <p>微信公众账号：www_learning_com</p>
                        <p>企业商务咨询：15770876849</p>
                        <p>用户问题咨询：15770876849</p>
                        <p>邮箱地址：dlgwork@aliyun.com</p>
                    </div>
                </div>
            </div>
        </div>
        <div id="aboutus_blank_footer"></div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
