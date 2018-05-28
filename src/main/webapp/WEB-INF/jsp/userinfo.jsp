<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${username} - ${nickname} - 静听网 </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/music.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/category.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/userinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">
    <title>个人主页</title>
</head>
<body>
<!--头部-->
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
                <li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
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
<!--左侧边栏-->
<div class="container-sm category-header-wrap">
    <div class="category-header-banner">
        <div class="img" style="background-image: url('../../storage/category/cartoon.jpg')">
            <div class="content">
                <h1 style="position: relative">${nickname} <span style="display: inline-block;position: absolute;top: -13px;"><img src="${pageContext.request.contextPath}/assets/images/奖章.png" width="60px" height="60px" alt="大会员"></span>
                    <span style="display: inline-block;position: relative;left: 22px; font-weight: 900">${level}</span>
                </h1>
                <p style="position: relative">所爱隔山海，山有径可寻，海有舟可渡<span style="position: absolute;top: -10px;left: 250px;display: inline">
                    <a href="${pageContext.request.contextPath}/user/userinfochange" style="display: inline-block;" ><img src="${pageContext.request.contextPath}/assets/images/修改.png" width="25px" height="25px" alt="个人信息修改">
                        </a></span>
                    <!--<span style="font-size: 2px;position: absolute;top: 4px;left: 275px">修改</span>-->
                </p>
            </div>
            <div class="mask"></div>
        </div>
    </div>
</div>
<!--右侧边栏-->
<div class="container-sm box">
    <div class="main" style="float: left">
        <div class="main-wrap" style=" width: 700px;float: left">
            <div class="content-box">
                <div class="hot-recommand">
                    <!--我来组成头部-->
                    <div class="content-header" style="border-bottom: 2px solid #7cb9ed;overflow: ">
                        <h2>
                            <i class="fa fa-music red"></i>
                            我已经上传的歌曲
                        </h2>

                        <div class="tab" style="position: relative;margin-left: 240px">
                            <div style="font-size: 15px;color: #74b1ed">容量</div>
                            <div class="jindutiao"><div class="jindutiao-in" style="width: ${rlpercent};"></div></div>
                            <div style="position: absolute;right: -105px;top: 0px;color: #74b1ed;">${uspace}<span style="font-weight: 900">/</span>${totalSpace}</div>
                        </div>
                    </div>
                    <!--音乐显示区域-->
                    <ul class="music-list clearfix">
                        <c:forEach items="${myMusics}" var="music" varStatus="vs">
                            <li>
                                <div class="u-cover">
                                    <img src="${pageContext.request.contextPath}/${music.mpicurl}">
                                    <a title="Refrain - Anan Ryoko" href="${pageContext.request.contextPath}/singlemusicView?Mid=${music.mid}" class="msk"></a>
                                </div>
                                <p class="dec">
                                    <a title="Refrain - Anan Ryoko" href="${pageContext.request.contextPath}/singlemusicView?Mid=${music.mid}">${music.mtitle}</a>
                                </p>
                                <div class="author">${music.mauthor}</div>
                            </li>
                        </c:forEach>
                    </ul>
                    <!--我点赞的歌曲-->
                    <div class="content-header" style="border-bottom: 2px solid #7cb9ed">
                        <h2>
                            <i class="fa fa-music red"></i>
                            我like的歌曲
                        </h2>
                    </div>
                    <!--歌曲显示-->
                    <ul class="music-list clearfix">
                        <c:forEach items="${mygood}" var="good" varStatus="vs">
                            <li>
                                <div class="u-cover">
                                    <img src="${pageContext.request.contextPath}/${good.music.mpicurl}">
                                    <a title="Refrain - Anan Ryoko" href="${pageContext.request.contextPath}/singlemusicView?Mid=${good.music.mid}" class="msk"></a>
                                </div>
                                <p class="dec">
                                    <a title="Refrain - Anan Ryoko" href="${pageContext.request.contextPath}/singlemusicView?Mid=${good.music.mid}">${good.music.mtitle}</a>
                                </p>
                                <div class="author">${good.music.mauthor}</div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

        </div>
        <div class="sidebar" style="min-height: 1094px; float: right">
            <div class="right-module" style="background: #76cfff">
                <h4>未完待续</h4>
            </div>
            <div style="padding: 20px 10px;position: relative;" >

                <a href="${pageContext.request.contextPath}/77150">
                    <img src="/assets/images/添加音乐.png" style="position: relative;top: 5px;margin-left: 11px">
                    <span style="display: inline-block; color: #ed5987">上传音乐</span>&nbsp;&nbsp;
                </a>
                <div style="height: 1px;background-color: white"></div>
                <img src="/assets/images/积分.png" style="position: relative;top: 5px;margin-left: 10px">
                <span style="display: inline-block; color: #00a0dc">我的积分</span>&nbsp;&nbsp;
                <span style="display: inline-block; color: #ed376d">12345</span>
            </div>
            <%--积分规则--%>
            <div style="border-top: 4px solid #ed5987; margin: 10px 20px;padding-top: 10px;position: relative">
                <img src="/assets/images/积分规则.png" style="position: relative;top: 5px;">
                <span style="display: inline-block;color: #ed5987;margin-bottom: 10px">积分规则</span><br>
                <img src="/assets/images/红心.png" style="position: relative;top: 5px;">
                <span style="margin-top: 5px;display:inline-block;font-size: 15px;color: #ed5987;" >&nbsp;Like：&nbsp;+1</span>
                <span style="margin-top: 5px;margin-left: 29px;display:block;font-size: 15px;color: #61b0ed;" >上传歌曲：&nbsp;+1</span>
                <span style="margin-top: 5px;margin-left: 29px;display:block;font-size: 15px;color: #61b0ed;" >下载歌曲：&nbsp;-20</span>
                <span style="margin-top: 5px;margin-left: 29px;display:block;font-size: 15px;color: #ed5987;" >收到Like：&nbsp;+1</span>


            </div>
        </div>
    </div>
</div>
<footer>
    <div class="container">
        <div class="copyright">
            <p>Copyright © <span class="update-year">2018</span> 586 - All Rights Reserved&nbsp;&nbsp;|&nbsp;&nbsp;2015级
            </p>
        </div>
    </div>
</footer>
<script src="../../assets/js/jquery.min.js"></script>
</body>
</html>