//查看错题详情url，并加载相应题目的评论
var url_showWrongQuestion_detail="/brushQuestion/showWrongQuestion/loadQuestionDetailAndComment/";
//展示所有错题
var url_showAllWrongQuestions="/brushQuestion/showAllWrongQuestions/";


/**
 * 展示错题集
 */
function showWrongSetV2() {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else {
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url_showAllWrongQuestions+userId,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=afterPerformShowWrongSetV2;
    xhr.send();
}


function afterPerformShowWrongSetV2(){
    if(xhr.readyState==4&&xhr.status==200){
        //获取错题集
        var wrongQuestions=JSON.parse(xhr.responseText);
        //获取做错的题目再次做未通过的个数
        var notPassQuestionCount=0;
        //获取错题个数
        var wrongQuestionCount=wrongQuestions.length;
        //获取要渲染的位置
        var wrongModule=document.getElementById("module-wrong-set");
        wrongModule.innerHTML="";
        for(var i=0;i<wrongQuestions.length;i++){
            var wrongQuestion=wrongQuestions[i];
            if(wrongQuestion.questionCorrect==1&&wrongQuestion.questionAnsweredStatus==0){
                wrongModule.innerHTML+="<div class=\"empty-main-body\">\n" +
                    "                                    <p style=\"position: relative;\">\n" +
                    "                                        <span class=\"right-icon\"></span>\n" +
                    "                                        <a href=\"javascript:void(0)\" onclick=\"ifClickQuestionContextW("+wrongQuestion.questionId+")\" style=\"margin-left: 10px\" title='"+wrongQuestion.questionContext+"'>"+wrongQuestion.questionContext+"</a>\n" +
                    "                                    </p>\n" +
                    "                                    <p><span>"+wrongQuestion.questionTypeLanguage+"</span></p>\n" +
                    "                                    <p><a href=\"javascript:void(0)\" onclick=\"ifClickPaperTitleW("+wrongQuestion.questionPaperId+")\" title='"+wrongQuestion.questionPaperTitle+"'>"+wrongQuestion.questionPaperTitle+"</a></p>\n" +
                    "                                    <p class=\"see-detail\"><a href=\""+url_showWrongQuestion_detail+wrongQuestion.questionId+"\">查看详情</a></p>\n" +
                    "                                </div>";
            }
            if(wrongQuestion.questionCorrect==1&&wrongQuestion.questionAnsweredStatus==1){
                notPassQuestionCount++;
                wrongModule.innerHTML+="<div class=\"empty-main-body\">\n" +
                    "                                    <p style=\"position: relative;\">\n" +
                    "                                        <span class=\"wrong-icon\"></span>\n" +
                    "                                        <a href=\"javascript:void(0)\" onclick=\"ifClickQuestionContextW("+wrongQuestion.questionId+")\" style=\"margin-left: 10px\" title='"+wrongQuestion.questionContext+"'>"+wrongQuestion.questionContext+"</a>\n" +
                    "                                    </p>\n" +
                    "                                    <p><span>"+wrongQuestion.questionTypeLanguage+"</span></p>\n" +
                    "                                    <p><a href=\"javascript:void(0)\" onclick=\"ifClickPaperTitleW("+wrongQuestion.questionPaperId+")\" title='"+wrongQuestion.questionPaperTitle+"'>"+wrongQuestion.questionPaperTitle+"</a></p>\n" +
                    "                                    <p class=\"see-detail\"><a href=\""+url_showWrongQuestion_detail+wrongQuestion.questionId+"\">查看详情</a></p>\n" +
                    "                                </div>";
            }
        }
        document.getElementById("wrong-count").innerText=wrongQuestionCount;
        document.getElementById("nopass-count").innerText=notPassQuestionCount;
    }
}


/**
 * 展示未通过的错题集
 */
function showNotPassWrongSetV2() {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else {
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url_showAllWrongQuestions+userId,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=afterPerformShowNotPassWrongSetV2;
    xhr.send();
}


function afterPerformShowNotPassWrongSetV2() {
    if(xhr.readyState==4&&xhr.status==200){
        //获取错题集
        var wrongQuestions=JSON.parse(xhr.responseText);
        //获取做错的题目再次做未通过的个数
        var notPassQuestionCount=0;
        //获取错题个数
        var wrongQuestionCount=wrongQuestions.length;
        //获取要渲染的位置
        var wrongModule=document.getElementById("module-wrong-set");
        wrongModule.innerHTML="";
        for(var i=0;i<wrongQuestions.length;i++){
            var wrongQuestion=wrongQuestions[i];
            if(wrongQuestion.questionCorrect==1&&wrongQuestion.questionAnsweredStatus==1){
                notPassQuestionCount++;
                wrongModule.innerHTML+="<div class=\"empty-main-body\">\n" +
                    "                                    <p style=\"position: relative;\">\n" +
                    "                                        <span class=\"wrong-icon\"></span>\n" +
                    "                                        <a href=\"javascript:void(0)\" onclick=\"ifClickQuestionContextW("+wrongQuestion.questionId+")\" style=\"margin-left: 10px\" title='"+wrongQuestion.questionContext+"'>"+wrongQuestion.questionContext+"</a>\n" +
                    "                                    </p>\n" +
                    "                                    <p><span>"+wrongQuestion.questionTypeLanguage+"</span></p>\n" +
                    "                                    <p><a href=\"javascript:void(0)\" onclick=\"ifClickPaperTitleW("+wrongQuestion.questionPaperId+")\" title='"+wrongQuestion.questionPaperTitle+"'>"+wrongQuestion.questionPaperTitle+"</a></p>\n" +
                    "                                    <p class=\"see-detail\"><a href=\""+url_showWrongQuestion_detail+wrongQuestion.questionId+"\">查看详情</a></p>\n" +
                    "                                </div>";
            }
        }
        document.getElementById("wrong-count").innerText=wrongQuestionCount;
        document.getElementById("nopass-count").innerText=notPassQuestionCount;
    }
}


/**
 * 当点击题目内容的时候
 * @param obj 题目id
 */
function ifClickQuestionContextW(obj) {
    var showWrongQuestion_detail_url=url_showWrongQuestion_detail+obj;
    window.location=showWrongQuestion_detail_url;
}

/**
 * 当点击试卷内容的时候跳到试卷做题界面
 * @param obj 试卷id
 */
function ifClickPaperTitleW(obj) {
    var url_question_test = "/questionbank/test/"+obj;
    window.location = url_question_test;
}


/**
 * 显示历史错题和未通过题目
 */
function isNotPassChecked() {
    var notPass=document.getElementById("not-pass");
    if(notPass.checked){
        showNotPassWrongSetV2();
    }else{
        showWrongSetV2();
    }
}


