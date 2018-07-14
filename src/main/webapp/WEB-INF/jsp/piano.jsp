<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>钢琴 - 静听网 - 140202011032_陈晓东</title>
  <link rel="stylesheet" href="../../assets/css/reset.css">
  <link rel="stylesheet" href="../../assets/css/common.css">
  <link rel="stylesheet" href="../../assets/css/category.css">
  <link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="../../assets/live2d/waifu.css"/>
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
        <li class="active"><a href="/categorymusicView?cname=piano">钢琴</a></li>
        <li><a href="/categorymusicView?cname=guitar">吉他</a></li>
        <li><a href="/categorymusicView?cname=comic">动漫</a></li>
        <li ><a href="/categorymusicView?cname=electric">电子</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right navbar-sm">
        <li><input type="text" class="search-input" id="search-input" placeholder="歌名 / 歌手"></li>
        <li><a id="search-btn" style="padding-top: 25px"><i class="fa fa-search" aria-hidden="true"></i></a></li>
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
<!-- 头部信息 -->
<div class="container-sm category-header-wrap">
  <div class="category-header-banner">
    <div class="img" style="background-image: url('../../storage/category/piano.jpg')">
      <div class="content">
        <h2>钢琴</h2>
        <p>Piano</p>
      </div>
      <div class="mask"></div>
    </div>
  </div>
</div>
<!-- 音乐列表 -->
<div class="container-sm box">
  <div class="main">
    <div class="main-wrap">
      <div class="content-box">
        <div class="piano-list">
          <div class="content-header">
            <h2><i class="fa fa-music red"></i>最新音乐</h2>
          </div>
          <ul class="music-list clearfix">
            <c:forEach items="${categorymusicList}" var="music" varStatus="vs">
            <li>
              <div class="u-cover">
                <img src="${music.mpicurl}">
                <a title="${music.mtitle} - ${music.user.nickname}" href="/singlemusicView?Mid=${music.mid}" class="msk"></a>
              </div>
              <p class="dec">
                <a title="${music.mtitle} - ${music.user.nickname}" href="/singlemusicView?Mid=${music.mid}">${music.mtitle}</a>
              </p>
              <div class="author">${music.mauthor}</div>
              </c:forEach>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="waifu">
  <div class="waifu-tips"></div>
  <canvas id="live2d" width="280" height="250" class="live2d"></canvas>
  <div class="waifu-tool">
    <span class="fui-home"></span>
    <span class="fui-chat"></span>
    <span class="fui-eye"></span>
    <span class="fui-user"></span>
    <span class="fui-photo"></span>
    <span class="fui-info-circle"></span>
    <span class="fui-cross"></span>
  </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="../../assets/live2d/waifu-tips.js"></script>
<script src="../../assets/live2d/live2d.js"></script>
<script type="text/javascript">initModel("../../assets/live2d/")</script>

<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>

</body>
</html>
