//1、验证手机号码
var xhr = null;
function checkPhone(that) {
    var regular = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
    if(!regular.test(that.value)){
        document.getElementById("valid_userName").style.display = "block";
        document.getElementById("valid_userName").innerText = "请填写正确的手机号码";
        return false;
    }else {
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        var phone = that.value;
        var url_checkphone =  "/user/checkphone/"+phone;
        xhr.open("GET",url_checkphone, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.onreadystatechange = checkPhoneFromData;
        xhr.send();
    }
}
function checkPhoneFromData() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        var result = JSON.parse(xhr.responseText);
        if(result=="1"){
            document.getElementById("valid_userName").style.display = "block";
            document.getElementById("valid_userName").innerText = "该手机号码已经被注册了";
            return false;
        }else {
            document.getElementById("valid_userName").style.display = "none";
            return true;
        }
    }
}

//2、验证密码
function checkPwd(that) {
    var regular = /^[a-zA-Z]\w{5,17}$/;
    if(!regular.test(that.value)){
        document.getElementById("valid_pwd1").style.display = "block";
        document.getElementById("valid_pwd1").innerText = "密码必须以字母开头，长度在6~18之间，只能包含字母、数字和下划线";
        return false;
    }else {
        document.getElementById("valid_pwd1").style.display = "none";
        return true;
    }
}

//3、验证二次密码
function checkPwd2(that) {
    var pwd1 = document.getElementById("pwd1").value;
    var pwd2 = document.getElementById("pwd2").value;
    if(pwd1==pwd2){
        document.getElementById("valid_pwd2").style.display = "none";
        return true;
    }else{
        document.getElementById("valid_pwd2").style.display = "block";
        document.getElementById("valid_pwd2").innerText = "两次密码不一致";
        return false;
    }
}

//4、验证码
var validTime = 99;
function forValid(){
    document.getElementById("validCode").style.display = "none";
    document.getElementById("valid_text").innerText = "";
    var phoneEle = document.getElementById("login_input1");
    var flag = checkPhone(phoneEle);
    if(flag){
        forValidTime(validTime);
        var phone = phoneEle.value;
        var url_forValid = "/user/forValid/"+phone;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET", url_forValid, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        /*xhr.onreadystatechange = getValidCode();*/
        xhr.send();
    }
}
function forValidTime(that) {
    var timer = window.setTimeout("forValidTime("+(validTime--)+")",1*1000);
    if(that>0) {
        document.getElementById("for_valid").innerText = that + "秒后重新获取";
        document.getElementById("for_valid").disabled = true;
    }else {
        document.getElementById("for_valid").innerText = "重新获取验证码";
        document.getElementById("for_valid").disabled = false;
        clearTimeout(timer);
        validTime = 99;
    }
}
function getValidCode() {
    var data = null;
    if (xhr.readyState == 4 && xhr.status == 200) {
        data = JSON.parse(xhr.responseText);
        var phone = document.getElementById("login_input1").value;
        var validText = document.getElementById("valid_text").value + phone;
        var flag = (validText == data);
        if (validTime != 90 && data != null) {
            if (flag) {
                return true;
            } else {
                document.getElementById("validCode").style.display = "block";
                document.getElementById("validCode").innerText = "验证码不正确";
                return false;
            }
        } else {
            document.getElementById("validCode").style.display = "block";
            document.getElementById("validCode").innerText = "验证码失效了";
            return false;
        }
    }else {
        document.getElementById("validCode").style.display = "block";
        document.getElementById("validCode").innerText = "请点击获取验证码";
        return false;
    }
    if(data==null){
        document.getElementById("validCode").style.display = "block";
        document.getElementById("validCode").innerText = "请点击获取验证码";
        return false;
    }
}

function checkAll() {
    var phone = document.getElementById("login_input1")
    var pwd1 = document.getElementById("pwd1");
    var pwd2 = document.getElementById("pwd2");
    return checkPhone(phone)&&checkPwd(pwd1)&&checkPwd2(pwd2)&&getValidCode();
}
