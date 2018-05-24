/**
 * Created by macbookair on 2018/5/23.
 */

$(document).ready(function () {
    $("#heart").click(function () {
        if ($("#heart").attr("src")=="../assets/images/心.png") {
            $("#heart").attr("src", "../assets/images/红心.png");
        } else {
            $("#heart").attr("src", "../assets/images/心.png");
        }
    });
});

$("#download-music").click(function () {
    var mid = $("#mid").val();
    var json={
        mid : mid
    }
    $.ajax({
        url: "/downloadMusic",
        type: "post",
        contentType: "application/json",
        data: JSON.stringify(json),
        success: function (res) {
            if (res.code == 1) {
                console.log("下载成功");
            }else {
                console.log("下载失败");
            }
        }
    })
});