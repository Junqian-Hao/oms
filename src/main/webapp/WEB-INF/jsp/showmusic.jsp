<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${music.mtitle} - ${music.user.nickname}</title>
    <link rel="stylesheet" href="../../assets/css/reset.css">
    <link rel="stylesheet" href="../../assets/css/common.css">
    <link rel="stylesheet" href="../../assets/css/music.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../assets/css/userinfo.css">
</head>
<body>
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
                <li ><a href="/categorymusicView?cname=piano">钢琴</a></li>
                <li><a href="/categorymusicView?cname=guitar">吉他</a></li>
                <li><a href="/categorymusicView?cname=comic">动漫</a></li>
                <li ><a href="/categorymusicView?cname=electric">电子</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right navbar-sm">
                <li><input type="text" class="search-input" placeholder="歌名 / 歌手"></li>
                <li><a href="#" style="padding-top: 25px"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="/login">注册 / 登录</a></li>
                </c:if>
                <c:if test="${sessionScope.user !=null}">
                    <li><a href="${pageContext.request.contextPath}/user/userinfo">${sessionScope.user.nickname}</a></li>
                    <li><a href="/exit">退出</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>

<div class="container-sm player-wrap">
    <div id="music-player" class="aplayer"></div>
    <c:if test="${sessionScope.user != null}">
        <form action="/downloadMusic" id="download-music-form" method="post">
            <input name="mid" type="hidden" value="${music.mid}">
            <img id="download-music-img" src="/assets/images/download.png"
                 style="cursor: pointer;float:right;margin-top: -50px;margin-right: 10px">
        </form>
    </c:if>
    <c:if test="${sessionScope.user == null}">
        <img id="download-music-img2" src="/assets/images/download.png"
             style="cursor: pointer;float:right;margin-top: -50px;margin-right: 10px">
    </c:if>
</div>
<div class="container-sm box">
    <div class="main" >
        <div class="main-wrap">
            <div class="content-box article" style="position: relative">
                <div class="title">
                    <c:if test="${sessionScope.user.uid == music.user.uid}">
                        <a href="${pageContext.request.contextPath}/user/77151/${music.mid}">
                            <img src="/assets/images/修改音乐.png" id="editmusic" style="float: right;margin: 10px" height="24" width="24"/>
                        </a>
                    </c:if>
                    <div style="position: absolute;right: 70px;">
                    <img src="/assets/images/心.png" id="heart" style="float: right;margin: 10px" height="24"
                         width="24"/>
                    <span id="likenum" style="position: relative ;top: 30px; left: 28px; font-size: 12px;color: #888;">12</span>
                    </div>
                    <h2>${music.mtitle} - ${music.mauthor}</h2>
                    <div class="info">
                        <span class="author">${music.user.nickname}</span> / <span class="date">
                        <fmt:formatDate value="${music.muploaddate}" pattern="yy-MM-dd"/>
                        </span>
                        <span> &nbsp;&nbsp;&nbsp;      ${music.mtimes}次播放</span>
                    </div>
                </div>
                <div class="content">
                    <p>
                        <img src="${music.mpicurl}">
                    </p>
                    <p>
                        ${music.msummary}
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="sidebar" style="min-height: 1094px">
        <div class="right-module">
            <h4>最新单曲</h4>
            <ul class="new-artist-songs">
                <c:forEach items="${rightslideMap.newMusicList}" var="music" varStatus="vs">
                    <li class="artist-song">
                        <div class="avatar">
                            <img src="${music.mpicurl}">
                        </div>
                        <div class="info">
                            <h3>${music.mtitle}</h3>
                            <p>${music.mauthor} / <span>${music.mtimes}</span>次播放</p>
                        </div>
                        <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}" class="cover-link"></a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="right-module">
            <h4>热门单曲</h4>
            <ul class="new-artist-songs">
                <c:forEach items="${rightslideMap.timeMusicList}" var="music" varStatus="vs">
                    <li class="artist-song">
                        <div class="avatar">
                            <img src="${music.mpicurl}">
                        </div>
                        <div class="info">
                            <h3>${music.mtitle}</h3>
                            <p>${music.mauthor} / <span>${music.mtimes}</span>次播放</p>
                        </div>
                        <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}" class="cover-link"></a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<script src="../../assets/js/jquery.min.js"></script>

