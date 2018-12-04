<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/22
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>乐宁网-训练</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-practice.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/question-practice1.js"></script>
</head>
<body>

    <script type="text/javascript">
        var xhr = null;
        function collectQuestionPaper(that) {
            var url_collect_question = '${pageContext.request.contextPath}/questionpaper/collect/'+that;
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",url_collect_question, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = afterCollect;
            xhr.send();
        }
        function afterCollect() {
            if(xhr.readyState==4&&xhr.status==200){
                var result = JSON.parse(xhr.responseText);
                if(result=="1"){
                    document.getElementById("collect-question").innerText = "收藏过了";
                }else if(result=="2"){
                    document.getElementById("collect-question").innerText = "收藏成功";
                }else {
                    document.getElementById("collect-question").innerText = "收藏失败";
                }
            }
        }
        var time = "";
        var second = 0;
        var minute = 0;
        var hour = 0;
        window.onload = function(){
            getUseTime();
        }
        function getUseTime() {
            if(second==60){
                second = 0;
                minute++;
                if(minute==60){
                    minute = 0;
                    hour++;
                }
            }
            second++;
            var hour2 = "";
            var minute2 = "";
            var second2 = "";
            if(second<10){
                second2 = "0"+second;
            }else {
                second2 = second;
            }if(minute<10){
                minute2 = "0"+minute;
            }else {
                minute2 = minute;
            }if(hour<10){
                hour2 = "0"+hour;
            }else {
                hour2 = hour;
            }
            time = hour2+":"+minute2+":"+second2;
            document.getElementById("use-time").value = time;
            window.setTimeout("getUseTime()",1000);
        }
    </script>

    <%@include file="head.jsp"%>

    <div class="practice-wrapper">
        <div class="practice-content">
            <div class="subject-progress">
            </div>
            <div class="subject-title">[单选题]</div>
            <div class="subject-main">
                <div class="subject-content">
                    <% int i = 1;%>
                    <c:forEach items="${questionBanks}" var = "questions">
                        <div class="subject-question">
                            <p>
                                <span><%=i++%>、${questions.questionContext}</span>
                            </p>
                        </div>
                        <a href="javascript:void(0)" class="subject-options" data-id="94276">
                            <label class="radio" id="jsCpn_2_checkbox_0">
                                <span class="icons" name='span<%=i-1%>' onclick="choiceAnswer(this)" ></span>
                                <input type="radio" data-toggle="radio" value="94276">
                                <pre>${questions.questionOptiona}</pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options" data-id="94277">
                            <label class="radio" id="jsCpn_3_checkbox_1">
                                <span class="icons" name='span<%=i-1%>' onclick="choiceAnswer(this)" ></span>
                                <input type="radio" data-toggle="radio" value="94277">
                                <pre>${questions.questionOptionb}</pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options" data-id="94278">
                            <label class="radio" id="jsCpn_4_checkbox_2">
                                <span class="icons" name='span<%=i-1%>' onclick="choiceAnswer(this)" ></span>
                                <input type="radio" data-toggle="radio" value="94278">
                                <pre>${questions.questionOptionc}</pre>
                            </label>
                        </a>
                        <a href="javascript:void(0);" class="subject-options" data-id="94279">
                            <label class="radio" id="jsCpn_5_checkbox_3">
                                <span class="icons" name='span<%=i-1%>' onclick="choiceAnswer(this)" ></span>
                                <input type="radio" data-toggle="radio" value="94279">
                                <pre>${questions.questionOptiond}</pre>
                            </label>
                        </a>
                    </c:forEach>
                </div>
                <div class="subject-action clearfix">
                    <c:choose>
                        <c:when test="${user!=null}">
                            <div class="subject-opr">
                                <span  class="subject-opr-item"><i class="ico-collect"></i><a href="javascript:collectQuestionPaper(${questionPaperId});" class="js-follow nc-req-auth" data-id="62852" id="collect-question">收藏本试卷</a></span>
                                <%--<span class="subject-opr-item"><i class="ico-mark"></i><a href="javascript:void(0);" class="js-mark nc-req-auth" data-id="62852" data-tid="19583406" data-title="标记该题，着重查看。" data-tips-index="2">标记一下</a></span>
                                <span class="subject-opr-item"><i class="ico-shield"></i><a href="javascript:void(0);" class="js-shield nc-req-auth" data-id="62852" data-title="屏蔽该题，该题将不会出现在以后的组卷中。" data-tips-index="1">屏蔽本试卷</a></span>--%>
                            </div>
                        </c:when>
                        <c:when test="${user==null}">
                            <div class="subject-opr">
                                <span class="subject-opr-item"><i class="ico-collect"></i><a href="${pageContext.request.contextPath}/login" class="js-follow nc-req-auth" data-id="62852">登录后可收藏本试卷</a></span>
                                <%--<span class="subject-opr-item"><i class="ico-mark"></i><a href="${pageContext.request.contextPath}/login" class="js-mark nc-req-auth" data-id="62852" data-tid="19583406" data-title="标记该题，着重查看。" data-tips-index="2">登录后可标记一下</a></span>
                                <span class="subject-opr-item"><i class="ico-shield"></i><a href="${pageContext.request.contextPath}/login" class="js-shield nc-req-auth" data-id="62852" data-title="屏蔽该题，该题将不会出现在以后的组卷中。" data-tips-index="1">登录后可屏蔽本试卷</a></span>--%>
                            </div>
                        </c:when>
                    </c:choose>

                    <div class="subject-next">
                        <form id="submitForm" method="post" action="">
                            <input id="use-time" type="button" name="button" class="btn btn-primary" value="用时">
                            <input type="hidden" id='${questionNum}' name="content" id="answer">
                            <input id="aheadFinish" type="button" onclick="getAnswer(this)" name="button" class="btn btn-primary" value="交卷">
                            <input type="hidden" id='${questionPaperId}' name="content" id="answer">
                            <%--<input id="last" type="submit" name="button" class="btn warning-btn" value="">
                            <input id="next" type="submit" name="button" class="btn warning-btn" value="">--%>
                            <%--<input id="aheadFinish" type="submit" name="button" class="btn btn-primary" value="交卷">--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>

</body>
</html>
