<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">



    <link rel="stylesheet" href="../../assets/css/base.css" type="text/css" />
    <link rel="stylesheet" href="../../assets/css/common-less(1).css" type="text/css" />
    <link rel="stylesheet" href="../../assets/css/moco.min.css" type="text/css" />
    <link rel="stylesheet" href="../../assets/css/common-less.css" type="text/css" />
    <link rel="stylesheet" href="../../assets/css/profile-less.css" type="text/css" />

</head>

<body >




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
                <div class="formBox">
                    <div id="setting-profile" class="setting-wrap setting-profile">

                        <form id="profile" >

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="nick" >昵称：</label>
                                <div class="rlf-group">
                                    <input type="text" name="nickname" id="nick"  autocomplete="off"  data-validate="require-nick"  class="moco-form-control"  placeholder="请输入新昵称."/>
                                    <p class="rlf-tip-wrap errorHint color-red" ></p>
                                </div>
                            </div>
                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="nick" >密码：</label>
                                <div class="rlf-group">
                                    <input type="password" name="password" id="password"  autocomplete="off"   class="moco-form-control"  placeholder="请输入新密码."/>
                                    <p class="rlf-tip-wrap errorHint color-red" ></p>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="aboutme">个性签名：</label>
                                <div class="rlf-group">
                                    <div class="pr">
                                        <textarea name="aboutme"  id="aboutme"  rows="5" class="noresize js-sign moco-form-control"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="wlfg-wrap clearfix">
                                <label class="label-name" for="profile-submit"></label>
                                <div class="rlf-group">
                                    <span id="profile-submit"  hidefocus="true"  aria-role="button" class="rlf-btn-green btn-block profile-btn">保存</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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



</div>
</body>
</html>
