<%--
  Created by IntelliJ IDEA.
  User: Dave
  Date: 2018/10/22
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实名认证</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/realName-authentication.css">
</head>
<body style="background-color: #ededed;">
    <%@include file="../head.jsp"%>
    <!--主体部分-->
    <div class="content">
        <div class="main">
            <div class="main-top">

            </div>
            <div class="authentication">
                <form action="${pageContext.request.contextPath}/user/basicInfo/realNameAuthentication" method="post">
                    <input type="hidden" name="userId" value="${user.userId}">
                    <div class="input-authentication"><span>姓名：</span><div><input type="text" name="userRealName" placeholder="请输入您的真实姓名"></div></div>
                    <div class="input-authentication"><span>身份证号码：</span><div><input type="text" name="userIdcard" id="id-card" placeholder="请输入有效的18位身份证号码" onclick="clearError()" onblur="isCardNo()"></div></div>
                    <div class="tips"><span class="error-tip"></span></div>
                    <div class="input-authentication"><input type="submit" value="确认提交"></div>
                </form>
            </div>
        </div>
    </div>

    <%@include file="../footer.jsp"%>

    <script type="text/javascript">
        function isCardNo() {
            var idCard=document.getElementById("id-card").value;
            if(testId(idCard)){
                document.getElementsByClassName("error-tip")[0].innerText="";
            }
            if(idCard==""){
                document.getElementsByClassName("error-tip")[0].innerText="身份证号码不能为空！";
            }
           if(!testId(idCard)){
                document.getElementsByClassName("error-tip")[0].innerText="身份证号码格式错误！";
            }
        }

        function clearError() {
            document.getElementsByClassName("error-tip")[0].innerText="";
        }

        //校验身份证号码正确性
        function testId(id) {
            var format = /^(([1][1-5])|([2][1-3])|([3][1-7])|([4][1-6])|([5][0-4])|([6][1-5])|([7][1])|([8][1-2]))\d{4}(([1][9]\d{2})|([2]\d{3}))(([0][1-9])|([1][0-2]))(([0][1-9])|([1-2][0-9])|([3][0-1]))\d{3}[0-9xX]$/;
            //号码规则校验
            if (!format.test(id)) {
                return false;
            }
            //区位码校验
            //出生年月日校验   前正则限制起始年份为1900;
            var year = id.substr(6, 4),//身份证年
                month = id.substr(10, 2),//身份证月
                date = id.substr(12, 2),//身份证日
                time = Date.parse(month + '-' + date + '-' + year),//身份证日期时间戳date
                now_time = Date.parse(new Date()),//当前时间戳
                dates = (new Date(year, month, 0)).getDate();//身份证当月天数
            if (time > now_time || date > dates) {
                return false;
            }
            //校验码判断
            var c = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];   //系数
            var b = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];  //校验码对照表
            var id_array = id.split("");
            var sum = 0;
            for (var k = 0; k < 17; k++) {
                sum += parseInt(id_array[k]) * parseInt(c[k]);
            }
            return id_array[17].toUpperCase() === b[sum % 11].toUpperCase();
        }

    </script>
</body>
</html>
