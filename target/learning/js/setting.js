var xhr=null;
var url_check_old_pwd="/user/setting/checkOldPwd/";
var url_save_phone="/user/setting/phone";
var url_save_email="/user/setting/email";
var url_save_pwd="/user/setting/password";
var url_send_phone_code="/user/setting/sendPhoneCode/";
var url_send_email_code="/user/setting/sendEmailCode/";
var phoneTimer=60;
var emailTimer=60;


/**
 * 发送手机验证码
 */
function sendPhoneCode(obj) {
    var phone=document.getElementById("input-phone").value;
    var myreg=/^[1][3,4,5,7,8,9][0-9]{9}$/;
    if(phone!=""&&phone.length==11&&myreg.test(phone)) {
        clickPhoneButton(obj);//倒计时
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET", url_send_phone_code + phone, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.send();
    }else {
        checkTel(phone);
    }
}

/**
 * 发送邮箱验证码
 */
function sendEmailCode(obj) {
    var email=document.getElementById("input-email").value;
    var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    if(email!=""&&myReg.test(email)){
        clickEmailButton(obj);//倒计时
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("GET",url_send_email_code+email+"&"+userId , true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
        xhr.send();
    }else {
        checkEmail();
    }
}


/**
 * 设置发送手机短信计时器
 * @param obj this
 */
function clickPhoneButton(obj) {
        if (phoneTimer == 0) {
            obj.removeAttribute("disabled");
            obj.value = "获取验证码";
            obj.style.cursor = "pointer";
            phoneTimer = 60;
            return;
        } else {
            obj.setAttribute("disabled", true);
            obj.style.cursor = "wait";
            obj.value = "重新发送(" + phoneTimer + ")";
            phoneTimer--;
        }
        setTimeout(function () {
                clickPhoneButton(obj)
            }
            , 1000);
}

/**
 * 设置发送邮箱验证码计时器
 * @param obj
 */
function clickEmailButton(obj) {
    if (emailTimer == 0) {
        obj.removeAttribute("disabled");
        obj.value="获取验证码";
        obj.style.cursor="pointer";
        emailTimer = 60;
        return;
    } else {
        obj.setAttribute("disabled", true);
        obj.value="重新发送(" + emailTimer + ")";
        obj.style.cursor="wait";
        emailTimer--;
    }
    setTimeout(function() {
            clickEmailButton(obj) }
        ,1000);
}

/**
 * 保存成功验证的手机号
 * @param obj
 */
function savePhone(obj) {
    var phone=document.getElementById("input-phone").value;
    var inputCode=document.getElementById("input-phone-code").value;
    var myreg=/^[1][3,4,5,7,8,9][0-9]{9}$/;
    if(phone!=""&&phone.length==11&&myreg.test(phone)) {
        var formData = "userId=" + obj + "&userPhone=" + phone + "&inputCode=" + inputCode;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("PUT", url_save_phone, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        xhr.onreadystatechange = loadPhone;
        xhr.send(formData);
    }else {
        checkTel(phone);
    }
}

function loadPhone(){
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        var msg=result.msg;
        var userPhone=result.userPhone;
        document.getElementById("error-tip1").innerText=msg;
        if(userPhone!=null) {
            document.getElementById("user-phone").innerText = userPhone;
            phoneTimer=0;
            document.getElementById("error-tip1").innerText="";
            document.getElementById("input-phone").value="";
            document.getElementById("input-phone-code").value="";
        }
    }
}

/**
 * 保存邮箱验证正确的邮箱
 * @param obj
 */
function saveEmail(obj) {
    var email=document.getElementById("input-email").value;
    var inputCode=document.getElementById("input-email-code").value;
    var emailPattern=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    if(email!=""&&emailPattern.test(email)) {
        var formData = "userId=" + obj + "&userEmail=" + email + "&inputCode=" + inputCode;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("PUT", url_save_email, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        xhr.onreadystatechange = loadEmail;
        xhr.send(formData);
    }else {
        checkEmail(email);
    }
}

function loadEmail() {
    if(xhr.readyState==4&&xhr.status==200){
        var result=JSON.parse(xhr.responseText);
        var msg=result.msg;
        var userEmail=result.userEmail;
        document.getElementById("error-tip2").innerText=msg;
        if(userEmail!=null) {
            document.getElementById("user-email").innerText = userEmail;
            emailTimer=0;
            document.getElementById("error-tip2").innerText="";
            document.getElementById("input-email").value="";
            document.getElementById("input-email-code").value="";
        }
    }
}


function savePassword(obj) {
    var oldPassword=document.getElementById("input-password-old").value;
    var newPassword=document.getElementById("input-password-new").value;
    var rePassword=document.getElementById("repassword").value;
    if(oldPassword!=""&&newPassword!=""&&rePassword!=""&&newPassword==rePassword) {
        var new_password = document.getElementById("input-password-new").value;
        var formData = "userId=" + obj + "&userPassword=" + new_password;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject('Microsoft.XMLHTTP');
        }
        xhr.open("PUT", url_save_pwd, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        xhr.onreadystatechange = loadPassword;
        xhr.send(formData);
    }else {
        checkPwd();
    }
}

function loadPassword() {
    if(xhr.readyState==4&&xhr.status==200){
        document.getElementById("input-password-old").value="";
        document.getElementById("input-password-new").value="";
        document.getElementById("repassword").value="";
        alert("密码修改成功！");
    }
}

/**
 * 判断手机号码格式是否正确
 * @param obj
 */
function checkTel(obj) {
    var telPattern= /^[1][3,4,5,7,8,9][0-9]{9}$/;
    if(!telPattern.test(obj)) {
        document.getElementById("input-phone").style.backgroundImage = "url('/image/输入错误.png')";
        if(obj!="") {
            document.getElementById("error-tip1").innerText = "手机号码格式错误！";
        }else{
            document.getElementById("error-tip1").innerText = "手机号码不能为空！";
        }
    }
}

/**
 * 判断邮箱格式是否正确
 */
function checkEmail(obj) {
    var emailPattern=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
    if(!emailPattern.test(obj)) {
        document.getElementById("input-email").style.backgroundImage = "url('/image/输入错误.png')";
        if(obj!="") {
            document.getElementById("error-tip2").innerText = "邮箱格式不正确！";
        }
        if(obj==""){
            document.getElementById("error-tip2").innerText = "邮箱不能为空！";
        }
    }
}

/**
 * 当输入手机号时边框的样式
 */
function inputTel() {
    document.getElementById("input-phone").style.backgroundImage="url('/image/正在输入.png')";
    document.getElementById("error-tip1").innerText="";
}

/**
 * 当输入邮箱时边框的样式
 */
function inputEmail() {
    document.getElementById("input-email").style.backgroundImage="url('/image/正在输入.png')";
    document.getElementById("error-tip2").innerText="";
}

/**
 * 当输入原密码时边框的样式
 */
function inputOldPwd() {
    document.getElementById("input-password-old").style.backgroundImage="url('/image/正在输入.png')";
    document.getElementById("error-tip3").innerText="";
}
/**
 * 当输入新密码时边框的样式
 */
function inputNewPwd() {
    if(document.getElementById("input-password-old").value==""){
        document.getElementById("input-password-old").style.backgroundImage="url('/image/输入错误.png')";
        document.getElementById("error-tip3").innerText="请输入原密码";
    }else {
        checkOldPwd();
        document.getElementById("input-password-new").style.backgroundImage = "url('/image/正在输入.png')";
        document.getElementById("error-tip3").innerText = "";
    }
}
/**
 * 当再次输入确认密码时边框的样式
 */
function inputRePwd() {
    document.getElementById("repassword").style.backgroundImage="url('/image/正在输入.png')";
    document.getElementById("error-tip3").innerText="";
}

/**
 * 判断新密码与再次输入的是否一致
 */
function checkPwd() {
    var oldpwd=document.getElementById("input-password-old").value;
    var pwd=document.getElementById("input-password-new").value;
    var rePwd=document.getElementById("repassword").value;
    if(pwd!=rePwd){
        document.getElementById("error-tip3").innerText="两次密码不一致！请重新输入";
    }
    if(pwd==""){
        document.getElementById("error-tip3").innerText="新密码不能为空！";
    }
    if(oldpwd==""){
        document.getElementById("error-tip3").innerText="请输入原密码！";
    }
}

/**
 * 判断原密码是否正确
 */
function checkOldPwd() {
    var pwd=document.getElementById("input-password-old").value;
    if(window.XMLHttpRequest){
        xhr=new XMLHttpRequest();
    }else{
        xhr = new ActiveXObject('Microsoft.XMLHTTP');
    }
    xhr.open("GET",url_check_old_pwd+pwd,true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange=loadOldPwd;
    xhr.send();
}

function loadOldPwd() {
    if(xhr.readyState==4&&xhr.status==200) {
        var result=JSON.parse(xhr.responseText);
        var msg=result.msg;
        if(msg!=null) {
            document.getElementById("input-password-old").style.backgroundImage="url('/image/输入错误.png')";
            document.getElementById("error-tip3").innerText = msg;
            document.getElementById("input-password-old").value="";
        }
    }
}


