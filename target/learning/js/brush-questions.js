
/****************************************刷题js***************************************/
/**
 * 展示真题试卷页面
 * @param url 显示该用户已做的所有的试卷
 */
function showBrushQuestions(url) {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else{
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=loadQuestionPapers;
    xhr.send();
}
//数据渲染
function loadQuestionPapers() {
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        //获取所有已做试卷的信息
        var paperArr=result.paperPageModel.modelList;
        var module=document.getElementById("module-real-quiz-paper");
        document.getElementById("count-paper").innerText=result.paperPageModel.totalRecord;
        module.innerHTML="";
        if(paperArr.length!=0) {
            for (var i = 0; i < paperArr.length; i++) {
                //试卷id
                var id = paperArr[i].questionPaperId;
                //获取某张试卷的试题总数
                var all = paperArr[i].questionPaperNumber;
                //获取某个试卷正确题目的数量
                var correct = result.map2[paperArr[i].questionPaperId];
                //计算试卷得分
                var correctRate = parseInt(correct) * 100 / parseInt(all);
                //获取某个试卷已做题目的数量
                var did = result.map3[paperArr[i].questionPaperId];
                //计算试卷完成率
                var didRate = parseInt(did) * 100 / parseInt(all) + '%';

                module.innerHTML += "<li onclick=\"paperDetail(" + id + ")\" title='" + paperArr[i].questionPaperTitle + "'>\n" +
                    "                                <span>" + paperArr[i].questionPaperTitle + "</span>\n" +
                    "                                <span>试题数量(" + paperArr[i].questionPaperNumber + ")</span>\n" +
                    "                                <span>完成度(" + didRate + ")</span>\n" +
                    "                                <span>得分(" + correctRate + ")</span>\n" +
                    "               </li>";
            }
            var pagearea = document.getElementById("pagearea");
            pagearea.innerHTML = "";
            //当前页码
            var pagecode = result.paperPageModel.currentPageCode;
            //总记录数
            var totalRecord = result.paperPageModel.totalRecord;
            //总页数
            var totalPages = result.paperPageModel.totalPages;
            var url_page_home = url_showQuestionPaper + "/page/" + userId + "&" + 1;
            var href_home = 'javascript:showBrushQuestions("' + url_page_home + '")';
            var firstEle = "<a href='" + href_home + "'>首页</a>";
            pagearea.innerHTML += firstEle;
            //上一页
            //不是首页显示上一页
            if (pagecode != 1) {
                var url_pre_page = url_showQuestionPaper + "/page/" + userId + "&" + (pagecode - 1);
                var href = 'javascript:showBrushQuestions("' + url_pre_page + '")';
                var prePageEle = "<a href='" + href + "'>上一页</a>"
                pagearea.innerHTML += prePageEle;
            }
            //当前页码和总页数
            var currentPageEle = "<span>" + pagecode + "/" + totalPages + "</span>";
            pagearea.innerHTML += currentPageEle;
            //总记录数
            var totalRecord = "<span>" + totalRecord + "</span>";
            pagearea.innerHTML += totalRecord;
            //下一页
            //如果不是尾页显示下一页
            if (pagecode != totalPages) {
                var url_next_page = url_showQuestionPaper + "/page/" + userId + "&" + (pagecode + 1);
                var href = 'javascript:showBrushQuestions("' + url_next_page + '")';
                var nextPageEle = "<a href='" + href + "'>下一页</a>"
                pagearea.innerHTML += nextPageEle;
            }
            //尾页
            var url_page_last = url_showQuestionPaper + "/page/" + userId + "&" + totalPages;
            var href_last = 'javascript:showBrushQuestions("' + url_page_last + '")';
            var lastPage = "<a href='" + href_last + "'>末页</a>";
            pagearea.innerHTML += lastPage;
        }
    }
}

/**
 * 展示未完成的试卷
 * @param url
 */
function showCompletePaper(url) {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else{
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=loadCompletePaper;
    xhr.send();
}

function loadCompletePaper() {
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        //获取所有已做试卷的信息
        var paperArr=result.paperPageModel.modelList;
        var module=document.getElementById("module-real-quiz-paper");
        document.getElementById("count-paper").innerText=result.paperPageModel.totalRecord;
        module.innerHTML="";
        if(paperArr.length!=0) {
            for (var i = 0; i < paperArr.length; i++) {
                //试卷id
                var id = paperArr[i].questionPaperId;
                //获取某张试卷的试题总数
                var all = paperArr[i].questionPaperNumber;
                //获取某个试卷正确题目的数量
                var correct = result.map2[paperArr[i].questionPaperId];
                //计算试卷得分
                var correctRate = parseInt(correct) * 100 / parseInt(all);
                //获取某个试卷已做题目的数量
                var did = result.map3[paperArr[i].questionPaperId];
                //计算试卷完成率
                var didRate = parseInt(did) * 100 / parseInt(all) + '%';
                if(didRate=='100%') {
                    module.innerHTML += "<li onclick=\"paperDetail(" + id + ")\" title='" + paperArr[i].questionPaperTitle + "'>\n" +
                        "                                <span>" + paperArr[i].questionPaperTitle + "</span>\n" +
                        "                                <span>试题数量(" + paperArr[i].questionPaperNumber + ")</span>\n" +
                        "                                <span>完成度(" + didRate + ")</span>\n" +
                        "                                <span>得分(" + correctRate + ")</span>\n" +
                        "               </li>";
                }
            }
            var pagearea = document.getElementById("pagearea");
            pagearea.innerHTML = "";
            //当前页码
            var pagecode = result.paperPageModel.currentPageCode;
            //总记录数
            var totalRecord = result.paperPageModel.totalRecord;
            //总页数
            var totalPages = result.paperPageModel.totalPages;
            var url_page_home = url_showQuestionPaper + "/page/" + userId + "&" + 1;
            var href_home = 'javascript:showBrushQuestions("' + url_page_home + '")';
            var firstEle = "<a href='" + href_home + "'>首页</a>";
            pagearea.innerHTML += firstEle;
            //上一页
            //不是首页显示上一页
            if (pagecode != 1) {
                var url_pre_page = url_showQuestionPaper + "/page/" + userId + "&" + (pagecode - 1);
                var href = 'javascript:showBrushQuestions("' + url_pre_page + '")';
                var prePageEle = "<a href='" + href + "'>上一页</a>"
                pagearea.innerHTML += prePageEle;
            }
            //当前页码和总页数
            var currentPageEle = "<span>" + pagecode + "/" + totalPages + "</span>";
            pagearea.innerHTML += currentPageEle;
            //总记录数
            var totalRecord = "<span>" + totalRecord + "</span>";
            pagearea.innerHTML += totalRecord;
            //下一页
            //如果不是尾页显示下一页
            if (pagecode != totalPages) {
                var url_next_page = url_showQuestionPaper + "/page/" + userId + "&" + (pagecode + 1);
                var href = 'javascript:showBrushQuestions("' + url_next_page + '")';
                var nextPageEle = "<a href='" + href + "'>下一页</a>"
                pagearea.innerHTML += nextPageEle;
            }
            //尾页
            var url_page_last = url_showQuestionPaper + "/page/" + userId + "&" + totalPages;
            var href_last = 'javascript:showBrushQuestions("' + url_page_last + '")';
            var lastPage = "<a href='" + href_last + "'>末页</a>";
            pagearea.innerHTML += lastPage;
        }
    }
}

