<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
    <title>APlayer</title>
    <link rel="stylesheet" href="../../assets/css/APlayer_files/docute.css">
    <link rel="stylesheet" href="../../assets/css/APlayer_files/theme-github.css"/>
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
</head>
<body>
<!-- don't remove this part start -->
<div class="landing">
    <h1>歌&nbsp;&nbsp;谣</h1>

    <h3>🍭 余音袅袅, 笙笙不息.</h3>

    <div class="aplayer-wrap">


        <div class="login">

                <form>
                    <div class="form-group">
                        <label for="username"></label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="你的音乐账号，你的视听窗口">
                    </div>
                    <div class="form-group" >
                        <label for="password"></label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="输入密码，见证音乐">
                    </div>
                    <button type="submit" class="btn btn-link" style="color: rgba(187,11,255,0.6);font-size: 18px;font-weight: 1300; margin-left: 150px;text-decoration: none">
                        进&nbsp;&nbsp;入</button>

                </form>

        </div>
        <div id="aplayer"></div>


    </div>

</div>
<script src="../../assets/js/APlayer_files/docsearch.js"></script>
<script src="../../assets/js/APlayer_files/evanyou.min.js"></script>
<script src="../../assets/js/APlayer_files/docute.js"></script>
<script src="../../assets/js/APlayer_files/config.js"></script>
<script src="../../assets/js/APlayer_files/APlayer.min.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<SCRIPT>
    const ap = new APlayer({
        container: document.getElementById('aplayer'),
        mini: false,
        autoplay: true,
        theme: '#FADFA3',
        loop: 'all',
        order: 'random',
        preload: 'auto',
        volume: 0.7,

        mutex: true,
        listFolded: false,
        listMaxHeight: '90px',
        audio: [
            {
                name: '成都',
                artist: '赵雷',
                url: 'music/chengdu.mp3',
                cover: 'storage/category/piane.jpg',
                theme: '#ebd0c2'
            },
            {
                name: '成都成都',
                artist: '赵雷',
                url: 'music/chengdu.mp3',
                cover: 'storage/category/piane.jpg',
                theme: '#46718b'
            },
            {
                name: '成都',
                artist: '赵雷',
                url: '../music/chengdu.mp3',
                cover: 'storage/category/piane.jpg',
                theme: '#46718b'
            }
        ]
    });

</SCRIPT>
<!-- livereload script placeholder -->
<!-- don't remove this part end -->
</body>
</html>
