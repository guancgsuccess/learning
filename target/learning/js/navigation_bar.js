var userId=null;
var xhr=null;
var sessionGender=null;
var realName=null;
var url_showQuestionPaper="/brushQuestion/findQuestionPaper4Show/";
function getSessionUserId(obj) {
  userId=obj;
}
function getSessionGender(obj) {
    sessionGender=obj;
}
function getSessionUserRealName(obj) {
    realName=obj;
}
function go2PersonalInfo() {
    document.getElementById("ajax-personal-info").style.display="block";
    document.getElementById("ajax-brush-questions").style.display="none";
    document.getElementById("ajax-collection-question").style.display="none";
    document.getElementById("ajax-basic-info").style.display="none";
    document.getElementById("ajax-setting").style.display="none";
}

function go2BrushQuestion() {
    document.getElementById("ajax-personal-info").style.display="none";
    document.getElementById("ajax-collection-question").style.display="none";
    document.getElementById("ajax-basic-info").style.display="none";
    document.getElementById("ajax-setting").style.display="none";
    document.getElementById("ajax-brush-questions").style.display="block";
    go2RealQuizPaper();
}

function go2Collection() {
    document.getElementById("ajax-personal-info").style.display="none";
    document.getElementById("ajax-brush-questions").style.display="none";
    document.getElementById("ajax-basic-info").style.display="none";
    document.getElementById("ajax-setting").style.display="none";
    document.getElementById("ajax-collection-question").style.display="block";
    showCollectionSetV2();
}

/**
 * 前往基本资料展示界面
 */
function go2BasicInfo() {
    document.getElementById("ajax-personal-info").style.display="none";
    document.getElementById("ajax-brush-questions").style.display="none";
    document.getElementById("ajax-collection-question").style.display="none";
    document.getElementById("ajax-basic-info").style.display="block";
    document.getElementById("ajax-setting").style.display="none";
    transfer2Cancel();
}

/**
 * 前往基本资料的编辑界面
 */
function go2BasicInfo4Edit() {
    go2BasicInfo();
    transfer2Edit();
}


function go2Setting() {
    document.getElementById("ajax-personal-info").style.display="none";
    document.getElementById("ajax-brush-questions").style.display="none";
    document.getElementById("ajax-collection-question").style.display="none";
    document.getElementById("ajax-basic-info").style.display="none";
    document.getElementById("ajax-setting").style.display="block";
    loadSetting();
}
