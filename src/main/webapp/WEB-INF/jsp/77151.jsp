<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <title>搁浅的心 - 董运昌 - 静听网 - 140202011032_陈晓东</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/music.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
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
        <div class="container">
            <div class="navbar-header">
                <a href="" class="navbar-brand">
                    <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
                </a>
            </div>
            <nav>
                <ul class="nav navbar-nav navbar-link">
                    <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/piano">钢琴</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/guitar">吉他</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/cartoon">动漫</a></li>
                    <li><a href="${pageContext.request.contextPath}/category/elect">电子</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-sm">
                    <!--<li><input type="text" class="search-input" placeholder="歌名 / 歌手"></li>-->
                    <!--<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>-->
                    <!--<li><a href="#">注册 / 登录</a></li>-->
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
                                <input type="hidden" class="form-control" placeholder="music" name="mid" value="${music.mid}">
                                <input type="text" class="form-control" id="aaa" placeholder="music" name="mtitle" value="${music.mtitle}">
                            </div>
                            <div class="form-group">
                                <label for="bbb">作&nbsp;&nbsp;者</label>
                                <input type="text" class="form-control" id="bbb" placeholder="author" name="mauthor" value="${music.mauthor}">
                            </div>
                            <div class="form-group">
                                <label for="eee">分&nbsp;&nbsp;类</label>
                                <select class="form-control" id="eee" name="category.cid">
                                    <option value="3" <c:if test="${music.category.cid == 3}"> selected</c:if>>动漫</option>
                                    <option value="4"<c:if test="${music.category.cid == 4}"> selected</c:if>>电子</option>
                                    <option value="1"<c:if test="${music.category.cid == 1}"> selected</c:if>>钢琴</option>
                                    <option value="2"<c:if test="${music.category.cid == 2}"> selected</c:if>>吉他</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="fff">简&nbsp;&nbsp;介</label>
                                <input type="text" class="form-control" id="fff" placeholder="abstract" name="msummary" value="${music.msummary}">
                            </div>
                            <label for="ccc">音&nbsp;乐&nbsp;文&nbsp;件</label></br>
                            <input type="file" id="ccc" name="musicfile"></br>
                            <p class="help-block">Choose your music.</p>
                        </div>

                        <input type="submit" class="btn btn-primary btn-lg" value="上传" >


                    </div>
                </div>
                <div>
                    <img src="${pageContext.request.contextPath}/${music.mpicurl}"
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
</body>
</html>
