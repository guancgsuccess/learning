<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/10/18
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>乐宁网-在线编程</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/question-exercise.css">
</head>
<body>

    <script type="text/javascript">

    </script>

    <%@include file="head.jsp"%>

    <div class="question-wrapper">
        <div class="question-content-head">
            <div class="question-content-head-content">
                <ul class="question-content-head-ul">
                    <li>
                        <a href="${pageContext.request.contextPath}/question-company">公司真题</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/question-language">专项练习</a>
                    </li>
                    <li class="selected">
                        <a href="${pageContext.request.contextPath}/question-exercise">在线编程</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="question-content-middle">
            <div class="question-exercise-head">
                <h4>全部编程题目</h4>
            </div>
            <div class="menu-txt-box">
                <ul class="menu-txt clearfix">
                    <li>
                        <a href="javascript:void(0);">全部(12)</a>
                    </li>
                    <li class="menu-pipe">|</li>
                    <li>
                        <a href="javascript:void(0);">已通过(0)</a>
                    </li>
                    <li class="menu-pipe">|</li>
                    <li>
                        <a href="javascript:void(0);">未通过(12)</a>
                    </li>
                </ul>
            </div>
            <div class="question-exercise-body">
                <table>
                    <tbody>
                    <tr>
                        <th width="300">题目</th>
                        <th width="100">热度指数
                            <div class="rank-oprt" data-type="submissionCount">
                                <a href="javascript:void(0);" class="rank-up" title="升序"></a>
                                <a href="javascript:void(0);" class="rank-down" title="降序"></a>
                            </div>
                        </th>
                        <th width="100">通过率
                            <div class="rank-oprt" data-type="acceptRate">
                                <a href="javascript:void(0);" class="rank-up" title="升序"></a>
                                <a href="javascript:void(0);" class="rank-down" title="降序"></a>
                            </div>
                        </th>
                        <th width="300">来自专题
                            <div class="rank-oprt" data-type="topic">
                                <a href="javascript:void(0);" class="rank-up" title="升序"></a>
                                <a href="javascript:void(0);" class="rank-down" title="降序"></a>
                            </div>
                        </th>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/1" target="_blank">数串</a>
                        </td>
                        <td>13425</td>
                        <td>19.18%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/2" target="_blank">树的高度</a>
                        </td>
                        <td>6104</td>
                        <td>16.40%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/3" target="_blank">句子反转</a>
                        </td>
                        <td>10439</td>
                        <td>25.92%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/4" target="_blank">电话号码分身</a>
                        </td>
                        <td>3465</td>
                        <td>21.67%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/5" target="_blank">水仙花数</a>
                        </td>
                        <td>9319</td>
                        <td>15.96%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/6" target="_blank">求数列的和</a>
                        </td>
                        <td>7619</td>
                        <td>28.05%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/7" target="_blank">袋鼠过河</a>
                        </td>
                        <td>4762</td>
                        <td>17.10%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/8" target="_blank">彩色宝石项链</a>
                        </td>
                        <td>3683</td>
                        <td>27.43%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/9" target="_blank">保留最大的数</a>
                        </td>
                        <td>6649</td>
                        <td>8.57%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    <tr>
                        <td class="offer-pot txt-left">
                            <i class="icon-spot-gray"></i>
                            <a href="${pageContext.request.contextPath}/online/exercise/10" target="_blank">统计字符</a>
                        </td>
                        <td>6198</td>
                        <td>21.82%</td>
                        <td class="txt-left"><a href="/ta/2017test" target="_blank">2017校招真题在线编程</a></td>
                    </tr>
                    </tbody>
                </table>
                <div class="pagination">
                    <ul data-total="835">
                        <%--<li class="txt-pager disabled js-first-pager"><a data-page="1" href="javascript:void(0)">首页</a></li>
                        <li class="txt-pager disabled js-pre-pager"><a data-page="1" href="javascript:void(0)">上一页</a></li>--%>
                        <li class="active js-1-pager"><a href="javascript:void(0)" data-page="1">1</a></li>
                        <li class="js-2-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=2" data-page="2">2</a></li>
                        <li class="js-3-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=3" data-page="3">3</a></li>
                        <li class="js-4-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=4" data-page="4">4</a></li>
                        <li class="js-5-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=5" data-page="5">5</a></li>
                        <li class="js-6-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=6" data-page="6">6</a></li>
                        <li class="js-7-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=7" data-page="7">7</a></li>
                        <li class="js-8-pager"><a href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=8" data-page="8">8</a></li>
                       <%-- <li class="txt-pager js-next-pager"><a data-page="2" href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=2">下一页</a></li>
                        <li class="txt-pager js-last-pager"><a data-page="835" href="?title=&amp;tags=&amp;order=&amp;asc=false&amp;page=835">末页</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>
