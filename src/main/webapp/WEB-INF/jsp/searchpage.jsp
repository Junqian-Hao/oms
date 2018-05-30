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

    <link rel="shortcut icon" href="favicon.ico" mce_href="http://jt.hapboy.xyz/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../assets/css/reset.css">
    <link rel="stylesheet" href="../../assets/css/common.css">
    <link rel="stylesheet" href="../../assets/css/slider.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">

    <link rel="stylesheet" href="${pageContext.request. contextPath}/assets/css/userinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <%--<style>--%>
        <%--.pagecount {--%>
            <%--text-align: center;--%>
            <%--margin-bottom: 5px;--%>
            <%--padding: 15px 15px 20px 0;--%>
        <%--}--%>

        <%--.pagecount span {--%>
            <%--display: inline-block;--%>
            <%--background: #ddd;--%>
            <%--margin: 0 0 0 5px;--%>
            <%--width: 40px;--%>
            <%--text-align: center;--%>
            <%--padding: 2px 8px 2px 8px;--%>
            <%--border: 1px solid #eee;--%>
            <%--color: #666;--%>
        <%--}--%>

        <%--.pagecount span a {--%>
            <%--color: #333;--%>
        <%--}--%>

        <%--.pagecount span a:hover {--%>
            <%--text-decoration: underline;--%>
        <%--}--%>

    <%--</style>--%>

</head>
<body>
<!-- 导航栏 -->
<header>
    <div class="container">
        <div class="navbar-header">
            <a href="${pageContext.request.contextPath}/firstpageRequest" class="navbar-brand">
                <img src="assets/images/logo.png" alt="" style="padding-top: 15px">
            </a>
        </div>
        <nav>
            <ul class="nav navbar-nav navbar-link">
                <li><a href="/firstpageRequest">首页</a></li>
                <li><a href="/categorymusicView?cname=piano">钢琴</a></li>
                <li><a href="/categorymusicView?cname=guitar">吉他</a></li>
                <li><a href="/categorymusicView?cname=comic">动漫</a></li>
                <li><a href="/categorymusicView?cname=electric">电子</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right navbar-sm">
                <li><input type="text" class="search-input" id="search-input" placeholder="歌名 / 歌手"></li>
                <li><a id="search-btn" style="padding-top: 25px"><i class="fa fa-search" aria-hidden="true"></i></a>
                </li>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="/login">注册 / 登录</a></li>
                </c:if>
                <c:if test="${sessionScope.user !=null}">
                    <li><a href="${pageContext.request.contextPath}/user/userinfo">${sessionScope.user.nickname}</a>
                    </li>
                    <li><a href="/exit">退出</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>
<!-- 主内容区域 -->
<div class="container-sm box">
    <!-- 主内容 -->
    <div class="main">
        <div class="main-wrap" style="margin-right: 0px">
            <div class="content-box">
                <!-- 热门推荐 -->
                <div class="hot-recommand">
                    <div class="content-header">
                        <h2><i class="fa fa-music red"></i>搜索</h2>
                        <!--<span class="more"><a href="#">更多</a></span>-->
                    </div>

                    <span style="font-size: 30px;color: #888;position:relative;top: 100px;left: 350px;display: none;" id="missfind">未找到相应的歌曲</span>
                    <ul class="music-list clearfix" id="musiclist">
                        <%--append()--%>

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
<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>

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
                    if (res.code) {
//                                console.log(res);
//                                alert("code"+res.code);
//                                total= res['pagenum'];
//                                pageSize= 12;
//                                totalPage=res['totalpage'];
//                                alert("totalpage="+totalPage+"pagesize="+pageSize+"totalpage="+totalPage);
//getPageBar();
//                                var dataObj=eval(res);
//                                alert(dataObj.musiclist.length);
//                                $.each(dataObj.musiclist,fucntion(idx,item){
//                                    if(idx==0){
//                                        return true;
//                                    }
//
////输出每个root子对象的名称和值
//                                    alert("name:"+item.name+",value:"+item.value);
//                                })
                        //var parsedJson =jQuery.parseJSON(res);

//                                alert(res.musiclist[0].mpicurl);
                        var j = parseInt(0);
                        var str;

                        if (res.musiclist != null) {
                            var i = parseInt(res.musiclist.length);

                            for (; j < i; j++) {
                                var img = res.musiclist[j].mpicurl;
                                var title = res.musiclist[j].mtitle;
                                var murl = res.musiclist[j].murl;
                                var author = res.musiclist[j].mauthor;
                                var mid = res.musiclist[j].mid;
                                str = "<li><div class=\"u-cover\"> <img src=\"" + img + "\"/>" +
                                    "<a title=\"" + title + "\" href=\"/singlemusicView?Mid=" + mid + "\" class=\"msk\"></a></div>" +
                                    "" +
                                    " <p class=\"dec\"> <a title=\"Refrain - Anan Ryoko\"href=\"/singlemusicView?Mid=" + mid + "\">" + title + "</a></p>" +
                                    " <div class=\"author\">" + author + "</div></li>";

                                $("#musiclist").append(str);
                            }
                        } else {
//                            str = "<div><span style=\"font-size: 30px;color: #888;\">未找到相符合的歌曲。</span></div>";
//                            $("#musiclist").append(str);
                            $("#missfind").css("display","block");
                            $(".box").css("height","300px");
                        }
                    }
                }

            });
        }
    )

</script>

</body>
</html>
