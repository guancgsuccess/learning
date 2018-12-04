<%--
  Created by IntelliJ IDEA.
  User: 24616
  Date: 2018/11/3
  Time: 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/online.css">
    <link rel="dns-prefetch" href="//s1.tool.lu">
    <link rel="dns-prefetch" href="//s2.tool.lu">
    <link rel="dns-prefetch" href="//s3.tool.lu">
    <link rel="dns-prefetch" href="//s4.tool.lu">
    <link rel="dns-prefetch" href="//qn11.tool.lu">
    <link rel="dns-prefetch" href="//qn12.tool.lu">
    <link rel="dns-prefetch" href="//qn13.tool.lu">
    <link rel="dns-prefetch" href="//qn14.tool.lu">
    <link rel="dns-prefetch" href="//analytics.tool.lu">
    <title>在线编程</title>
    <link rel="search" type="application/opensearchdescription+xml" title="在线工具" href="https://tool.lu/opensearch.xml">
    <!-- <link rel="canonical" href="original url"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
    <meta name="author" content="iteam">
    <link rel="publisher" href="https://plus.google.com/113621341737546487026">
    <meta name="keywords" content="在线运行php,c,c++,go,python,nodejs,java,groovy代码,在线测试代码">
    <meta name="description" content="在线运行php,c,c++,go,python,nodejs,java,groovy代码，测试代码">
    <link rel="shortcut icon" href="https://tool.lu/favicon.ico">
    <meta name="apple-mobile-web-app-title" content="在线工具">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="grey">
    <link rel="apple-touch-icon" sizes="57x57" href="//qn11.tool.lu/201711/08/002818pvCvPDnAZK6IioEb_57x57.png">
    <link rel="apple-touch-icon" sizes="72x72" href="//qn11.tool.lu/201711/08/002819Dt982ULrn0pC7AL1_72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="//qn11.tool.lu/201711/08/002818ZlzSK5t2HM5icUJN_114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="//qn11.tool.lu/201711/08/002819v0Gaydtvy2P4y03G_144x144.png">
    <!--[if lt IE 9]>
    <script src="//s1.tool.lu/js/html5shiv.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="//s2.tool.lu/css/fontawesome/css/all.min.css">
    <link rel="stylesheet"
          href="//s3.tool.lu/??css/style.css,css/app.css,js/tipsy.css,js/layout/layout-app.css,js/facebox/facebox.css,js/waves/waves.min.css,js/swiper/css/swiper.min.css?t=1524624425727">
    <!-- <script src="//analytics.tool.lu/te.js" crossorigin="anonymous"></script> -->
    <script src="//s4.tool.lu/js/codemirror/mode/css/css.js"></script>
    <script src="//s4.tool.lu/js/codemirror/mode/javascript/javascript.js"></script>
    <script src="//s4.tool.lu/js/codemirror/mode/xml/xml.js"></script>
    <script src="//s4.tool.lu/js/codemirror/mode/clike/clike.js"></script>
    <script src="//s4.tool.lu/js/codemirror/mode/htmlmixed/htmlmixed.js"></script>
    <script async="" src="https://analytics.tool.lu/ta.js"></script>
    <script src="//s4.tool.lu/js/codemirror/mode/php/php.js"></script>
    <script src="https://hm.baidu.com/hm.js?0fba23df1ee7ec49af558fb29456f532"></script>
    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?0fba23df1ee7ec49af558fb29456f532";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
    <script src="//s4.tool.lu/??js/jquery.min.js,js/jquery-ui/jquery-ui.min.js,js/underscore-min.js,js/draggabilly/draggabilly.pkgd.min.js,js/layout/jquery.layout.js,js/jquery.topLink.js,js/jquery.generateFile.js,js/facebox/facebox.js,js/clipboard/clipboard.min.js,js/jquery.fullscreen.js,js/jquery.tipsy.js,js/jquery-scrolltofixed-min.js,js/mousetrap.min.js,js/swiper/js/swiper.min.js,js/helpers.js,js/base.js,js/app.js?t=1524624425727"></script>
