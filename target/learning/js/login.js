var xhr=null;//创建ajax对象
var login_url="/user/login";
var accountNo=null;
var userPassword=null;
function login() {
    accountNo=document.getElementById("login_accountNo").value;
    userPassword=document.getElementById("login_pwd").value;
    var formData="accountNo="+accountNo+"&userPassword="+userPassword;
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else{
        xhr=new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("POST",login_url,true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
    xhr.onreadystatechange=processLogin;
    xhr.send(formData);
}

function processLogin() {
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        if(result.status==0){
            window.location="/index.jsp";
        }else{
            if(result.status==2) {
                document.getElementById("error-tip1").innerText="";
                document.getElementById("error-tip1").innerText = result.msg;
            }else if(result.status==1){
                document.getElementById("error-tip2").innerText="";
                document.getElementById("error-tip2").innerText = result.msg;
            }else if(result.status==3){
                document.getElementById("error-tip1").innerText="";
                document.getElementById("error-tip1").innerText = result.msg;
            }
        }
    }
}

function input() {
    document.getElementById("error-tip1").innerText="";
    document.getElementById("error-tip2").innerText="";
}