/**
 * 基本资料上面点击取消触发的函数
 */
function transfer2Cancel() {
    document.getElementById("id-edit").style.display="block";
    document.getElementById("id-save").style.display="none";
    document.getElementById("id-cancel").style.display="none";
    document.getElementsByClassName("info-box")[0].style.display="block";
    document.getElementsByClassName("info-edit-box")[0].style.display="none";
}


/**
 * 基本资料编辑界面保存触发的函数
 */
function saveEdit() {
    //获得用户id
    var userId=document.getElementById("user-id").value;
    //获得用户姓名
    var userName=document.getElementById("user-name").value;
    //获得用户的个人简介
    var userSpare=document.getElementById("user-spare").value;
    //获得用户的住址
    var userAddress=document.getElementById("user-address").value;
    //获得用户的院校
    var userSchool=document.getElementById("user-school").value;
    //获得用户的工作经历
    var userWorkExperience=document.getElementById("user-exp").value;
    //将用户信息封装成formData通过ajax发送到后台
    var formData="userId="+userId+"&userName="+userName+"&userSpare="+userSpare+"&userGender="+sessionGender+
        "&userAddress="+userAddress+"&userSchool="+userSchool+"&userWorkExperience="+userWorkExperience;
   //执行保存的url对应controller的二级控制器
    var url_edit="/user/basicInfo/editInfo";
    //创建ajax对象
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else{
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    //发送put请求修改user的信息
    xhr.open("PUT",url_edit,true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
    xhr.onreadystatechange=refreshAfterEdit;
    xhr.send(formData);
}
//刷新修改过后的个人中心界面
function refreshAfterEdit() {
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        //如果修改成功
        if(result.status=="success"){
            window.location="/transfer/go2PersonalCenter";
        }
    }
}

/**
 * 如果选中男生，背景色改变
 */
function checkBoy() {
    sessionGender="男生";
    document.getElementsByClassName("boy")[0].style.backgroundColor="#00bfff";
    document.getElementsByClassName("girl")[0].style.backgroundColor="#bbbbbb";
}

/**
 * 如果选中女生，背景色改变
 */
function checkGirl() {
    sessionGender="女生";
    document.getElementsByClassName("girl")[0].style.backgroundColor="#e773a3";
    document.getElementsByClassName("boy")[0].style.backgroundColor="#bbbbbb";
}

