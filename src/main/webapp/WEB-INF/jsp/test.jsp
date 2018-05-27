<%--
  Created by IntelliJ IDEA.
  User: 郝俊谦
  Date: 2018/5/18
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>静听网 - 140202011032_陈晓东</title>
<link rel="icon" href="favicon.ico" mce_href="favicon.ico" type="image/x-icon">

<link rel="shortcut icon" href="favicon.ico" mce_href="http://jt.hapboy.xyz/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../../assets/css/reset.css">
<link rel="stylesheet" href="../../assets/css/common.css">
<link rel="stylesheet" href="../../assets/css/slider.css">
<link rel="stylesheet" href="../../assets/css/font-awesome.min.css">
<body>
<%--${a}--%>
<%--${user.id}--%>
<%--<audio src="http://localhost:8080/user/music/1" controls="controls">--%>
    <%--Your browser does not support the audio element.--%>
<%--</audio>--%>
<%--<form action="${pageContext.request.contextPath}/login">--%>
    <%--<input type="text" name="username">--%>
    <%--<input type="password" name="password">--%>
    <%--<input type="submit">--%>
<%--</form>--%>
<%--<form action="${pageContext.request.contextPath}/user/uploadMusic" method="post"--%>
      <%--enctype="multipart/form-data">--%>
    <%--<input type="text" class="form-control" id="aaa" placeholder="music" name="mtitle">--%>
    <%--<input type="text" class="form-control" id="bbb" placeholder="author" name="mauthor">--%>
    <%--<select class="form-control" id="eee" name="category.cid">--%>
        <%--<option value="3">动漫</option>--%>
        <%--<option value="4">电子</option>--%>
        <%--<option value="1">钢琴</option>--%>
        <%--<option value="2">吉他</option>--%>
    <%--</select>--%>
    <%--<input type="text" class="form-control" id="fff" placeholder="abstract" name="msummary">--%>
    <%--<input type="file" id="ccc" name="musicfile">--%>
    <%--<input style="position: relative; " type="file" id="ddd" name="mpic">--%>
    <%--<input type="submit" class="btn btn-primary btn-lg" value="上传" >--%>
<%--</form>--%>



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
                    <li class="showinfo"><a href="#">${sessionScope.user.nickname}</a>
                        <div class="userinfo">11111111111111111</div>
                    </li>
                    <li><a href="/exit">退出</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>

<script src="../../assets/js/jquery.min.js"></script>

<script src="../../assets/js/music.js"></script>
</body>
</html>
