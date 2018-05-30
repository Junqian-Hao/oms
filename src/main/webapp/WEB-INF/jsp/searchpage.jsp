<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>搜索</title>
    <link rel="icon" href="favicon.ico" mce_href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">

    <link rel="shortcut icon" href="favicon.ico" mce_href="http://jt.hapboy.xyz/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../assets/css/reset.css">
    <link rel="stylesheet" href="../../assets/css/common.css">
    <link rel="stylesheet" href="../../assets/css/slider.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
    <style>
        .pagecount {
            text-align: center;
            margin-bottom: 5px;
            padding: 15px 15px 20px 0;
        }

        .pagecount span {
            display: inline-block;
            background: #ddd;
            margin: 0 0 0 5px;
            width: 40px;
            text-align: center;
            padding: 2px 8px 2px 8px;
            border: 1px solid #eee;
            color: #666;
        }

        .pagecount span a {
            color: #333;
        }

        .pagecount span a:hover {
            text-decoration: underline;
        }

    </style>

</head>
<body>
<!-- 导航栏 -->
<header>
    <div class="container-userinfo">
        <div class="navbar-header-userinfo">
            <a href="${pageContext.request.contextPath}/firstpageRequest" class="navbar-brand-userinfo">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
            </a>
        </div>
        <nav>
            <ul class="nav-userinfo navbar-nav-userinfo navbar-link">
                <li><a href="${pageContext.request.contextPath}/firstpageRequest">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=piano">钢琴</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=guitar">吉他</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=comic">动漫</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=electric">电子</a></li>
            </ul>

            <ul class="nav-userinfo navbar-nav-userinfo navbar-right-userinfo navbar-sm-userinfo">
                <li><input type="text" class="search-input-userinfo" placeholder="歌名 / 歌手"></li>
                <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="${pageContext.request.contextPath}/login">注册 / 登录</a></li>
                </c:if>
                <c:if test="${sessionScope.user !=null}">
                    <li><a href="${pageContext.request.contextPath}/user/userinfo">${sessionScope.user.nickname}</a></li>
                    <li><a href="${pageContext.request.contextPath}/exit">退出</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>
<!-- 主内容区域 -->
<div class="container-sm box">
    <!-- 主内容 -->
    <div class="main">
        <div class="main-wrap">
            <div class="content-box">
                <!-- 热门推荐 -->
                <div class="hot-recommand">
                    <div class="content-header">
                        <h2><i class="fa fa-music red"></i>搜索</h2>
                        <!--<span class="more"><a href="#">更多</a></span>-->
                    </div>
                    <ul class="music-list clearfix">
                        <li>
                            <div class="u-cover">
                                <img src="http://p3.music.126.net/fNtMX44fvaGByURP0AbOZQ==/836728348761063.jpg">
                                <a title="Refrain - Anan Ryoko"
                                   href="../../../../../../../../music-website-master/music/22712173.html"
                                   class="msk"></a>
                            </div>
                            <p class="dec">
                                <a title="Refrain - Anan Ryoko"
                                   href="../../../../../../../../music-website-master/music/22712173.html">Refrain</a>
                            </p>
                            <div class="author">HaPBoy</div>
                        </li>

                    </ul>
                </div>
                <ul class="theme_body"></ul>
            </div>
            <div id="pagecount" class="pagecount"></div>

        </div>

    </div>
</div>

    <!-- JS 脚本 -->
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/css/bootstrap.min.css"></script>
<script src="../../assets/js/page.js"></script>
<script src="../../assets/js/HBSlider.js"></script>
    <script>
        function parseUrl() {
            var url = location.href;
            var i = url.indexOf('?');
            if (i == -1)return;
            var querystr = url.substr(i + 1);
            var arr1 = querystr.split('&');
            var arr2 = new Object();
            for (i in arr1) {
                var ta = arr1[i].split('=');
                arr2[ta[0]] = ta[1];
            }
            return arr2;
        }

        $(document).ready(
            function () {
                var v = parseUrl();//解析所有参数
//                alert(v['content']);//就是你要的结果

                var json =
                    {
                        thispage: 1,
                        input: v['content']
                    };
                $.ajax({
                    url: "/searchMusic",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(json),

                    success: function (res) {
//                        alert("content"+v['content']);
                            if (res.code){
                                alert("code"+res.code);
                                total= res['pagenum'];
                                pageSize= 12;
                                totalPage=res['totalpage'];
                                alert("totalpage="+totalPage+"pagesize="+pageSize+"totalpage="+totalPage);
//                                getPageBar();

                            }
                    }

                });
            }
        )

    </script>

</body>
</html>
