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
                <li><a href="#">注册 / 登录</a></li>
            </ul>
        </nav>
    </div>
</header>
<div class="container-sm player-wrap">
    <div id="music-player" class="aplayer"></div>
    <img src="../../assets/images/download.png" style="cursor: pointer;float:right;margin-top: -50px;margin-right: 10px">
</div>
<div class="container-sm box">
    <div class="main">
        <div class="main-wrap">
            <div class="content-box article">
                <div class="title">
                    <img src="../../assets/images/心.png" id="heart" style="float: right;margin: 10px" height="24" width="24"/>
                    <h2>${music.mtitle} - ${music.user.nickname}</h2>
                    <div class="info">
                        <span class="author">${music.mauthor}</span> / <span class="date">
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
    var ap = new APlayer({
        element: document.getElementById('music-player'), // Optional, player element
        narrow: false,                                    // Optional, narrow style
        autoplay: true,                                   // Optional, autoplay song(s), not supported by mobile browsers
        showlrc: 0,                                       // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
        mutex: true,                                      // Optional, pause other players when this player playing
        theme: '#B72712',                                 // Optional, theme color, default: #b7daff
        mode: 'circulation',                              // Optional, play mode, `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
        preload: 'metadata',                              // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
        listmaxheight: '513px',                           // Optional, max height of play list
        music: {                                          // Required, music info
            title: '${music.mtitle}',                                 // Required, music title
            author: '${music.mauthor}',                          // Required, music author
            url: '../music/chengdu.mp3',  // Required, music url
            pic: '${music.mpicurl}'  // Optional, music picture
        }
    });
</script>
</body>
</html>