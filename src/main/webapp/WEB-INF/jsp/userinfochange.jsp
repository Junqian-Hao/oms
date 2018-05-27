<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${sessionScope.user.username} - ${sessionScope.user.nickname} - 静听网 </title>

    <!--修改-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/moco.min.css" type="text/css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/profile-less.css" type="text/css"/>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/music.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/category.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request. contextPath}/assets/css/userinfo.css">
    <title>个人主页</title>
    <style>
        a.button-sumbit {
            position: relative;
            color: rgba(255, 255, 255, 1);
            text-decoration: none;
            background-color: rgba(219, 87, 5, 1);
            font-family: 'Yanone Kaffeesatz';
            font-weight: 700;
            font-size: 1em;
            display: block;
            padding: 4px;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            -webkit-box-shadow: 0px 9px 0px rgba(219, 31, 5, 1), 0px 9px 25px rgba(0, 0, 0, .7);
            -moz-box-shadow: 0px 9px 0px rgba(219, 31, 5, 1), 0px 9px 25px rgba(0, 0, 0, .7);
            box-shadow: 0px 9px 0px rgba(219, 31, 5, 1), 0px 9px 25px rgba(0, 0, 0, .7);
            width: 100px;
            margin: 0 auto;
            text-align: center;

            -webkit-transition: all .1s ease;
            -moz-transition: all .1s ease;
            -ms-transition: all .1s ease;
            -o-transition: all .1s ease;
            transition: all .1s ease;
        }

        a.button-sumbit:active {
            -webkit-box-shadow: 0px 3px 0px rgba(219, 31, 5, 1), 0px 3px 6px rgba(0, 0, 0, .9);
            -moz-box-shadow: 0px 3px 0px rgba(219, 31, 5, 1), 0px 3px 6px rgba(0, 0, 0, .9);
            box-shadow: 0px 3px 0px rgba(219, 31, 5, 1), 0px 3px 6px rgba(0, 0, 0, .9);
            position: relative;
            top: 6px;
        }

    </style>
</head>
<body>
<header>
    <div class="container">
        <div class="navbar-header">
            <a href="" class="navbar-brand">
                <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="">
            </a>
        </div>
        <nav>
            <ul class="nav navbar-nav navbar-link">
                <li class="active"><a href="${pageContext.request.contextPath}/firstpageRequest">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=piano">钢琴</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=guitar">吉他</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=comic">动漫</a></li>
                <li><a href="${pageContext.request.contextPath}/categorymusicView?cname=electric">电子</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right navbar-sm">
                <li><input type="text" class="search-input" placeholder="歌名 / 歌手"></li>
                <li><a href="#" style="padding-top: 25px"><i class="fa fa-search" aria-hidden="true"></i></a></li>
                <c:if test="${sessionScope.user == null}">
                    <li><a href="${pageContext.request.contextPath}/login">注册 / 登录</a></li>
                </c:if>
                <c:if test="${sessionScope.user !=null}">
                    <li><a href="#">${sessionScope.user.nickname}</a></li>
                    <li><a href="${pageContext.request.contextPath}/exit">退出</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</header>


<div class="container-sm category-header-wrap">
    <div class="category-header-banner">
        <div class="img" style="background-image: url('${pageContext.request.contextPath}/storage/category/cartoon.jpg')">
            <div class="content">
                <h1 style="position: relative">YAO&nbsp;&nbsp;XIANGB <span
                        style="display: inline-block;position: absolute;top: -15px;"><img
                        src="${pageContext.request.contextPath}/assets/images/奖章.png" width="60px" height="60px" alt="大会员"></span>
                    <span style="display: inline;position: absolute;left: 126px; font-weight: 900">叁</span>
                </h1>
                <p style="position: relative">所爱隔山海，山有径可寻，海有舟可渡<span
                        style="position: absolute;top: -10px;left: 250px;display: inline">
                    <a href="#" style="display: inline-block;"><img src="${pageContext.request.contextPath}/assets/images/修改.png" width="25px"
                                                                    height="25px" alt="个人信息修改">
                        </a></span>
                    <!--<span style="font-size: 2px;position: absolute;top: 4px;left: 275px">修改</span>-->
                </p>
            </div>
            <div class="mask"></div>
        </div>
    </div>
</div>


<div id="main">

    <div class="page-settings">
        <div class="top">
            <div class="w960 mauto top_title">
                <p>个人设置</p>
            </div>
        </div>
        <div class="setting pb10">
            <div class="nav-tabs pa">
                <h class="baseinfo fl active">基本信息</h>
                <div class="cb"></div>
            </div>
            <div class="contentBox">
                <div class="formBox" style="width: 60%">
                    <div class="login">

                        <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
                            <div class="form-group">
                                <label for="nickname" style="color: #00a0f0;">换个昵称，迎接一个新的心情吧</label>
                                <input type="hidden" name="uid" value="${user.uid}">
                                <input type="text" class="form-control" name="nickname" id="nickname" value="${user.nickname}"
                                       placeholder="昵&nbsp;&nbsp;称">
                            </div>

                            <div class="form-group">
                                <label for="password" style="color: #00a0f0;">麻烦输一哈新的密码</label>
                                <input type="password" class="form-control" name="password" id="password" value="${user.password}"
                                       placeholder="输入密码，见证律动" aria-describedby="inputSuccess3Status"
                                       onchange="check()">
                            </div>
                            <div class="form-group">
                                <label for="secondpassword" style="color: #00a0f0;">再次输一哈密码，确认一哈～</label>
                                <input type="password" class="form-control" id="secondpassword" value="${user.password}"
                                       placeholder="再次输入密码，契合共鸣" onchange="check()">
                            </div>
                            <div style="opacity: 0; color: rgba(255,42,242,0.6);" id="error">哎呀～&nbsp;两次输入密码不一致，重来一哈</div>
                            <button type="submit" class="button-sumbit"
                                    style="color: #00a0f0;font-size: 18px;font-weight: 900; margin-left: 230px; margin-top: 20px;text-decoration: none">
                                提&nbsp;&nbsp;交
                            </button>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<script>
    function check() {
        var psd = $("#password").val();
        var spsd = $("#secondpassword").val();
        console.log("psd:" + psd);
        console.log("secondpsd" + spsd);
        if (spsd != "") {
            if (psd != spsd) {
                console.log("密码不一致");
                $("#error").css("opacity", "1");
            } else {
                console.log("两次输入密码一致");
                $("#error").css("opacity", "0");
            }
        } else {
            console.log("第一次输入");
        }
    }
</script>
</body>
</html>