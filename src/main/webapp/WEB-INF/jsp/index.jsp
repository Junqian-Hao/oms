<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
  <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
  <title>千千静听</title>
  <link rel="icon" href="favicon.ico" mce_href="favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="./favicon.ico" mce_href="http://jt.hapboy.xyz/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="../../assets/css/reset.css" type="text/css">
  <link rel="stylesheet" href="../../assets/css/common.css" type="text/css">
  <link rel="stylesheet" href="../../assets/css/slider.css" type="text/css">
  <link rel="stylesheet" href="../../assets/css/font-awesome.min.css" type="text/css">
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
        <li class="active"><a href="/firstpageRequest">首页</a></li>
        <li><a href="/categorymusicView?cname=piano">钢琴</a></li>
        <li><a href="/categorymusicView?cname=guitar">吉他</a></li>
        <li><a href="/categorymusicView?cname=comic">动漫</a></li>
        <li><a href="/categorymusicView?cname=electric">电子</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right navbar-sm">
        <li><input type="text" class="search-input" id="search-input" placeholder="歌名 / 歌手"></li>
        <li><a  style="padding-top: 25px" id="search-btn"><i class="fa fa-search" aria-hidden="true"></i></a></li>
        <c:if test="${sessionScope.user == null}">
          <li><a href="/regist">注册</a></li>
          <li><a href="/login">登录</a></li>
        </c:if>
        <c:if test="${sessionScope.user !=null}">
          <li><a href="${pageContext.request.contextPath}/user/userinfo">${sessionScope.user.nickname}</a></li>
          <li><a href="/exit">退出</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
</header>
<!-- 轮播图 -->
<div class="container-sm slider-wrap">
  <div class="slider">
    <div class="slider-item-list"></div>
    <div class="slider-dots">
      <div class="slider-dots-wrap"></div>
    </div>
    <div class="slider-arrows">
      <div class="slider-arrows-wrap">
        <span class="slider-arrow slider-arrow-left" onclick="HBSlider.turn(-1)"></span>
        <span class="slider-arrow slider-arrow-right" onclick="HBSlider.turn(1)"></span>
      </div>
    </div>
  </div>
