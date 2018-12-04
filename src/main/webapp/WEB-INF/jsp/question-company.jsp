<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/18
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-题库</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-company.css">
</head>
<body>

    <script type="text/javascript">
        var url_getquestionlist = '${pageContext.request.contextPath}/questionpaper/all';
        var url_getquestionlistbylanguage = '${pageContext.request.contextPath}/questionpaper/all/page/language/';
        var url_getquestionlistbycompany = '${pageContext.request.contextPath}/questionpaper/all/page/company/';
        var url_getquestionlistbytime = '${pageContext.request.contextPath}/questionpaper/all/page/time/';
        window.onload=function() {
            refreshQuestion(url_getquestionlist);
        }
        //加载数据
        var xhr = null;

        function getQuestionByLanguage(that) {
            var url_language = "";
            var url_language2 = "";
            if(that.indexOf("questionpaper")>0){
                url_language = that;
                url_language2 = url_language.substr(0,url_language.length-2);
            }else {
                url_language = url_getquestionlistbylanguage+that;
                url_language2 = url_language;
            }
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",url_language, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = function(){loadQuestionByLanguage(url_language2)};
            xhr.send();
        }

        function getQuestionByTime(that) {
            var url_time = "";
            var url_time2 = "";
            if(that.indexOf("questionpaper")>0){
                url_time = that;
                url_time2 = url_time.substr(0,url_time.length-2)
            }else {
                url_time = url_getquestionlistbytime+that;
                url_time2 = url_time;
            }
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",url_time, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = function(){loadQuestionByTime(url_time2)};
            xhr.send();
        }

        function getQuestionByCompany(that) {
            var url_company = "";
            var url_company2 = "";
            if(that.indexOf("questionpaper")>0){
                url_company = that;
                url_company2 = url_company.substr(0,url_company.length-2);
            }else {
                url_company = url_getquestionlistbycompany+that;
                url_company2 = url_company;
            }
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",url_company, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = function(){loadQuestionByCompany(url_company2)};
            xhr.send();
        }

        function refreshQuestion(that) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",that, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = loadQuestion;
            xhr.send();
        }
        function loadQuestion() {
            if (xhr.readyState == 4 && xhr.status == 200) {
               var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result.modelList;
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    var li1 = document.createElement("li");
                    var a1 = document.createElement("a");
                    a1.setAttribute("href","${pageContext.request.contextPath}/questionpaper/test/"+objArr[i].questionPaperId);
                    li1.appendChild(a1);
                    tbody.appendChild(li1);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","content-item-brief");
                    a1.appendChild(div1);
                    var h1 = document.createElement("h1");
                    h1.innerText = objArr[i].questionPaperTitle;
                    div1.appendChild(h1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","web-logoimg");
                    div1.appendChild(div2);
                    var img1 = document.createElement("img");
                    img1.setAttribute("src","https://static.nowcoder.net/images/weblogo/gray_logo/40.png");
                    div2.appendChild(img1);
                    var div3 = document.createElement("div");
                    div3.setAttribute("class","exam-foot");
                    div3.innerText = "";
                    div1.appendChild(div3);
                    var dl1 = document.createElement("dl");
                    dl1.setAttribute("class","exam-info");
                    div1.appendChild(dl1);
                    var dd1 = document.createElement("dd");
                    dl1.appendChild(dd1);
                    var span1 = document.createElement("span");
                    span1.setAttribute("class","link-green");
                    span1.innerText = "共27道题";
                    dd1.appendChild(span1);
                    var dd2 = document.createElement("dd");
                    dd2.setAttribute("class","exam-btn");
                    dl1.appendChild(dd2);
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","btn  btn-block btn-primary")
                    span2.innerText = "查看详情";
                    dd2.appendChild(span2);
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                //首页
                var url_first_page = url_getquestionlist+"/page/"+1;
                var href1 =  'javascript:refreshQuestion("'+url_first_page+'")';
                var li4 = document.createElement("li");
                pagearea.appendChild(li4);
                var a4 = document.createElement("a");
                a4.setAttribute("href",href1);
                a4.innerText = "首页";
                li4.appendChild(a4);
                //上一页
                var url_pre_page = url_getquestionlist+"/page/"+(result.currentPageCode-1);
                var href3 = 'javascript:refreshQuestion("'+url_pre_page+'")';
                var li2 = document.createElement("li");
                pagearea.appendChild(li2);
                var a2 = document.createElement("a");
                a2.setAttribute("href",href3);
                a2.innerText = "上一页";
                li2.appendChild(a2);
                if(result.currentPageCode ==1){// 不是首页，则显示上一页
                    li4.setAttribute("class","txt-pager disabled js-first-pager");
                    li2.setAttribute("class","txt-pager disabled js-pre-pager");
                }else {
                    li4.setAttribute("class","txt-pager js-first-pager");
                    li2.setAttribute("class","txt-pager js-pre-pager");
                }
                //下一页
                var url_next_page = url_getquestionlist +"/page/"+(result.currentPageCode+1);
                var  href4 ='javascript:refreshQuestion("'+url_next_page+'")';
                var li3 = document.createElement("li");
                pagearea.appendChild(li3);
                var a3 = document.createElement("a");
                a3.setAttribute("href",href4);
                a3.innerText = "下一页";
                li3.appendChild(a3);
                //尾页
                var url_last_page = "${pageContext.request.contextPath}/questionpaper/all/page/"+result.totalPages;
                var href2 =  'javascript:refreshQuestion("'+url_last_page+'")';
                var li5 = document.createElement("li");
                pagearea.appendChild(li5);
                var a5 = document.createElement("a");
                a5.setAttribute("href",href2);
                a5.innerText = "尾页";
                li5.appendChild(a5);
                if(result.currentPageCode == result.totalPages){
                    li3.setAttribute("class","txt-pager disabled js-next-pager");
                    li5.setAttribute("class","txt-pager disabled js-last-pager");
                }else{
                    li3.setAttribute("class","txt-pager js-next-pager");
                    li5.setAttribute("class","txt-pager js-last-pager");
                }
                //当前页码
                var li6 = document.createElement("li");
                li6.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li6);
                var a6 = document.createElement("a");
                a6.innerText = "当前第"+result.currentPageCode+"页";
                li6.appendChild(a6);
                //总共页码
                var li7 = document.createElement("li");
                li7.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li7);
                var a7 = document.createElement("a");
                a7.innerText = "共"+result.totalPages+"页";
                li7.appendChild(a7);
                /*//页面跳转
                var li9 = document.createElement("li");
                li9.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li9);
                var input1 = document.createElement("input");
                input1.setAttribute("class","txt-pager js-last-pager");
                input1.setAttribute("type","text");
                li9.appendChild(input1);
                var url_next_page = url_getquestionlist +"/page/"+input1.value;
                var  href8 ='javascript:refreshQuestion("'+url_next_page+'")';
                var li8 = document.createElement("li");
                li8.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li8);
                var a8 = document.createElement("a");
                a8.setAttribute("href",href8);
                a8.innerText = "跳转";
                li8.appendChild(a8);*/
            }
        }

        function loadQuestionByLanguage(that) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result.modelList;
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    var li1 = document.createElement("li");
                    var a1 = document.createElement("a");
                    a1.setAttribute("href","${pageContext.request.contextPath}/questionpaper/test/"+objArr[i].questionPaperId);
                    li1.appendChild(a1);
                    tbody.appendChild(li1);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","content-item-brief");
                    a1.appendChild(div1);
                    var h1 = document.createElement("h1");
                    h1.innerText = objArr[i].questionPaperTitle;
                    div1.appendChild(h1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","web-logoimg");
                    div1.appendChild(div2);
                    var img1 = document.createElement("img");
                    img1.setAttribute("src","https://static.nowcoder.net/images/weblogo/gray_logo/40.png");
                    div2.appendChild(img1);
                    var div3 = document.createElement("div");
                    div3.setAttribute("class","exam-foot");
                    div3.innerText = "";
                    div1.appendChild(div3);
                    var dl1 = document.createElement("dl");
                    dl1.setAttribute("class","exam-info");
                    div1.appendChild(dl1);
                    var dd1 = document.createElement("dd");
                    dl1.appendChild(dd1);
                    var span1 = document.createElement("span");
                    span1.setAttribute("class","link-green");
                    span1.innerText = "共27道题";
                    dd1.appendChild(span1);
                    var dd2 = document.createElement("dd");
                    dd2.setAttribute("class","exam-btn");
                    dl1.appendChild(dd2);
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","btn  btn-block btn-primary")
                    span2.innerText = "查看详情";
                    dd2.appendChild(span2);
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                //首页
                var url_first_page = "";
                url_first_page = that+"/"+1;
                var href1 =  'javascript:getQuestionByLanguage("'+url_first_page+'")';
                var li4 = document.createElement("li");
                pagearea.appendChild(li4);
                var a4 = document.createElement("a");
                a4.setAttribute("href",href1);
                a4.innerText = "首页";
                li4.appendChild(a4);
                //上一页
                var url_pre_page = "";
                url_pre_page = that+"/"+(result.currentPageCode-1);
                var href3 = 'javascript:getQuestionByLanguage("'+url_pre_page+'")';
                var li2 = document.createElement("li");
                pagearea.appendChild(li2);
                var a2 = document.createElement("a");
                a2.setAttribute("href",href3);
                a2.innerText = "上一页";
                li2.appendChild(a2);
                if(result.currentPageCode ==1){// 不是首页，则显示上一页
                    li4.setAttribute("class","txt-pager disabled js-first-pager");
                    li2.setAttribute("class","txt-pager disabled js-pre-pager");
                }else {
                    li4.setAttribute("class","txt-pager js-first-pager");
                    li2.setAttribute("class","txt-pager js-pre-pager");
                }
                //下一页
                var url_next_page = "";
                url_next_page = that +"/"+(result.currentPageCode+1);
                var  href4 ='javascript:getQuestionByLanguage("'+url_next_page+'")';
                var li3 = document.createElement("li");
                pagearea.appendChild(li3);
                var a3 = document.createElement("a");
                a3.setAttribute("href",href4);
                a3.innerText = "下一页";
                li3.appendChild(a3);
                //尾页
                var url_last_page = "";
                url_last_page = that+"/"+result.totalPages;
                var href2 =  'javascript:getQuestionByLanguage("'+url_last_page+'")';
                var li5 = document.createElement("li");
                pagearea.appendChild(li5);
                var a5 = document.createElement("a");
                a5.setAttribute("href",href2);
                a5.innerText = "尾页";
                li5.appendChild(a5);
                if(result.currentPageCode == result.totalPages){
                    li3.setAttribute("class","txt-pager disabled js-next-pager");
                    li5.setAttribute("class","txt-pager disabled js-last-pager");
                }else{
                    li3.setAttribute("class","txt-pager js-next-pager");
                    li5.setAttribute("class","txt-pager js-last-pager");
                }
                //当前页码
                var li6 = document.createElement("li");
                li6.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li6);
                var a6 = document.createElement("a");
                a6.innerText = "当前第"+result.currentPageCode+"页";
                li6.appendChild(a6);
                //总共页码
                var li7 = document.createElement("li");
                li7.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li7);
                var a7 = document.createElement("a");
                a7.innerText = "共"+result.totalPages+"页";
                li7.appendChild(a7);
                /*//页面跳转
                var li9 = document.createElement("li");
                li9.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li9);
                var input1 = document.createElement("input");
                input1.setAttribute("class","txt-pager js-last-pager");
                input1.setAttribute("type","text");
                li9.appendChild(input1);
                var url_next_page = url_getquestionlist +"/page/"+input1.value;
                var  href8 ='javascript:refreshQuestion("'+url_next_page+'")';
                var li8 = document.createElement("li");
                li8.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li8);
                var a8 = document.createElement("a");
                a8.setAttribute("href",href8);
                a8.innerText = "跳转";
                li8.appendChild(a8);*/
            }
        }

        function loadQuestionByTime(that) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result.modelList;
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    var li1 = document.createElement("li");
                    var a1 = document.createElement("a");
                    a1.setAttribute("href","${pageContext.request.contextPath}/questionpaper/test/"+objArr[i].questionPaperId);
                    li1.appendChild(a1);
                    tbody.appendChild(li1);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","content-item-brief");
                    a1.appendChild(div1);
                    var h1 = document.createElement("h1");
                    h1.innerText = objArr[i].questionPaperTitle;
                    div1.appendChild(h1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","web-logoimg");
                    div1.appendChild(div2);
                    var img1 = document.createElement("img");
                    img1.setAttribute("src","https://static.nowcoder.net/images/weblogo/gray_logo/40.png");
                    div2.appendChild(img1);
                    var div3 = document.createElement("div");
                    div3.setAttribute("class","exam-foot");
                    div3.innerText = "";
                    div1.appendChild(div3);
                    var dl1 = document.createElement("dl");
                    dl1.setAttribute("class","exam-info");
                    div1.appendChild(dl1);
                    var dd1 = document.createElement("dd");
                    dl1.appendChild(dd1);
                    var span1 = document.createElement("span");
                    span1.setAttribute("class","link-green");
                    span1.innerText = "共27道题";
                    dd1.appendChild(span1);
                    var dd2 = document.createElement("dd");
                    dd2.setAttribute("class","exam-btn");
                    dl1.appendChild(dd2);
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","btn  btn-block btn-primary")
                    span2.innerText = "查看详情";
                    dd2.appendChild(span2);
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                //首页
                var url_first_page = that+"/"+1;
                var href1 =  'javascript:getQuestionByTime("'+url_first_page+'")';
                var li4 = document.createElement("li");
                pagearea.appendChild(li4);
                var a4 = document.createElement("a");
                a4.setAttribute("href",href1);
                a4.innerText = "首页";
                li4.appendChild(a4);
                //上一页
                var url_pre_page = that+"/"+(result.currentPageCode-1);
                var href3 = 'javascript:getQuestionByTime("'+url_pre_page+'")';
                var li2 = document.createElement("li");
                pagearea.appendChild(li2);
                var a2 = document.createElement("a");
                a2.setAttribute("href",href3);
                a2.innerText = "上一页";
                li2.appendChild(a2);
                if(result.currentPageCode ==1){// 不是首页，则显示上一页
                    li4.setAttribute("class","txt-pager disabled js-first-pager");
                    li2.setAttribute("class","txt-pager disabled js-pre-pager");
                }else {
                    li4.setAttribute("class","txt-pager js-first-pager");
                    li2.setAttribute("class","txt-pager js-pre-pager");
                }
                //下一页
                var url_next_page = that +"/"+(result.currentPageCode+1);
                var  href4 ='javascript:getQuestionByTime("'+url_next_page+'")';
                var li3 = document.createElement("li");
                pagearea.appendChild(li3);
                var a3 = document.createElement("a");
                a3.setAttribute("href",href4);
                a3.innerText = "下一页";
                li3.appendChild(a3);
                //尾页
                var url_last_page = that+"/"+result.totalPages;
                var href2 =  'javascript:getQuestionByTime("'+url_last_page+'")';
                var li5 = document.createElement("li");
                pagearea.appendChild(li5);
                var a5 = document.createElement("a");
                a5.setAttribute("href",href2);
                a5.innerText = "尾页";
                li5.appendChild(a5);
                if(result.currentPageCode == result.totalPages){
                    li3.setAttribute("class","txt-pager disabled js-next-pager");
                    li5.setAttribute("class","txt-pager disabled js-last-pager");
                }else{
                    li3.setAttribute("class","txt-pager js-next-pager");
                    li5.setAttribute("class","txt-pager js-last-pager");
                }
                //当前页码
                var li6 = document.createElement("li");
                li6.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li6);
                var a6 = document.createElement("a");
                a6.innerText = "当前第"+result.currentPageCode+"页";
                li6.appendChild(a6);
                //总共页码
                var li7 = document.createElement("li");
                li7.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li7);
                var a7 = document.createElement("a");
                a7.innerText = "共"+result.totalPages+"页";
                li7.appendChild(a7);
                /*//页面跳转
                var li9 = document.createElement("li");
                li9.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li9);
                var input1 = document.createElement("input");
                input1.setAttribute("class","txt-pager js-last-pager");
                input1.setAttribute("type","text");
                li9.appendChild(input1);
                var url_next_page = url_getquestionlist +"/page/"+input1.value;
                var  href8 ='javascript:refreshQuestion("'+url_next_page+'")';
                var li8 = document.createElement("li");
                li8.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li8);
                var a8 = document.createElement("a");
                a8.setAttribute("href",href8);
                a8.innerText = "跳转";
                li8.appendChild(a8);*/
            }
        }

        function loadQuestionByCompany(that) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var result = JSON.parse(xhr.responseText);
                //1. 数据渲染
                objArr  = result.modelList;
                var tbody = document.getElementById("tbody");
                tbody.innerHTML = "";
                for (var i = 0; i < objArr.length; i++) {
                    var li1 = document.createElement("li");
                    var a1 = document.createElement("a");
                    a1.setAttribute("href","${pageContext.request.contextPath}/questionpaper/test/"+objArr[i].questionPaperId);
                    li1.appendChild(a1);
                    tbody.appendChild(li1);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","content-item-brief");
                    a1.appendChild(div1);
                    var h1 = document.createElement("h1");
                    h1.innerText = objArr[i].questionPaperTitle;
                    div1.appendChild(h1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","web-logoimg");
                    div1.appendChild(div2);
                    var img1 = document.createElement("img");
                    img1.setAttribute("src","https://static.nowcoder.net/images/weblogo/gray_logo/40.png");
                    div2.appendChild(img1);
                    var div3 = document.createElement("div");
                    div3.setAttribute("class","exam-foot");
                    div3.innerText = "";
                    div1.appendChild(div3);
                    var dl1 = document.createElement("dl");
                    dl1.setAttribute("class","exam-info");
                    div1.appendChild(dl1);
                    var dd1 = document.createElement("dd");
                    dl1.appendChild(dd1);
                    var span1 = document.createElement("span");
                    span1.setAttribute("class","link-green");
                    span1.innerText = "共27道题";
                    dd1.appendChild(span1);
                    var dd2 = document.createElement("dd");
                    dd2.setAttribute("class","exam-btn");
                    dl1.appendChild(dd2);
                    var span2 = document.createElement("span");
                    span2.setAttribute("class","btn  btn-block btn-primary")
                    span2.innerText = "查看详情";
                    dd2.appendChild(span2);
                }
                //2. 页码渲染
                var pagearea =   document.getElementById("pagearea");
                pagearea.innerHTML="";
                //首页
                var url_first_page = that+"/"+1;
                var href1 =  'javascript:getQuestionByCompany("'+url_first_page+'")';
                var li4 = document.createElement("li");
                pagearea.appendChild(li4);
                var a4 = document.createElement("a");
                a4.setAttribute("href",href1);
                a4.innerText = "首页";
                li4.appendChild(a4);
                //上一页
                var url_pre_page = that+"/"+(result.currentPageCode-1);
                var href3 = 'javascript:getQuestionByCompany("'+url_pre_page+'")';
                var li2 = document.createElement("li");
                pagearea.appendChild(li2);
                var a2 = document.createElement("a");
                a2.setAttribute("href",href3);
                a2.innerText = "上一页";
                li2.appendChild(a2);
                if(result.currentPageCode ==1){// 不是首页，则显示上一页
                    li4.setAttribute("class","txt-pager disabled js-first-pager");
                    li2.setAttribute("class","txt-pager disabled js-pre-pager");
                }else {
                    li4.setAttribute("class","txt-pager js-first-pager");
                    li2.setAttribute("class","txt-pager js-pre-pager");
                }
                //下一页
                var url_next_page = that +"/"+(result.currentPageCode+1);
                var  href4 ='javascript:getQuestionByCompany("'+url_next_page+'")';
                var li3 = document.createElement("li");
                pagearea.appendChild(li3);
                var a3 = document.createElement("a");
                a3.setAttribute("href",href4);
                a3.innerText = "下一页";
                li3.appendChild(a3);
                //尾页
                var url_last_page = that+"/"+result.totalPages;
                var href2 =  'javascript:getQuestionByCompany("'+url_last_page+'")';
                var li5 = document.createElement("li");
                pagearea.appendChild(li5);
                var a5 = document.createElement("a");
                a5.setAttribute("href",href2);
                a5.innerText = "尾页";
                li5.appendChild(a5);
                if(result.currentPageCode == result.totalPages){
                    li3.setAttribute("class","txt-pager disabled js-next-pager");
                    li5.setAttribute("class","txt-pager disabled js-last-pager");
                }else{
                    li3.setAttribute("class","txt-pager js-next-pager");
                    li5.setAttribute("class","txt-pager js-last-pager");
                }
                //当前页码
                var li6 = document.createElement("li");
                li6.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li6);
                var a6 = document.createElement("a");
                a6.innerText = "当前第"+result.currentPageCode+"页";
                li6.appendChild(a6);
                //总共页码
                var li7 = document.createElement("li");
                li7.setAttribute("class","txt-pager disabled js-last-pager");
                pagearea.appendChild(li7);
                var a7 = document.createElement("a");
                a7.innerText = "共"+result.totalPages+"页";
                li7.appendChild(a7);
                /*//页面跳转
                var li9 = document.createElement("li");
                li9.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li9);
                var input1 = document.createElement("input");
                input1.setAttribute("class","txt-pager js-last-pager");
                input1.setAttribute("type","text");
                li9.appendChild(input1);
                var url_next_page = url_getquestionlist +"/page/"+input1.value;
                var  href8 ='javascript:refreshQuestion("'+url_next_page+'")';
                var li8 = document.createElement("li");
                li8.setAttribute("class","txt-pager js-last-pager");
                pagearea.appendChild(li8);
                var a8 = document.createElement("a");
                a8.setAttribute("href",href8);
                a8.innerText = "跳转";
                li8.appendChild(a8);*/
            }
        }
    </script>

    <%@include file="head.jsp"%>

    <div class="question-wrapper">
        <div class="question-content-head">
            <div class="question-content-head-content">
                <ul class="question-content-head-ul">
                    <li class="selected">
                        <a href="${pageContext.request.contextPath}/question-company">公司真题</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/question-language">专项练习</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/question-exercise">在线编程</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="question-content-middle">
            <div class="company-left">
                <ul class="test-center-menu">
                    <li>
                        <div class="tcm-mod">
                            <h4 class="tcm-hd">职业方向</h4>
                            <div class="tcm-bd">
                                <a class="tcm-tag" data-id="639" href="javascript:getQuestionByLanguage('Java');">Java工程师</a>
                                <a class="tcm-tag" data-id="640" href="javascript:getQuestionByLanguage('C++');">C++工程师</a>
                                <a class="tcm-tag" data-id="639" href="javascript:getQuestionByLanguage('Python');">python工程师</a>
                                <a class="tcm-tag" data-id="640" href="javascript:getQuestionByLanguage('C');">C工程师</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="tcm-mod">
                            <div class="tcm-arrow"></div>
                            <h4 class="tcm-hd">公司</h4>
                            <div class="tcm-bd">
                                <a href="javascript:getQuestionByCompany('shangshi');" class="tcm-tag" data-id="134">尚世</a>
                                <a href="javascript:getQuestionByCompany('daijun');" class="tcm-tag" data-id="138">戴俊</a>
                                <a href="javascript:getQuestionByCompany('sibichi');" class="tcm-tag" data-id="139">思必驰</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="tcm-mod">
                            <h4 class="tcm-hd">时间</h4>
                            <div class="tcm-bd">
                                <a class="tcm-tag" data-id="888" href="javascript:getQuestionByTime('2018');">2018</a>
                                <a class="tcm-tag" data-id="672" href="javascript:getQuestionByTime('2017');">2017</a>
                                <a class="tcm-tag" data-id="651" href="javascript:getQuestionByTime('2016');">2016</a>
                                <a class="tcm-tag" data-id="250" href="javascript:getQuestionByTime('2015');">2015</a>
                                <a class="tcm-tag" data-id="251" href="javascript:getQuestionByTime('2014');">2014</a>
                                <a class="tcm-tag" data-id="252" href="javascript:getQuestionByTime('2013');">2013</a>
                                <a class="tcm-tag" data-id="253" href="javascript:getQuestionByTime('2012');">2012</a>
                                <a class="tcm-tag" data-id="254" href="javascript:getQuestionByTime('2011');">2011</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="company-right">
                <div class="module-box">
                    <div class="module-body" >
                        <ul class="content-item-box clearfix" id="tbody">
                            <%--<li>
                                <a href="/test/12398853/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘客户端在线笔试B卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：5332</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/test/12398771/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘客户端在线笔试A卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：1923</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/test/12398581/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘计算机视觉在线笔试B卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：1824</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/test/12398504/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘计算机视觉在线笔试A卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：1036</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/test/12398350/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘iOS在线笔试B卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：116</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="/test/12398264/summary">
                                    <div class="content-item-brief">
                                        <h1>2018迅雷校园招聘iOS在线笔试A卷
                                        </h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/gray_logo/40.png">
                                        </div>
                                        <div class="exam-foot">热度指数：76</div>
                                        <dl class="exam-info">
                                            <dd><span class="link-green">共27道题</span></dd>
                                            <dd class="exam-btn"><span class="btn  btn-block btn-primary">查看详情</span></dd>
                                        </dl>
                                    </div>
                                </a>
                            </li>--%>
                        </ul>
                        <div id="king">
                            <div  class="pagination">
                                <ul data-total="54" id="pagearea">
                                    <%--<li class="txt-pager disabled js-first-pager"><a data-page="1" href="javascript:void(0)">首页</a></li>
                                    <li class="txt-pager disabled js-pre-pager"><a data-page="1" href="javascript:void(0)">上一页</a></li>
                                    &lt;%&ndash;<li class="active js-1-pager"><a href="javascript:void(0)" data-page="1">1</a></li>
                                    <li class="js-2-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=2" data-page="2">2</a></li>
                                    <li class="js-3-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=3" data-page="3">3</a></li>
                                    <li class="js-4-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=4" data-page="4">4</a></li>
                                    <li class="js-5-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=5" data-page="5">5</a></li>
                                    <li class="js-6-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=6" data-page="6">6</a></li>
                                    <li class="js-7-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=7" data-page="7">7</a></li>
                                    <li class="js-8-pager"><a href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=8" data-page="8">8</a></li>&ndash;%&gt;
                                    <li class="txt-pager js-next-pager"><a data-page="2" href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=2">下一页</a></li>
                                    <li class="txt-pager js-last-pager"><a data-page="54" href="/contestRoom?filter=0&amp;orderByHotValue=1&amp;page=54">末页</a></li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
