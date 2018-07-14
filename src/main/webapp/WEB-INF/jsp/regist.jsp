<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
    <title>静听--注册</title>
    <link rel="stylesheet" href="../../assets/css/APlayer_files/docute.css">
    <link rel="stylesheet" href="../../assets/css/APlayer_files/theme-github.css"/>
    <link rel="stylesheet" type="text/css" href="../../assets/live2d/waifu.css"/>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-48084758-8"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'UA-48084758-8');
    </script>
    <link rel="stylesheet" href="../../assets/css/APlayer_files/APlayer.min.css">
    <link rel="stylesheet" href="../../assets/css/login.css">
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
    <script src="../../assets/js/APlayer_files/hls.min.js"></script>
    <script src="../../assets/js/APlayer_files/color-thief.js"></script>
    <style>
        body {

            text-rendering: auto;
        }

        #evanyou-canvas {
            z-index: -1 !important;
        }

        .aplayer-wrap {
            max-width: 700px;
            margin: 20px 0;
        }

        .sidebar-toggle {
            z-index: 90;
        }
    </style>
    <script src="../../assets/js/jquery.min.js"></script>
</head>
<body>
<!-- don't remove this part start -->
<div class="landing">
    <h1>歌&nbsp;&nbsp;谣</h1>

    <h3>🍭 注入音律, 册身其中.</h3>

    <div class="aplayer-wrap">


        <div class="login">

            <form action="/register" method="post">
                <div class="form-group">
                    <label for="username"></label>
                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder="昵&nbsp;&nbsp;称">
                </div>
                <div class="form-group">
                    <label for="username"></label>
                    <input type="text" class="form-control" name="username" id="username" placeholder="你的音乐账号，你的视听窗口">
                    <div style=" color: rgba(255,42,242,0.6);">${error}</div>
                </div>
                <div class="form-group" >
                    <label for="password"></label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="输入密码，见证律动" aria-describedby="inputSuccess3Status" onchange="check()">
                </div>
                <div class="form-group" >
                    <label for="secondpassword"></label>
                    <input type="password" class="form-control"  id="secondpassword" placeholder="再次输入密码，契合共鸣" onchange="check()">
                </div>
                <div style="opacity: 0; color: rgba(255,42,242,0.6);" id="error">两次输入密码不一致</div>
                <button type="submit" class="btn btn-link" style="color: rgba(187,11,255,0.6);font-size: 18px;font-weight: 1300; margin-left: 150px;text-decoration: none">
                    注&nbsp;&nbsp;册</button>

            </form>

        </div>
        <!--Aplayer音乐播放器-->
        <!--<div id="aplayer"></div>-->


    </div>

</div>
<!--兄弟，纸片人-->
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
<script src="../../assets/js/jquery.min.js"></script>
<script src="../../assets/js/APlayer_files/docsearch.js"></script>
<script src="../../assets/js/APlayer_files/evanyou.min.js"></script>
<script src="../../assets/js/APlayer_files/docute.js"></script>
<script src="../../assets/js/APlayer_files/config.js"></script>
<script src="../../assets/js/APlayer_files/APlayer.min.js"></script>

<script src="../../assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>
<script src="../../assets/live2d/waifu-tips.js"></script>
<script src="../../assets/live2d/live2d.js"></script>
<script type="text/javascript">initModel("../../assets/live2d/")</script>

<script>
    function check() {
        var psd=$("#password").val();
        var spsd=$("#secondpassword").val();
        console.log("psd:"+psd);
        console.log("secondpsd"+spsd);
        if(spsd!=""){
            if (psd != spsd) {
                console.log("密码不一致");
                $("#error").css("opacity", "1");
            } else {
                console.log("两次输入密码一致");
                $("#error").css("opacity", "0");
            }
        }else {
           console.log("第一次输入");
        }
    }
</script>
<!-- livereload script placeholder -->
<!-- don't remove this part end -->

</body>
</html>