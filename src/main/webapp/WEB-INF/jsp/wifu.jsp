<%--
  Created by IntelliJ IDEA.
  User: tyran
  Date: 2018/7/14
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Live2D 看板娘 v1.2 / Demo</title>

    <link rel="stylesheet" type="text/css" href="../../assets/live2d/waifu.css"/>
    <script src="../../assets/js/jquery.min.js"></script>
</head>
<body>
<h2><a href="https://www.fghrsh.net/post/123.html" style="color: #38A3DB">Live2D 看板娘 v1.2</a> / Demo</h2>

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

<script src="../../assets/live2d/waifu-tips.js"></script>
<script src="../../assets/live2d/live2d.js"></script>
<script type="text/javascript">initModel("../../assets/live2d/")</script>
</body>
</html>