</div>
<!-- 主内容区域 -->
<div class="container-sm box">
  <!-- 主内容 -->
  <div class="main">
    <div class="main-wrap">
      <div class="content-box">
        <!-- 热门推荐 -->
        <div class="hot-recommand">
          <div class="content-header">
            <h2><i class="fa fa-music red"></i>热门推荐</h2>
            <div class="tab">
              <a href="/categorymusicView?cname=piano">钢琴</a>
              <span class="line">|</span>
              <a href="/categorymusicView?cname=guitar">吉他</a>
              <span class="line">|</span>
              <a href="/categorymusicView?cname=comic">动漫</a>
              <span class="line">|</span>
              <a href="/categorymusicView?cname=electric">电子</a>
            </div>
            <!--<span class="more"><a href="#">更多</a></span>-->
          </div>
          <!--热门推荐-->
          <ul class="music-list clearfix">
            <c:forEach items="${firstPageMap.hotMusicList}" var="music" varStatus="vs">
            <li>
              <div class="u-cover">
                <img src="${music.mpicurl}">
                <a title="Refrain - Anan Ryoko" href="/singlemusicView?Mid=${music.mid}" class="msk"></a>
              </div>
              <p class="dec">
                <a title="Refrain - Anan Ryoko" href="/singlemusicView?Mid=${music.mid}">${music.mtitle}</a>
              </p>
              <div class="author">${music.mauthor}</div>
            </li>
            </c:forEach>
          </ul>
        </div>
        <!-- 分类榜单 -->
        <div class="category">
          <div class="content-header">
            <h2><i class="fa fa-music red"></i>分类榜单</h2>
          </div>
          <div class="row">
            <div class="category-music-list">
              <div class="category-header">
                🎹 钢琴
              </div>
              <ul>
                <c:forEach items="${firstPageMap.pianoMusicList}" var="music" varStatus="vs">
                <li class="music-list-item">
                  <div class="title">
                    <div class="title_wrap">
                      <span class="rank">${vs.count}</span>
                      <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}">${music.mtitle}</a>
                    </div>
                  </div>
                  <div class="info">
                    <span class="date"><fmt:formatDate value="${music.muploaddate}" pattern="MM-dd"/></span>
                    <span class="avatar"><img
                        src="${music.mpicurl}"></span>
                  </div>
                </li>
                </c:forEach>
              </ul>
            </div>
            <div class="category-music-list">
              <div class="category-header">
                🎸 吉他
              </div>
              <ul>
                <c:forEach items="${firstPageMap.guitarMusicList}" var="music" varStatus="vs">
                  <li class="music-list-item">
                    <div class="title">
                      <div class="title_wrap">
                        <span class="rank">${vs.count}</span>
                        <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}">${music.mtitle}</a>
                      </div>
                    </div>
                    <div class="info">
                      <span class="date"><fmt:formatDate value="${music.muploaddate}" pattern="MM-dd"/></span>
                      <span class="avatar"><img
                              src="${music.mpicurl}"></span>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="row">
            <div class="category-music-list">
              <div class="category-header">
                🍡 动漫
              </div>
              <ul>
                <c:forEach items="${firstPageMap.comicMusicList}" var="music" varStatus="vs">
                  <li class="music-list-item">
                    <div class="title">
                      <div class="title_wrap">
                        <span class="rank">${vs.count}</span>
                        <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}">${music.mtitle}</a>
                      </div>
                    </div>
                    <div class="info">
                      <span class="date"><fmt:formatDate value="${music.muploaddate}" pattern="MM-dd"/></span>
                      <span class="avatar"><img
                              src="${music.mpicurl}"></span>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
            <div class="category-music-list">
              <div class="category-header">
                ⚡️ 电子
              </div>
              <ul>
                <c:forEach items="${firstPageMap.electricMusicList}" var="music" varStatus="vs">
                  <li class="music-list-item">
                    <div class="title">
                      <div class="title_wrap">
                        <span class="rank">${vs.count}</span>
                        <a href="/singlemusicView?Mid=${music.mid}" title="${music.mtitle}">${music.mtitle}</a>
                      </div>
                    </div>
                    <div class="info">
                      <span class="date"><fmt:formatDate value="${music.muploaddate}" pattern="MM-dd"/></span>
                      <span class="avatar"><img
                              src="${music.mpicurl}"></span>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- 侧边栏 -->
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


<!-- JS 脚本 -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/HBSlider.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>
<script>
  // 轮播图数据
  var sliderData = [
    {
      title: 'ブルーバード',
      pic: './storage/slider/01.png',
      url: '${pageContext.request.contextPath}/singlemusicView?Mid=158'
    },
    {
      title: '东风志',
      pic: 'http://img.zcool.cn/community/0109575540b83d0000017c946b5535.jpg',
      url: '${pageContext.request.contextPath}/singlemusicView?Mid=162'
    },
    {
      title: '彩虹',
      pic: 'http://ww2.sinaimg.cn/large/67d25024gw1fb5h1swze9j20gq0b6acf.jpg',
      url: '${pageContext.request.contextPath}/singlemusicView?Mid=166'
    },
    {
      title: '春天里',
      pic: 'http://ww4.sinaimg.cn/mw690/67d25024gw1fb5hbjl32jj21hc0u01dz.jpg',
      url: '${pageContext.request.contextPath}/singlemusicView?Mid=164'
    }
  ];

  $(function () {
    HBSlider.setConfig({
      autoPlay: true,
      delay: 5
    });
    HBSlider.setItems(sliderData);
    HBSlider.init();
    HBSlider.play();
  });
</script>
</body>
</html>
