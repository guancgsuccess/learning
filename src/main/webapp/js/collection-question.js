
/**
 * 点击收藏界面中的题目内容触发的函数
 * @param obj 题目id
 */
function ifQuestionClickC(obj) {
    var showWrongQuestion_detail_url=url_showWrongQuestion_detail+obj;
    window.location=showWrongQuestion_detail_url;
}

/**
 * 点击收藏界面中的试卷标题触发的函数
 * @param obj 试卷id
 */
function ifPaperClickC(obj) {
    var url_question_test = "/questionbank/test/"+obj;
    window.location = url_question_test;
}
//查看用户收藏题目url
var url_showAllCollectionsByUserId="/brushQuestion/showAllCollectionsByUserId/";

/**
 * 查看用户收藏题目
 */

function showCollectionSetV2() {
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else {
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url_showAllCollectionsByUserId+userId,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=afterPerformShowAllCollectionsByUserId;
    xhr.send();
}

/**
 * 在执行完url_showAllCollectionsByUserId="
 * /brushQuestion/showAllCollectionsByUserId/"
 * 拿到数据渲染页面
 */
function afterPerformShowAllCollectionsByUserId() {
    if(xhr.readyState==4&&xhr.status==200){
        //获取JSON数据中的收藏题目信息集合
        var collectionQuestions=JSON.parse(xhr.responseText);
        //获取收藏题目数量
        var collectionCount=collectionQuestions.length;
        document.getElementById("collection").innerText=collectionCount;
        //获得要渲染的标签
        var moduleCollection=document.getElementById("module-collection");
        moduleCollection.innerHTML="";
        for(var i=0;i<collectionQuestions.length;i++){
            var collectionQuestion=collectionQuestions[i];
            moduleCollection.innerHTML+="<li>\n" +
                "                                <span onclick=\"ifQuestionClickC("+collectionQuestion.questionId+")\" title='"+collectionQuestion.questionContext+"'>"+collectionQuestion.questionContext+"</span>\n" +
                "                                <span>"+collectionQuestion.questionTypeLanguage+"</span>\n" +
                "                                <span onclick=\"ifPaperClickC("+collectionQuestion.questionPaperId+")\" title='"+collectionQuestion.questionPaperTitle+"'>"+collectionQuestion.questionPaperTitle+"</span>\n" +
                "                                <a href=\"javascript:void(0);\" onclick=\"editCollection("+collectionQuestion.questionId+")\">编辑</a>\n" +
                "                            </li>";
        }

    }
}