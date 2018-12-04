<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/11
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage1.css">
</head>
<body>

    <script type="text/javascript">
        var url_getsomedata = '${pageContext.request.contextPath}/questionpaper/some/3';
        var url_userquestion = '${pageContext.request.contextPath}/userquestion/data';
        window.onload = function () {
            loadData1(url_getsomedata);
        }
        var xhr = null;
        function loadData1(that) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",that, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = getData1;
            xhr.send();
        }
        function getData1() {
            if(xhr.readyState==4&&xhr.status==200){
                var result = JSON.parse(xhr.responseText);
                var tbody = document.getElementById("tbody");
                for(var i=0;i<result.length;i++){
                    var li1 = document.createElement("li");
                    tbody.appendChild(li1);
                    var div1 = document.createElement("div");
                    div1.setAttribute("class","content-item-brief");
                    li1.appendChild(div1);
                    var a1 = document.createElement("a");
                    a1.setAttribute("href","${pageContext.request.contextPath}/questionpaper/test/"+result[i].questionPaperId);
                    div1.appendChild(a1);
                    var h1 = document.createElement("h1");
                    h1.innerText = result[i].questionPaperTitle;
                    a1.appendChild(h1);
                    var div2 = document.createElement("div");
                    div2.setAttribute("class","web-logoimg");
                    a1.appendChild(div2);
                    var img1 = document.createElement("img");
                    img1.setAttribute("src","https://static.nowcoder.net/images/weblogo/gray_logo/40.png");
                    div2.appendChild(img1);
                    var div3 = document.createElement("div");
                    div3.setAttribute("class","brief-mask");
                    a1.appendChild(div3);
                }
                loadData2(url_userquestion);
            }
        }
        function loadData2(that) {
            if (window.XMLHttpRequest) {
                xhr = new XMLHttpRequest();
            } else {
                xhr = new ActiveXObject('Microsoft.XMLHTTP');
            }
            xhr.open("GET",that, true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
            xhr.onreadystatechange = getData2;
            xhr.send();
        }
        function getData2() {
            if(xhr.readyState==4&&xhr.status==200){
                var result = JSON.parse(xhr.responseText);
                document.getElementById("questionNum").innerText = result.questionNum;
                document.getElementById("correctNum").innerText = result.correctNum;
                document.getElementById("erroNum").innerText = result.erroNum;
            }
        }
    </script>

    <%@include file="head.jsp"%>

    <div id="homepage_content">
        <c:choose>
            <c:when test="${user==null}">
            <div class="unlogin-banner-wrapper">
                <ul class="banner-slide">
                    <li style="display: list-item; margin-top: 0px;">
                        <a target="_blank" class="banner-module" style="background: url(//uploadfiles.nowcoder.net/images/20171117/3311212_1510900474314_16ECFF9C612B1B3096027C844E4043A9) center top no-repeat rgb(21, 119, 228);">
                        </a>
                    </li>
                </ul>
                <ol class="banner-slide-dots"><li class="dot"></li><li class="dot"></li><li class="dot active"></li></ol>
                <a href="javascript:void(0);" class="banner-pre" style="left:100px;top:204px;"></a>
                <a href="javascript:void(0);" class="banner-next" style="right:100px;top:204px;"></a>
            </div>
            <div class="main-wrapper main-wrapper2">
                <div class="home-theme-wrapper">
                    <div class="home-theme-box clearfix">
                        <div class="home-theme-item home-theme1">
                            <div class="hti-sign"></div>
                            <h2 class="hti-depict">精准能力评估+针对性专项练习</h2>
                            <h4 class="hti-slogan">要练,就要练最有用的！</h4>
                        </div>
                        <div class="home-theme-item home-theme2">
                            <div class="hti-sign"></div>
                            <h2 class="hti-depict">互联网公司真题+模考+面经</h2>
                            <h4 class="hti-slogan">公司考什么？怎么考？一刷便知！</h4>
                        </div>
                        <div class="home-theme-item home-theme3">
                            <div class="hti-sign"></div>
                            <h2 class="hti-depict">精华专题练习</h2>
                            <h4 class="hti-slogan">面试经典题在线练，还能赢内推</h4>
                        </div>
                        <div class="home-theme-item home-theme4">
                            <div class="hti-sign"></div>
                            <h2 class="hti-depict">以题会友，涨姿势交朋友</h2>
                            <h4 class="hti-slogan">你不会的，这里都能找到答案！</h4>
                        </div>
                    </div>
                </div>
                <div class="home-cont-wrap home-odd-wrap">
                    <div class="home-theme-cont">
                        <div class="module-head clearfix">
                            <p class="home-mod-tip">选择目标职位，测评技能现状，为你定制薄弱知识点专项练习</p>
                        </div>
                        <div class="module-body">
                            <ul class="content-item-box clearfix">
                                <li>
                                    <a href="${pageContext.request.contextPath}/question-company" class="content-item-brief">
                                        <h1>Java工程师能力评估</h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/color_logo/52.png">
                                        </div>
                                        <dl class="exam-info">
                                            <%--<dd>已有116345人评估</dd>--%>
                                            <dd class="exam-btn"><span class="btn btn-block btn-primary">马上评估</span></dd>
                                        </dl>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/question-company" class="content-item-brief">
                                        <h1>C++工程师能力评估</h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/color_logo/49.png">
                                        </div>
                                        <dl class="exam-info">
                                            <%--<dd>已有64657人评估</dd>--%>
                                            <dd class="exam-btn"><span class="btn btn-block btn-primary">马上评估</span></dd>
                                        </dl>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/question-company" class="content-item-brief">
                                        <h1>C工程师能力评估</h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/color_logo/48.png">
                                        </div>
                                        <dl class="exam-info">
                                            <%--<dd>已有28696人评估</dd>--%>
                                            <dd class="exam-btn"><span class="btn btn-block btn-primary">马上评估</span></dd>
                                        </dl>
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/question-company" class="content-item-brief">
                                        <h1>Python工程师能力评估</h1>
                                        <div class="web-logoimg">
                                            <img src="https://static.nowcoder.net/images/weblogo/color_logo/51.png">
                                        </div>
                                        <dl class="exam-info">
                                            <%--<dd>已有11060人评估</dd>--%>
                                            <dd class="exam-btn"><span class="btn btn-block btn-primary">马上评估</span></dd>
                                        </dl>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="home-cont-wrap">
                    <div class="home-theme-cont home-webtest">
                        <div class="module-head clearfix">
                            <p class="home-mod-tip">熟悉心仪公司考察题型+流程，了解自己实战水平</p>
                        </div>
                        <div class="module-body">
                            <!-- webtest-slide-box 给定义的一个宽高，超出部分隐藏 ，移动的时候改变webtest-slide-wrap的偏移值-->
                            <div class="home-slide-module webtest-slide-box" data-total="16" data-per="8">
                                <!-- webtest-slide-wrap 设置一个很宽的值，防止ul被挤到下面去 -->
                                <div class="home-slide-wrap">
                                    <ul class="webtest-list clearfix">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/question-company" class="webtest-item">
                                                <div class="weblogo logo_7">阿里巴巴</div>
                                                <div class="webtest-title">阿里巴巴笔试面试题</div>
                                                <%--<div class="webtest-count">共有<span class="webtest-num">1716</span>道题</div>--%>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/question-company" class="webtest-item">
                                                <div class="weblogo logo_2">腾讯</div>
                                                <div class="webtest-title">腾讯笔试面试题</div>
                                                <%--<div class="webtest-count">共有<span class="webtest-num">942</span>道题</div>--%>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/question-company" class="webtest-item">
                                                <div class="weblogo logo_1">百度</div>
                                                <div class="webtest-title">百度笔试面试题</div>
                                                <%--<div class="webtest-count">共有<span class="webtest-num">1394</span>道题</div>--%>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/question-company" class="webtest-item">
                                                <div class="weblogo logo_9">google</div>
                                                <div class="webtest-title">google笔试面试题</div>
                                                <%--<div class="webtest-count">共有<span class="webtest-num">122</span>道题</div>--%>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:when>
            <c:when test="${user!=null}">
                <div id="homepage_after_login_wrapper">
                    <div id="homepage_login_wrapper">
                        <div class="homepage_login_left">
                            <div class="module-box home-items">
                                <a class="real-exercise" href="${pageContext.request.contextPath}/question-company">
                                    <i></i>
                                    <h2 class="new-items-txt">真题练习</h2>
                                </a>
                                <a class="devote-exercise" href="${pageContext.request.contextPath}/question-language">
                                    <i></i>
                                    <h2 class="new-items-txt">专项练习</h2>
                                </a>
                                <a class="wrong-exercise" href="${pageContext.request.contextPath}/user/personal/showInfo/${user.userId}">
                                    <i></i>
                                    <h2 class="new-items-txt">错题练习</h2>
                                </a>
                                <a class="subject-exercise" href="${pageContext.request.contextPath}/question-exercise">
                                    <i></i>
                                    <h2 class="new-items-txt">在线编程</h2>
                                </a>
                                <%--<a class="check-discuss" href="/profile/861989627/courses">
                                    <i></i>
                                    <h2 class="new-items-txt">课程学习</h2>
                                </a>--%>
                                <a class="items-collect" href="${pageContext.request.contextPath}/user/personal/showInfo/${user.userId}">
                                    <i></i>
                                    <h2 class="new-items-txt">我的收藏</h2>
                                </a>
                            </div>
                            <div class="module-box mod-toggle open" data-type="2">
                                <div class="module-head clearfix">
                                    <h1>公司真题练习</h1>
                                    <a href="javascript:void(0);" class="icon-drag"></a>
                                </div>
                                <div class="module-body">
                                    <ul class="content-item-box clearfix" id="tbody"></ul>
                                    <div id="btn" class="model-btn-box">
                                        <a href="${pageContext.request.contextPath}/question-company" class="btn btn-block btn-primary">查看全部公司真题</a>
                                    </div>
                                </div>
                            </div>


                            <div class="mod-choice-body">
                                <div class="arrow-up-box">
                                    <i class="arrow-up"></i>
                                    <i class="arrow-up-min"></i>
                                </div>
                                <div class="module-head clearfix">
                                    <h1>乐宁网题库类型概览</h1>
                                </div>
                                <div class="module-body">
                                    <dl class="home-tags-mod">
                                        <dt class="htm-head">语言</dt>
                                        <dd class="tags-box js-type-job">
                                            <a href="javascript:void(0);" class="tag-label" data-id="639">Java</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="640">C++</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="649">Python</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="683">C</a>
                                        </dd>
                                    </dl>
                                    <dl class="home-tags-mod">
                                        <dt class="htm-head">公司</dt>
                                        <dd class="tags-box js-type-company">
                                            <a href="javascript:void(0);" class="tag-label" data-id="134">尚世</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="138">戴俊</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="139">思必驰</a>
                                        </dd>
                                    </dl>
                                    <dl class="home-tags-mod">
                                        <dt class="htm-head">年份</dt>
                                        <dd class="tags-box js-type-topic">
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2018</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2017</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2016</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2015</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2014</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2013</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2012</a>
                                            <a href="javascript:void(0);" class="tag-label" data-id="6">2011</a>
                                        </dd>
                                    </dl>
                                </div>
                            </div>



                        </div>
                        <div class="homepage_login_right">
                            <div class="module-box side-profile-box">
                                <div class="side-profile-info">
                                    <div class="side-profile-avatar">
                                        <a class="side-profile-pic" data-card-uid="861989627" href="${pageContext.request.contextPath}/user/personal/showInfo/${user.userId}" data-card-index="21">
                                            <%--<img src="https://images.nowcoder.com/images/20180804/861989627_1533349295344_7C2C60506876716CCF0E706DB13D4511@0e_200w_200h_0c_1i_1o_90Q_1x" height="60" width="60">--%>
                                            <img src="${pageContext.request.contextPath}/image/${user.userImage}" alt="">
                                        </a>
                                    </div>
                                    <h3 class="side-profile-name">
                                        <a href="${pageContext.request.contextPath}/user/personal/showInfo/${user.userId}" class="level-color-6" data-card-uid="861989627" data-card-index="22">
                                            ${user.userName}
                                        </a>
                                    </h3>
                                </div>
                                <div class="web-statistics">
                                    <ul id="user-question-datas">
                                        <li>
                                            <p>共做题</p>
                                            <p class="ws-num" id="questionNum"></p>
                                        </li>
                                        <li>
                                            <p>答对题</p>
                                            <p class="ws-num"id="correctNum"></p>
                                        </li>
                                        <li>
                                            <p>答错题</p>
                                            <p class="ws-num" id="erroNum"></p>
                                        </li>
                                        <%--<li>
                                            <p>通过率</p>
                                            <p class="ws-num">100/101</p>
                                        </li>--%>
                                    </ul>
                                </div>
                                <div class="side-rader-box" id="sideRaderBox" style="">
                                    <div class="side-rader-head clearfix">
                                        <%--<h4>我的技能图谱</h4>--%>
                                        <div class="btn-group btn-group-sm js-job-select"><div id="jsCpn_4_component_0" class="btn-group btn-group-sm"><%--<button class="btn btn-default dropdown-toggle"><span class="js-txt dropdown-value" title="Java工程师" style="width: 70px;">&lt;%&ndash;Java工程师</span><span class="caret"></span>&ndash;%&gt;</button>--%></div></div>
                                    </div>
                                    <div class="rader-container" _echarts_instance_="1539828574512" style="height: 228px; background-color: rgba(0, 0, 0, 0); cursor: default;"><div style="position: relative; width: 228px; height: 228px; overflow: visible;"><div width="285" height="285" data-zr-dom-id="bg" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></div><canvas width="285" height="285" data-zr-dom-id="0" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas><canvas width="285" height="285" data-zr-dom-id="1" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas><canvas width="285" height="285" data-zr-dom-id="2" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas><canvas width="285" height="285" data-zr-dom-id="3" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas><canvas width="285" height="285" data-zr-dom-id="8" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas><canvas width="285" height="285" data-zr-dom-id="_zrender_hover_" style="position: absolute; left: 0px; top: 0px; width: 228px; height: 228px; user-select: none;"></canvas></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
    <%@include file="footer.jsp"%>
</body>
</html>