</head>
<body class="app">
<div class="online-top">
    <div class="online-title1">
        <h2>题目描述</h2>
    </div>
    <div class="online-content1">
        ${online.onlineTitle}
    </div>
    <div class="online-title1">
        <h2>输入描述</h2>
    </div>
    <div class="online-content1">
        ${online.onlineInputDescript}
    </div>
    <div class="online-title1">
        <h2>输出描述</h2>
    </div>
    <div class="online-content1">
        ${online.onlineOutputDescript}
    </div>
    <div class="online-title1">
        <h2>输入</h2>
    </div>
    <div class="online-content1">
        ${online.onlineInputExample}
    </div>
    <div class="online-title1">
        <h2>输出</h2>
    </div>
    <div class="online-content1">
        ${online.onlineOutputExample}
    </div>
</div>
<div id="wrap">
    <div id="bdy">
        <div class="w">
            <link rel="stylesheet"
                  href="//s1.tool.lu/??js/codemirror/lib/codemirror.css,js/codemirror/addon/fold/foldgutter.css,js/codemirror/theme/base16-ocean-dark.css,js/ansi_up/theme.css">
            <div class="main">
                <div class="inner">
                    <div class="runner-container">
                        <div class="runner-toolbar">
                            <select name="language" id="language">
                                <option value="php">PHP
                                </option>
                                <option value="c">C</option>
                                <option value="cpp">C++
                                </option>
                                <option value="python">
                                    Python
                                </option>
                                <option value="golang">
                                    Go
                                </option>
                                <option value="java">Java
                                </option>
                                <option value="js">NodeJS
                                </option>
                                <option value="lua">Lua
                                </option>
                                <option value="groovy">
                                    Groovy
                                </option>
                                <option value="bash">Bash
                                </option>
                            </select>
                            <button id="index" class="runner-run" type="button" onclick="location.href='${pageContext.request.contextPath}/homepage'"><img src="../../image/homepage.png" height="16" width="16" style="margin-bottom: -2px"/> 回到首页</button>
                            <button id="run" class="runner-run" type="button"><i class="fas fa-play"></i> 执行(<u>R</u>un)</button>
                        </div>
                        <div class="runner-panel ui-layout-container"
                             style="height: 77px; overflow: hidden; position: relative;">
                            <div class="ui-layout-center ui-layout-pane ui-layout-pane-center"
                                 style="position: absolute; margin: 0px; left: 0px; right: 686px; top: 0px; bottom: 0px; height: 75px; width: 678px; z-index: 0; display: block; visibility: visible;">
                                <textarea id="editor" class="editor" style="display: none;"></textarea>
                                <div style="position: absolute; top: 0; right: 0; padding: 2px 6px; z-index: 9; background-color: rgba(255, 255, 255, 0.07); border-radius: 0 0 0 5px;">
                                    <a class="btn-indent" style="text-decoration: none;" href="javascript:;">缩进</a>
                                    <a class="btn-unindent" style="text-decoration: none;" href="javascript:;">减少缩进</a>
                                    <a class="btn-toggle-comment" style="text-decoration: none;"
                                       href="javascript:;">注释</a>
                                    <a class="btn-reindent" style="text-decoration: none;" href="javascript:;">格式化</a>
                                </div>
                            </div>
                            <div class="runner-console ui-layout-east ui-layout-pane ui-layout-pane-east"
                                 style="position: absolute; margin: 0px; left: auto; right: 0px; top: 0px; bottom: 0px; height: 75px; z-index: 0; width: 678px; display: block; visibility: visible;">
                                <div id="console">
                                    <div class="console-line welcome">sandbox&gt; tool.lu connected<span
                                            class="dotting"></span></div>
                                </div>
                                <a id="console_clear" href="javascript:;">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                window.storeId = 0;
            </script>
            <script src="//s2.tool.lu/??js/eventsource.min.js,js/codemirror/lib/codemirror.js,js/codemirror/addon/mode/loadmode.js,js/codemirror/addon/fold/foldcode.js,js/codemirror/addon/fold/foldgutter.js,js/codemirror/addon/fold/brace-fold.js,js/codemirror/addon/fold/comment-fold.js,js/codemirror/addon/comment/comment.js,js/codemirror/addon/comment/continuecomment.js,js/coderunner/extensions.js,js/ansi_up/ansi_up.js,js/coderunner/app.js"></script>
        </div>
    </div>
</div>
<script>
    (function () {
        var a = document.createElement("script");
        a.async = !0;
        a.src = ("https:" == document.location.protocol ? "https:" : "http:") + "//analytics.tool.lu/ta.js";
        var b = document.getElementsByTagName("script")[0];
        b.parentNode.insertBefore(a, b)
    })();
</script>
</body>
</html>