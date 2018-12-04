//执行修改标签名的url
var url_edit_collection_changeTagName="/brushQuestion/collection/editCollectionQuestion/changeTagName";
//执行删除收藏的url
var url_edit_collection_deleteQuestion="/brushQuestion/collection/editCollectionQuestion/deleteQuestion";
function editCollection(obj) {
    var editCollection=document.getElementById("click-edit-collection");
    editCollection.innerHTML="";
    editCollection.innerHTML+="<div class=\"zhezhao\" id=\"zhezhao\"></div>\n" +
        "        <div class=\"collection-edit\" id=\"collection-edit\">\n" +
        "            <div class=\"edit-collection\">\n" +
        "                <div class=\"edit-collection-header\">\n" +
        "                    <span id=\"flag-red\"></span>\n" +
        "                    <p>修改收藏</p>\n" +
        "                    <span id=\"cancel-x\" onclick=\"cancelCollection()\"></span>\n" +
        "                </div>\n" +
        "                <div class=\"edit-collection-body\">\n" +
        "                    <div class=\"edit-tag\">\n" +
        "                        <span class=\"collection-tag\"></span>\n" +
        "                        <input type=\"text\" placeholder=\"输入标签，点击下方修改确定\" id=\"input-tag\">\n" +
        "                    </div>\n" +
        "                    <div class=\"edit-collection-body-main\">\n" +
        "                        <a href=\"javascript:void(0);\" onclick=\"changeTagName("+obj+")\" class=\"change-tag\">修改收藏标签</a>\n" +
        "                        <div class=\"cut-line\">\n" +
        "                            <span>或者</span>\n" +
        "                        </div>\n" +
        "                        <a href=\"javascript:void(0);\" onclick=\"deleteCollection("+obj+")\" class=\"delete-collection\">删除收藏</a>\n" +
        "                    </div>\n" +
        "                </div>\n" +
        "            </div>\n" +
        "        </div>";
    document.getElementById("zhezhao").style.display="block";
    document.getElementById("zhezhao").style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
    document.getElementById("html").style.overflow="hidden";
    document.getElementById("collection-edit").style.display="block";

}
function cancelCollection() {
    document.getElementById("zhezhao").style.display="none";
    document.getElementById("html").style.overflow="visible";
    document.getElementById("collection-edit").style.display="none";
}

/**
 * 修改标签名
 * @param obj 题目id
 */
function changeTagName(obj) {
    var tagName=document.getElementById("input-tag").value;
    var formData="userId="+userId+"&questionId="+obj+"&tagName="+tagName;
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else {
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("PUT",url_edit_collection_changeTagName,true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
    xhr.onreadystatechange=afterChangeTagName;
    xhr.send(formData);
}

function afterChangeTagName() {
    if(xhr.readyState==4&&xhr.status==200){
        cancelCollection();
        showCollectionSetV2();
        alert("修改标签名成功");
    }
}

/**
 * 删除收藏
 * @param obj 题目id
 */
function deleteCollection(obj) {
    //_method=delete  解决DeleteMapping接收到的参数都为null的情况
    var formData="_method=delete"+"&userId="+userId+"&questionId="+obj;
    var ifDelete=confirm("确定要删除么？");
    if(ifDelete==true) {
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("POST", url_edit_collection_deleteQuestion, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        xhr.onreadystatechange = afterDeleteQuestion;
        xhr.send(formData);
    }
}

function afterDeleteQuestion() {
    if(xhr.readyState==4&&xhr.status==200){
        cancelCollection();
        showCollectionSetV2();
    }
}