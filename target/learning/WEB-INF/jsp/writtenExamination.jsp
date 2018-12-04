<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: meteor
  Date: 2018/10/17
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="string" class="java.lang.String"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>笔试</title>
    <link href="../../image/试卷.png" rel="icon" type="image/x-ico">
    <link rel="stylesheet" href="../../css/writtenExamination.css">
    <script src="../../js/writtenExamination.js"></script>
</head>
<body onload="timing()">
    <%@include file="head.jsp"%>
    <div id="testPaper">
        <div id="test_time">
            <div id="test_part1">
                <div id="progress">
                    <div id="progress_bar" style="width: ${(i + 1) * 100 / questionBankList.size()}%"></div>
                </div>
                <span id="test_schedule">${i + 1}/${questionBankList.size()}</span>
            </div>
            <div id="test_time1"></div>
        </div>
        <div id="testPaper_context">
            <div id="testPaper_topic"><span>${i + 1}、${questionBankList.get(i).questionContext}</span></div>
            <a onclick="radio(this)" class="option" id="optionA"x>
                <c:if test="${answer == 'A'}">
                    <span class="icons test"></span>
                </c:if>
                <c:if test="${answer != 'A'}">
                    <span class="icons"></span>
                </c:if>
                <input type="radio" style="display: none" value="A">
                <pre>${questionBankList.get(i).questionOptiona}</pre>
            </a>
            <a onclick="radio(this)" class="option" id="optionB">
                <c:if test="${answer == 'B'}">
                    <span class="icons test"></span>
                </c:if>
                <c:if test="${answer != 'B'}">
                    <span class="icons"></span>
                </c:if>
                <input type="radio" style="display: none" value="B">
                <pre>${questionBankList.get(i).questionOptionb}</pre>
            </a>
            <a onclick="radio(this)" class="option" id="optionC">
                <c:if test="${answer == 'C'}">
                    <span class="icons test"></span>
                </c:if>
                <c:if test="${answer != 'C'}">
                    <span class="icons"></span>
                </c:if>
                <input type="radio" style="display: none" value="C">
                <pre>${questionBankList.get(i).questionOptionc}</pre>
            </a>
            <a onclick="radio(this)" class="option" id="optionD">
                <c:if test="${answer == 'D'}">
                    <span class="icons test"></span>
                </c:if>
                <c:if test="${answer != 'D'}">
                    <span class="icons"></span>
                </c:if>
                <input type="radio" style="display: none" value="D">
                <pre>${questionBankList.get(i).questionOptiond}</pre>
            </a>
        </div>
        <div id="testPaper_operating">
            <c:if test="${i < questionBankList.size()-1}">
                <input id="next" type="submit" name="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/test/selectCompanyPaper/${companyId}&${i + 1}&' + document.getElementsByClassName('icons test')[0].nextElementSibling.value" value="下一题">
            </c:if>
            <c:if test="${i != 0}">
                <input id="previous" type="submit" name="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/test/selectCompanyPaper/${companyId}&${i - 1}&previous'" value="上一题">
            </c:if>
            <c:if test="${i < questionBankList.size()-1}">
                <input id="aheadFinish" type="submit" name="button" class="btn warning-btn" onclick="popUps()" value="提前交卷">
            </c:if>
            <c:if test="${i == questionBankList.size()-1}">
                <input id="finish" type="submit" name="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/test/earlyDelivery/${companyId}&${i}&' + document.getElementsByClassName('icons test')[0].nextElementSibling.value" value="交卷">
            </c:if>
        </div>
    </div>
    <%@include file="footer.jsp"%>
</body>
<script>
    var wConfirm = window.confirm;
    window.confirm = function (message) {
        try {
            var iframe = document.createElement("IFRAME");
            iframe.style.display = "none";
            iframe.setAttribute("src", 'data:text/plain,');
            document.documentElement.appendChild(iframe);
            var alertFrame = window.frames[0];
            var iwindow = alertFrame.window;
            if (iwindow == undefined) {
                iwindow = alertFrame.contentWindow;
            }
            var result = iwindow.confirm(message);
            iframe.parentNode.removeChild(iframe);
            return result;
        }
        catch (exc) {
            return wConfirm(message);
        }
    }
    function popUps() {
        var answer;
        var options = document.getElementsByClassName("option");
        for (var i = 0; i < options.length; i++) {
            if (options[i].children[0].className == "icons test") {
                answer = options[i].children[1].value;
            }
        }
        var url = "${pageContext.request.contextPath}/test/earlyDelivery/${companyId}&${i}&" + answer;
        var flag = confirm("确定要提前交卷吗？");
        if (flag == true) {
            window.location.href = url;
        }
    }


    if ("start" == "${index}") {
        index = document.cookie.split("；")[0].split("=")[1].split(";")[0];
    }else {
        index = ${questionBankList.size()} * 3 * 60;
        document.getElementById("test_time1").innerText = "00:00:00"
    }
    function timing() {
        var hour = "0" + 1;
        var minute = null;
        var second = null;
        timer = setInterval(function () {
            if ((index % 3600) != 0){
                hour = "0" + 0;
            }
            if (hour == "01"){
                minute = "0" + 0;
            }else if (Math.floor(index / 60) >= 1) {
                minute = Math.floor(index / 60);
                if (minute < 10){
                    minute = "0" + minute;
                }
            }else {
                minute = "0" + 0;
            }
            if (minute == "00" && index >=60){
                second = "00";
            } else {
                second = index % 60;
                if (second < 10){
                    second = "0" + second;
                }
            }
            document.getElementById("test_time1").innerText = hour + ":" + minute + ":" + second;
            if (index <= 0) {
                clearInterval(timer);
                var answer;
                var options = document.getElementsByClassName("option");
                for (var i = 0; i < options.length; i++) {
                    if (options[i].children[0].className == "icons test") {
                        answer = options[i].children[1].value;
                    }
                }
                var url = "${pageContext.request.contextPath}/test/earlyDelivery/${companyId}&${i}&" + answer;
                window.location.href = url;
            }
            document.cookie="index="+index;
            index--;
        },1000)
    }
</script>
</html>
