<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${music.mtitle} - ${music.user.nickname} - 静听网 - 140202011032_陈晓东</title>
    <link rel="stylesheet" href="../../assets/css/reset.css">
    <link rel="stylesheet" href="../../assets/css/common.css">
    <link rel="stylesheet" href="../../assets/css/music.css">
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
</head>
<body>
<header>
    <div class="container">
        <div class="navbar-header">
            <a href="" class="navbar-brand">
                <img src="../../assets/images/logo.png" alt="">
            </a>
        </div>
        <nav>
            <ul class="nav navbar-nav navbar-link">
                <li><a href="/firstpageRequest">首页</a></li>
                <li><a href="/categorymusicView?cname=piano">钢琴</a></li>
                <li><a href="/categorymusicView?cname=guitar">吉他</a></li>
                <li class="active"><a href="/categorymusicView?cname=comic">动漫</a></li>
                <li><a href="/categorymusicView?cname=electric">电子</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right navbar-sm">
                <li><input type="text" class="search-input" placeholder="歌名 / 歌手"></li>
                <li><a href="#" style="padding-top: 25px"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="/login">注册 / 登录</a></li>searchpage.html
                </c:if>
                <c:if test="${sessionScope.user !=null}">
                    <li><a href="#">${sessionScope.user.nickname}</a></li>
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
        <img id="download-music-img" src="../../assets/images/download.png" style="cursor: pointer;float:right;margin-top: -50px;margin-right: 10px">
    </form>
    </c:if>
    <c:if test="${sessionScope.user == null}">
        <img id="download-music-img2" src="../../assets/images/download.png" style="cursor: pointer;float:right;margin-top: -50px;margin-right: 10px">
    </c:if>
</div>
<div class="container-sm box">
    <div class="main">
        <div class="main-wrap">
            <div class="content-box article">
                <div class="title">
                    <img src="../../assets/images/心.png" id="heart" style="float: right;margin: 10px" height="24" width="24"/>
                    <h2>${music.mtitle} - ${music.mauthor}</h2>
                    <div class="info">
                        <span class="author">${music.user.nickname}</span> / <span class="date">
                        <fmt:formatDate value="${music.muploaddate}" pattern="yy-MM-dd"/>
                        </span>
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
<footer>
    <div class="container">
        <div class="copyright">
            <p>Copyright © <span class="update-year">2016</span> Chen Xiaodong - All Rights Reserved&nbsp;&nbsp;|&nbsp;&nbsp;2014级
                软件工程1班 陈晓东</p>
        </div>
    </div>
</footer>
<script src="../../assets/js/jquery.min.js"></script>

<script src="../../assets/js/music.js"></script>

<script src="http://cdn.bootcss.com/aplayer/1.5.8/APlayer.min.js"></script>
<script>

    var is_first=true;
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
            url: '${music.murl}',  // Required, music url
            pic: '${music.mpicurl}'  // Optional, music picture
        }
    });

    ap.on('play',function () {
        if(is_first==true){
        var json = {
            mid : ${music.mid}
        }
        $.ajax({
            url: "/addmusictime",
            type: "post",
            contentType: "application/json",
            data: JSON.stringify(json),
            success: function (res) {
                console.log()
                if (res.code == 1) {
                    is_first=false;
                }else {
                    log.debug("增加失败");
                }
            }
        })

        }
    });


$(document).ready(function () {
    var uid =${sessionScope.user.uid};
    var mid =${music.mid};
    var settings = {
        "async": true,
        "crossDomain": true,
        "url": "http://localhost:8080/islike?&mid="+mid,
        "method": "POST"
    };

    $.ajax(settings).done(function (response) {
        if (response.code == 1) {
            $("#heart").attr("src", "../assets/images/红心.png");
            console.log("已经是粉丝了");
        }else {
            $("#heart").attr("src", "../assets/images/心.png");
            console.log("目前并不是粉丝了");

        }
    });

    $("#heart").on('click', function () {
        var kv = "uid" + uid + "&mid" + mid;
        if ($("#heart").attr("src") == "../assets/images/心.png") {

            var settings1 = {
                "async": true,
                "crossDomain": true,
                "url": "http://localhost:8080/like?uid=" + uid+"&mid="+mid,
                "method": "POST"
            };

            $.ajax(settings1).done(function (response) {
                if (response.code == 1) {
                    $("#heart").attr("src", "../assets/images/红心.png");
                }else {
                    console.log("变红心失败");
                }
            });
        } else {

            var settings2 = {
                "async": true,
                "crossDomain": true,
                "url": "http://localhost:8080/unlike?uid=" + uid+"&mid="+mid,
                "method": "POST"
            };

            $.ajax(settings2).done(function (response) {
                if (response.code == 1) {
                    $("#heart").attr("src", "../assets/images/心.png");
                }else {
                    console.log("变白心失败");
                }
            });
        }
    });

});


</script>
</body>
</html>
