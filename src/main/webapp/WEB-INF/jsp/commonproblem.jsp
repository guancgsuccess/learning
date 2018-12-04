<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/10
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-常见问题</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/commonproblem.css">
</head>
<body>
    <%@include file="head.jsp"%>

    <div id="commonproblem">
        <div id="commonproblem_blank_top"></div>
        <div id="commonproblem_content">
            <div id="commonproblem_left">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/aboutus">关于我们</a></li>
                    <li class="selected"><a href="${pageContext.request.contextPath}/commonproblem">常见问题</a></li>
                    <li><a href="">企业服务</a></li>
                    <li><a href="${pageContext.request.contextPath}/friendlylink">友情链接</a></li>
                    <li><a href="">意见反馈</a></li>
                    <li><a href="${pageContext.request.contextPath}/contactus">联系我们</a></li>
                    <li><a href="">加入我们</a></li>
                    <li><a href="${pageContext.request.contextPath}/disclaimer">免责声明</a></li>
                </ul>
            </div>
            <div id="commonproblem_right">
                <h1>常见问题</h1>
                <div class="commonproblem-content-box">
                    <div class="commonproblem-content-txt">
                        <p>如果在使用过程中，你遇到任何问题，请马上联系我们，</p>
                        <p>联系邮箱：<a href="mailto:dlgwork@aliyun.com">dlgwork@aliyun.com</a></p>
                        <p style="margin-bottom:50px;">我们会认真对待你的每一个问题，以最快的速度给你答复。</p>
                        <p>代码题提交结果:</p>
                        <p><b>等待评测:</b>     评测系统还没有评测到这个提交，请稍候</p>
                        <p><b>正在评测:</b>     评测系统正在评测，稍候会有结果</p>
                        <p><b>编译错误:</b>     您提交的代码无法完成编译，点击“编译错误”可以看到编译器输出的错误信息</p>
                        <p><b>答案正确:</b>     恭喜！您通过了这道题</p>
                        <p><b>部分正确:</b>     您的代码只通过了部分测试点，继续努力！</p>
                        <p><b>格式错误:</b>     您的程序输出的格式不符合要求（比如空格和换行与要求不一致）</p>
                        <p><b>答案错误:</b>     您的程序未能对评测系统的数据返回正确的结果</p>
                        <p><b>运行超时:</b>     您的程序未能在规定时间内运行结束</p>
                        <p><b>内存超限:</b>     您的程序使用了超过限制的内存</p>
                        <p><b>异常退出:</b>     您的程序运行时发生了错误</p>
                        <p><b>返回非零:</b>     您的程序结束时返回值非 0，如果使用 C 或 C++ 语言要保证 int main 函数最终 return 0</p>
                        <p><b>浮点错误:</b>     您的程序运行时发生浮点错误，比如遇到了除以 0 的情况</p>
                        <p><b>段落错误:</b>     您的程序发生段错误，可能是数组越界，堆栈溢出（比如，递归调用层数太多）等情况引起</p>
                        <p><b>多种错误:</b>     您的程序对不同的测试点出现不同的错误</p>
                        <p><b>内部错误:</b>     评测系统发生内部错误，无法评测。工作人员会努力排查此种错误</p>
                    </div>
                </div>

            </div>
        </div>
        <div id="commonproblem_blank_footer"></div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
