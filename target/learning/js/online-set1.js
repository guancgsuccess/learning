//展示在线题目url
var url_show_onlineQuestionsv2="/brushQuestion/findAllOnlineQuestionsV2";

/**
 * 展示在线题目
 */
function showOnLineSetV2() {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else {
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url_show_onlineQuestionsv2,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=loadOnLineQuestionsV2;
    xhr.send();
}

/**
 * 渲染在线题目页面
 */
function loadOnLineQuestionsV2() {
    if(xhr.readyState==4&&xhr.status==200){
        var onlineQuestions=JSON.parse(xhr.responseText);
        var onlineModule=document.getElementById("module-online-set");
        onlineModule.innerHTML="";
        for(var i=0;i<onlineQuestions.length;i++){
            var onlineQuestion=onlineQuestions[i];
            onlineModule.innerHTML+=" <div class=\"empty-main-body\">\n" +
                "                                    <p style=\"position: relative;\">\n" +
                "                                        <a href=\"javascript:void(0);\" onclick=\"ifClickQuestionContextO("+onlineQuestion.questionId+")\" title='"+onlineQuestion.questionContext+"'>"+onlineQuestion.questionContext+"</a>\n" +
                "                                    </p>\n" +
                "                                    <p><span>"+onlineQuestion.questionTypeLanguage+"</span></p>\n" +
                "                                    <p><a href=\"javascript:void(0);\" onclick=\"ifClickPaperTitleO("+onlineQuestion.questionPaperId+")\" title='"+onlineQuestion.questionPaperTitle+"'>"+onlineQuestion.questionPaperTitle+"</a></p>\n" +
                "                                    <p class=\"see-detail\"><a href=\"javascript:void(0);\" onclick=\"getQuestionDetailO("+onlineQuestion.questionId+")\">查看详情</a></p>\n" +
                "                                </div>";
        }
    }
}


/**
 * 跳转到题目详情页面
 * @param obj questionId
 */
function ifClickQuestionContextO(obj) {
    var showWrongQuestion_detail_url=url_showWrongQuestion_detail+obj;
    window.location=showWrongQuestion_detail_url;
}

/**
 * 跳转到做试卷页面
 * @param obj questionPaperId
 */
function ifClickPaperTitleO(obj) {
    var url_question_test = "/questionbank/test/"+obj;
    window.location = url_question_test;
}

/**
 * 查看题目详情
 * @param obj 题目id
 */
function getQuestionDetailO(obj) {
    var showWrongQuestion_detail_url=url_showWrongQuestion_detail+obj;
    window.location=showWrongQuestion_detail_url;
}