<script src="../../assets/js/music.js"></script>

<script src="http://cdn.bootcss.com/aplayer/1.5.8/APlayer.min.js"></script>
<script>

    var is_first = true;
    var ap = new APlayer({
        element: document.getElementById('music-player'), // Optional, player element
        narrow: false,                                    // Optional, narrow style
        autoplay: false,                                   // Optional, autoplay song(s), not supported by mobile browsers
        showlrc: 0,                                       // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
        mutex: true,                                      // Optional, pause other players when this player playing
        theme: '#B72712',                                 // Optional, theme color, default: #b7daff
        mode: 'circulation',                              // Optional, play mode, `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
        preload: 'none',                              // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
        listmaxheight: '513px',                           // Optional, max height of play list
        music: {                                          // Required, music info
            title: '${music.mtitle}',                                 // Required, music title
            author: '${music.mauthor}',                          // Required, music author
            url: '${pageContext.request.contextPath}/${music.murl}',  // Required, music url
            pic: '${pageContext.request.contextPath}/${music.mpicurl}'  // Optional, music picture
        }
    });

    ap.on('play', function () {
        if (is_first == true) {
            var json = {
                mid: ${music.mid}
            }
            $.ajax({
                url: "/addmusictime",
                type: "post",
                contentType: "application/json",
                data: JSON.stringify(json),
                success: function (res) {
                    console.log()
                    if (res.code == 1) {
                        is_first = false;
                    } else {
                        console.log("增加失败");
                    }
                }
            })

        }
    });


   $(document).ready(function () {
        <c:if test="${sessionScope.user != null}">
        var uid =${sessionScope.user.uid};
       </c:if>
       <c:if test="${sessionScope.user == null}">
       var uid = -1;
       </c:if>
        var mid =${music.mid};
        var settings = {
            "async": true,
            "crossDomain": true,
            "url": "http://localhost:8080/islike?&mid=" + mid,
            "method": "POST"
        };

        $.ajax(settings).done(function (response) {
            if (response.code == 1) {
                $("#heart").attr("src", "../assets/images/红心.png");

                console.log("已经是粉丝了");
            } else {
                $("#heart").attr("src", "../assets/images/心.png");

                console.log("目前并不是粉丝了");

            }
        });

        $("#heart").on('click', function () {
            if (uid === -1) {
                window.location.href = "/login"
            }
            var kv = "uid" + uid + "&mid" + mid;
            if ($("#heart").attr("src") == "../assets/images/心.png") {

                var settings1 = {
                    "async": true,
                    "crossDomain": true,
                    "url": "http://localhost:8080/like?uid=" + uid + "&mid=" + mid,
                    "method": "POST"
                };

                $.ajax(settings1).done(function (response) {
                    if (response.code == 1) {

                        $("#heart").attr("src", "../assets/images/红心.png");
                        $("#likenum").css("color","red");
                        var likenum=$("#likenum").html();
                        likenum=parseInt(likenum)+1;
                        $("#likenum").html(likenum);
                    } else {
                        console.log("变红心失败");
                    }
                });
            } else {

                var settings2 = {
                    "async": true,
                    "crossDomain": true,
                    "url": "http://localhost:8080/unlike?uid=" + uid + "&mid=" + mid,
                    "method": "POST"
                };

                $.ajax(settings2).done(function (response) {
                    if (response.code == 1) {
                        $("#heart").attr("src", "../assets/images/心.png");
                        $("#likenum").css("color","#888");
                        var likenum=$("#likenum").html();
                        likenum-=1;
                        $("#likenum").html(likenum);
                    } else {
                        console.log("变白心失败");
                    }
                });
            }
        });

    });

</script>
<script src="../../assets/js/userinfo.js"></script>
</body>
</html>
