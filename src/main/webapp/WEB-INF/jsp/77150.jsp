<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>添加音乐</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/music.css"　>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <link rel="stylesheet" type="text/css" href="../../assets/live2d/waifu.css"/>
    <style>
        body {
            background-image: url("");
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/uploadMusic" method="post"
      enctype="multipart/form-data">
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
                    <li><input type="text" class="search-input-userinfo" id="search-input" placeholder="歌名 / 歌手"></li>
                    <li><a  style="padding-top: 25px" id="search-btn"><i class="fa fa-search" aria-hidden="true"></i></a></li>
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

    <div class="container-sm box">
        <div class="main">
                <div class="content-box article">
                    <div style=" float:left;width: 40%;margin: 0 10%;margin-top: 0px;text-align: center;">


                        <div class="form-group">
                            <div class="form-group">
                                <label for="aaa">音&nbsp;乐&nbsp;名&nbsp;称</label>
                                <input type="text" class="form-control" id="aaa" placeholder="music" name="mtitle">
                            </div>
                            <div class="form-group">
                                <label for="bbb">作&nbsp;&nbsp;者</label>
                                <input type="text" class="form-control" id="bbb" placeholder="author" name="mauthor">
                            </div>
                            <div class="form-group">
                                <label for="eee">分&nbsp;&nbsp;类</label>
                                <select class="form-control" id="eee" name="category.cid">
                                    <option value="3">动漫</option>
                                    <option value="4">电子</option>
                                    <option value="1">钢琴</option>
                                    <option value="2">吉他</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="fff">简&nbsp;&nbsp;介</label>
                                <input type="text" class="form-control" id="fff" placeholder="abstract" name="msummary">
                            </div>
                            <label for="ccc">音&nbsp;乐&nbsp;文&nbsp;件</label></br>
                            <input type="file" id="ccc" name="musicfile"></br>
                            <%--<p class="help-block">Choose your music.</p>--%>
                        </div>

                        <input type="submit" class="btn btn-primary btn-lg" value="上传" >


                    </div>
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/assets/images/music.jpg"
                         style="position: relative; width: 230px;height:230px;margin-bottom: 30px" id="myImg"/>
                    <input style="position: relative; " type="file" id="ddd" onchange="changImg(event)" name="mpic">
                    ${error}
                </div>

            </div>
            <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

            <script>
                function changImg(e) {
                    for (var i = 0; i < e.target.files.length; i++) {
                        var file = e.target.files.item(i);
                        if (!(/^image\/.*$/i.test(file.type))) {
                            continue; //不是图片 就跳出这一次循环
                        }
                        //实例化FileReader API
                        var freader = new FileReader();
                        freader.readAsDataURL(file);
                        freader.onload = function (e) {
                            $("#myImg").attr("src", e.target.result);
                        }
                    }
                }
            </script>
        </div>
    </div>
</form>
<div class="waifu" style="z-index: 999;">
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
<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>
<script src="../../assets/live2d/waifu-tips.js"></script>
<script src="../../assets/live2d/live2d.js"></script>
<script type="text/javascript">initModel("../../assets/live2d/")</script>

</body>
</html>
