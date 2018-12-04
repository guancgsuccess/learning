<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/31
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question_datails.css">
    <script src="${pageContext.request.contextPath}/js/wrong-set.js"></script>
</head>
<body style="background-color: #f4f4f4">
<%@include file="../head.jsp"%>
<div class="show-question-details">
    <div id="question_details">
        <div id="question_details_title">
            [单选题]
        </div>
        <div id="question_details_head">
            <div id="question_topic">
                <input type="hidden" value="${user.userId}" id="user-id-hidden">
                <span id="question-detail-title">${detailMap.questionContext}</span>
                <ul>
                    <li><pre class="none" id="question-detail-answer-A">${detailMap.questionOptiona}</pre></li>
                    <li><pre class="none" id="question-detail-answer-B">${detailMap.questionOptionb}</pre></li>
                    <li><pre class="none" id="question-detail-answer-C">${detailMap.questionOptionc}</pre></li>
                    <li><pre class="none" id="question-detail-answer-D">${detailMap.questionOptiond}</pre></li>
                </ul>
            </div>
            <div>
                <a onclick="showAnswer(this)" class="btn btn-primary nc-req-auth nc-req-complete" id="showAnswer">查看正确选项</a>
                <div id="question_answer">
                    正确答案：<span id="question-detail-answer-correct">${detailMap.questionAnswer}</span>
                </div>
            </div>

        </div>
        <div id="question_details_menu">
        </div>
        <div id="comments">
            <c:forEach var="comment" items="${detailMap.comments}">
                <div class="comment">
                    <div class="comment-body" style="width: 100%;height: 70%;box-sizing: border-box;border-bottom: 1px solid #999999;">
                        <div class="comment-body-main" style="width: 95%;height: 100%;margin: auto;">
                            <p style="margin-top: 5px">${comment.commentContent}</p>
                        </div>
                    </div>
                    <div class="comment-detail" style="width: 100%;height: 27%;">
                        <div class="comment-user" style="margin-top: 5px;font-size: 15px;color: #00b091">用户：${detailMap.userNameMap.get(comment.commentUserId)}</div>
                        <div class="comment-time" style="color: #999999;font-size: 14px;margin-top: 4px;">发表于：<fmt:formatDate value="${comment.commentTime}" type="both"></fmt:formatDate></div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div id="module-box">
            <textarea type="text" id="question_comment_submit"></textarea>
            <a class="btn btn-primary editor-btn click-pub-point" id="submit_comment" href="javascript:void(0);" onclick="submitComment(${detailMap.questionId})">提交观点</a>
        </div>
    </div>
</div>

<%@include file="../footer.jsp"%>
<script type="text/javascript">
    var url_submit_comment="${pageContext.request.contextPath}/brushQuestion/postComment";
    /**
     * 查看题目答案
     * @param show
     */
    function showAnswer(show) {
        var part = document.getElementById("question_answer");
        show.style.display = "none";
        part.style.display = "block";
    }
    // var comment = document.getElementsByClassName("comment");
    // comment[comment.length-1].style.borderColor = "#FFF";
    function submitComment(obj) {
        var sessionUserId=document.getElementById("user-id-hidden").value;
        var commentContent=document.getElementById("question_comment_submit").value;
        var formData="commentUserId="+sessionUserId+"&commentContent="+commentContent+"&commentQuestionId="+obj;
        if(window.XMLHttpRequest){
            xhr=new XMLHttpRequest();
        }else {
            xhr=new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("POST",url_submit_comment,true);
        xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
        xhr.onreadystatechange=loadComments;
        xhr.send(formData);

    }

    function loadComments() {
        if(xhr.readyState==4&&xhr.status==200){
            //清空发言区的内容
            document.getElementById("question_comment_submit").value="";
            //获得题目详细信息
            var detailMap=JSON.parse(xhr.responseText);
            //取出详细信息里面的内容
            //获得该题目的题目内容
            var questionContext=detailMap.questionContext;
            //获得该题目的题目正确答案
            var questionAnswer=detailMap.questionAnswer;
            //获得该题目的A选型
            var questionOptiona=detailMap.questionOptiona;
            //获得该题目的B选型
            var questionOptionb=detailMap.questionOptionb;
            //获得该题目的C选型
            var questionOptionc=detailMap.questionOptionc;
            //获得该题目的D选型
            var questionOptiond=detailMap.questionOptiond;
            //获得用户id和姓名相对应的Map
            var userNameMap=detailMap.userNameMap;
            //获得所有评论集合
            var comments=detailMap.comments;
            document.getElementById("question-detail-title").innerText=questionContext;
            document.getElementById("question-detail-answer-A").innerText=questionOptiona;
            document.getElementById("question-detail-answer-B").innerText=questionOptionb;
            document.getElementById("question-detail-answer-C").innerText=questionOptionc;
            document.getElementById("question-detail-answer-D").innerText=questionOptiond;
            document.getElementById("question-detail-answer-correct").innerText=questionAnswer;
            var commentsBody=document.getElementById("comments");
            commentsBody.innerHTML="";
            for(var i=0;i<comments.length;i++) {
                //每条评论
                var comment=comments[i];
                //评论内容
                var commentContent=comment.commentContent;
                //评论用户id
                var commentUserId=comment.commentUserId;
                //评论时间
                var commentTime=ConvertJSONDateToJSDateObject(comment.commentTime);
                //根据评论用户id获得评论人的网名
                var userName=userNameMap[commentUserId];
                commentsBody.innerHTML +="<div class=\"comment\">\n" +
                    "            <div class=\"comment-body\" style=\"width: 100%;height: 70%;box-sizing: border-box;border-bottom: 1px solid #999999;\">\n" +
                    "                <div class=\"comment-body-main\" style=\"width: 95%;height: 100%;margin: auto;\">\n" +
                    "                    <p style=\"margin-top: 5px\">"+commentContent+"</p>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "            <div class=\"comment-detail\" style=\"width: 100%;height: 27%;\">\n" +
                    "                <div class=\"comment-user\" style=\"margin-top: 5px;font-size: 15px;color: #00b091\">用户："+userName+"</div>\n" +
                    "                <div class=\"comment-time\" style=\"color: #999999;font-size: 14px;margin-top: 4px;\">发表于："+commentTime+"</div>\n" +
                    "            </div>\n" +
                    "        </div>";
            }
        }
    }

    //转换json格式时间的方法 如Date(1340239979000)转换为正常
    function ConvertJSONDateToJSDateObject(JSONDateString) {
        var date = new Date(JSONDateString);
        var year = date.getFullYear();
        var month = date.getMonth + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        var datastr = year + "-" + month + "-" + currentDate + " " + hour + ":" + minute + ":" + second;
        return datastr;
    }
</script>
</body>
</html>
