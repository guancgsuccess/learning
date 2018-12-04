<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/27
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html id="html">
<head>
    <title>个人中心</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person-common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit-collection.css">
    <script src="${pageContext.request.contextPath}/js/brush-questions.js"></script>
    <script src="${pageContext.request.contextPath}/js/navigation_bar.js"></script>
    <script src="${pageContext.request.contextPath}/js/collection-question.js"></script>
    <script src="${pageContext.request.contextPath}/js/basic-information.js"></script>
    <script src="${pageContext.request.contextPath}/js/setting.js"></script>
    <script src="${pageContext.request.contextPath}/js/online-set1.js"></script>
    <script src="${pageContext.request.contextPath}/js/wrong-set.js"></script>
    <script src="${pageContext.request.contextPath}/js/edit-collection.js"></script>
</head>
<body style="background-color: #ededed;">
    <div id="click-edit-collection">
        <%--编辑收藏--%>
        <%--<div class="zhezhao" id="zhezhao"></div>--%>
        <%--<div class="collection-edit" id="collection-edit">--%>
            <%--<div class="edit-collection">--%>
                <%--<div class="edit-collection-header">--%>
                    <%--<span id="flag-red"></span>--%>
                    <%--<p>修改收藏</p>--%>
                    <%--<span id="cancel-x" onclick="cancelCollection()"></span>--%>
                <%--</div>--%>
                <%--<div class="edit-collection-body">--%>
                    <%--<div class="edit-tag">--%>
                        <%--<span class="collection-tag"></span>--%>
                        <%--<input type="text" placeholder="输入标签，回车确定" id="input-tag">--%>
                    <%--</div>--%>
                    <%--<div class="edit-collection-body-main">--%>
                        <%--<a href="javascript:void(0);" onclick="changeTagName()" class="change-tag">修改收藏标签</a>--%>
                        <%--<div class="cut-line">--%>
                            <%--<span>或者</span>--%>
                        <%--</div>--%>
                        <%--<a href="javascript:void(0);" onclick="deleteCollection()" class="delete-collection">删除收藏</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>



    <%@include file="head.jsp"%>


    <%--内容--%>
    <div class="content">
        <div class="main">
            <%--主体上方头部--%>
            <%@include file="personal/main-top.jsp"%>

            <%--主体下部分--%>
            <div class="main-bottom">
                <%--个人中心左边导航栏【共有】--%>
                <%@include file="personal/main-bottom-left.jsp"%>

                <%--异步刷新主要区域--%>
                <div id="ajax-personal-info">
                    <%@include file="personal/personal-info.jsp"%>
                </div>

                <div id="ajax-brush-questions" style="display: none;">
                    <%@include file="personal/brush-questions.jsp"%>
                </div>

                <div id="ajax-collection-question" style="display: none;">
                    <%@include file="personal/collection-questions.jsp"%>
                </div>

                <div id="ajax-basic-info" style="display: none;">
                    <%@include file="personal/basic-information.jsp"%>
                </div>

                <div id="ajax-setting" style="display: none;">
                    <%@include file="personal/setting.jsp"%>
                </div>

            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>

    <script type="text/javascript">
        window.onload=function () {
            getSessionUserId(${user.userId});
            getSessionGender("${user.userGender}");
            getSessionUserRealName("${user.userRealName}");
        }
    </script>
</body>
</html>
