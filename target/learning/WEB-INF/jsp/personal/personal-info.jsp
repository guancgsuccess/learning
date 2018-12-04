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
    <title>个人中心首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/personal-info.css">
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
</head>
<body>
            <div id="personal-info">
                <div class="main-bottom-right" style="background-color: #fff;">
                    <div class="main-bottom-content">
                        <div class="paw-mod">
                            <div class="paw-mod-detail">
                                <div class="paw-mod-top">
                                    <h4><a>成就值</a></h4>
                                    <span>${infoMap.correctCount}</span>
                                </div>
                                <div class="paw-mod-bottom">
                                    <ul class="web-statistics">
                                        <li><p class="ws-num">0</p><p>次采纳</p></li>
                                        <li><p class="ws-num">0</p><p>次赞同</p></li>
                                        <li><p class="ws-num">${infoMap.correctCount}</p><p>题正确</p></li>
                                        <li><p class="ws-num">0</p><p>编程通过</p></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="paw-mod">
                            <div class="paw-mod-detail">
                                <div class="paw-mod-top">
                                    <h4><a>我的评论</a></h4>
                                    <span>${infoMap.commentCount}</span>
                                </div>
                                <div class="paw-mod-bottom">
                                    <div class="latest-reviews">
                                        <label style="font-size: 15px;font-weight: bold;margin-left: 10px;">最近评论：</label>
                                        <p style="color: #00bc9b;font-size: 14px;margin-left: 10px;margin-right: 10px">&nbsp;&nbsp;&nbsp;&nbsp;${infoMap.commentContent}</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="paw-mod">
                            <div class="paw-mod-detail">
                                <div class="paw-mod-top">
                                    <h4><a>我的收藏</a></h4>
                                    <span>${infoMap.collectionCount}</span>
                                </div>
                                <div class="paw-mod-bottom">
                                    <label style="font-size: 15px;font-weight: bold;margin-left: 10px;">最近新添收藏标签：</label>
                                    <div style="width: 100%;height: 70%;">
                                        <c:forEach var="tagName" items="${infoMap.tagNames}">
                                            <span style="width: 25%;float: left;text-align: center;color: #DAA520">${tagName}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="paw-mod">
                            <div class="paw-mod-detail">
                                <div class="paw-mod-top">
                                    <h4><a>我的工作经验</a></h4>
                                </div>
                                <div class="paw-mod-bottom">
                                    <label style="font-size: 15px;font-weight: bold;margin-left: 10px;">工作简介：</label>
                                    <p style="color: #00bc9b;font-size: 14px;margin-left: 10px;margin-right: 10px">&nbsp;&nbsp;&nbsp;&nbsp;${infoMap.workexp}</p>
                                </div>
                            </div>
                        </div>

                        <%--<div class="skill">--%>
                            <%--<div class="skill-detail"></div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>

</body>
</html>