/**
 * 根据试卷id进行相应的测试
 * @param obj
 */
function paperDetail(obj) {
    var url_question_test = "/questionbank/test/"+obj;
    window.location = url_question_test;
}

/**
 * 去真题试卷页面
 */
function go2RealQuizPaper() {
    var q1a=document.getElementById("q1");
    var q2a=document.getElementById("q2");
    var q3a=document.getElementById("q3");
    var q1li=q1a.parentElement;
    var q2li=q2a.parentElement;
    var q3li=q3a.parentElement;
    q1a.style.color="#FFF";
    q2a.style.color="#2A2F35";
    q3a.style.color="#2A2F35";
    q1li.style.backgroundColor="#00bc9b";
    q2li.style.backgroundColor="#FFF";
    q3li.style.backgroundColor="#FFF";
    document.getElementById("ajax-real-quiz-paper").style.display="block";
    document.getElementById("ajax-online-set").style.display="none";
    document.getElementById("ajax-wrong-set").style.display="none";
    var realModuleHead=document.getElementsByClassName("real-module-head")[0];
    realModuleHead.innerHTML="";
    realModuleHead.innerHTML+="<div class=\"module-head\">\n" +
        "        <h3>练习的试卷(<span id=\"count-paper\"></span>)</h3>\n" +
        "        <label><input type=\"checkbox\" checked=\"checked\" onclick=\"isComplete()\" id=\"complete\">只看已完成的</label>\n" +
        "    </div>";
    showCompletePaper(url_showQuestionPaper+userId);
}

/**
 * 去错题集
 */
function go2WrongTitleSet() {
    var q1a=document.getElementById("q1");
    var q2a=document.getElementById("q2");
    var q3a=document.getElementById("q3");
    var q1li=q1a.parentElement;
    var q2li=q2a.parentElement;
    var q3li=q3a.parentElement;
    q2a.style.color="#FFF";
    q1a.style.color="#2A2F35";
    q3a.style.color="#2A2F35";
    q1li.style.backgroundColor="#FFF";
    q2li.style.backgroundColor="#00bc9b";
    q3li.style.backgroundColor="#FFF";
    document.getElementById("ajax-real-quiz-paper").style.display="none";
    document.getElementById("ajax-online-set").style.display="none";
    document.getElementById("ajax-wrong-set").style.display="block";
    var wrongModuleHead=document.getElementsByClassName("wrong-module-head")[0];
    var checkBoxNotPass=document.getElementById("not-pass");
    checkBoxNotPass.checked=false;
    wrongModuleHead.innerHTML="";
    wrongModuleHead.innerHTML+="<div class=\"module-head\">\n" +
        "                        <h3>历史错题总数(<span id=\"wrong-count\"></span>)</h3>\n" +
        "                        <h4>未通过错题总数(<span id=\"nopass-count\"></span>)</h4>\n" +
        "                    </div>";
    showWrongSetV2();
}

/**
 * 去在线题目页面
 */
function go2OnlineTopics() {
    var q1a=document.getElementById("q1");
    var q2a=document.getElementById("q2");
    var q3a=document.getElementById("q3");
    var q1li=q1a.parentElement;
    var q2li=q2a.parentElement;
    var q3li=q3a.parentElement;
    q3a.style.color="#FFF";
    q1a.style.color="#2A2F35";
    q2a.style.color="#2A2F35";
    q1li.style.backgroundColor="#FFF";
    q2li.style.backgroundColor="#FFF";
    q3li.style.backgroundColor="#00bc9b";
    document.getElementById("ajax-real-quiz-paper").style.display="none";
    document.getElementById("ajax-online-set").style.display="block";
    document.getElementById("ajax-wrong-set").style.display="none";
    showOnLineSetV2();
}

/**
 * 显示完成或未完成的
 */
function isComplete() {
    var complete=document.getElementById("complete");
    //只显示已完成
    if(complete.checked){
        showCompletePaper(url_showQuestionPaper+userId);
    }
    //显示所有
    else {
        showBrushQuestions(url_showQuestionPaper+userId);
    }
}


