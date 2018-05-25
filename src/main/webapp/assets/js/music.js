/**
 * Created by macbookair on 2018/5/23.
 */

$(document).ready(function () {

    $("#heart").click(function () {
        var uid =${sessionScope.user.uid};
        var mid =${music.mid};
        var kv = "uid" + uid + "&mid" + mid;
        if ($("#heart").attr("src") == "../assets/images/心.png") {
            $.ajax({
                url: "/like",
                type: "POST",
                data: kv,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                        $("#heart").attr("src", "../assets/images/红心.png");
                    }else {
                        console.log("变白心失败");
                    }
                }

            });
        } else {
            $.ajax({
                url: "/like",
                type: "POST",
                data: kv,
                dataType: "json",
                success: function (data) {
                    console.log(data);
                    if (data.code) {
                       console.log("变红心失败");
                    }else {
                        $("#heart").attr("src", "../assets/images/心.png");
                    }
                }

            });
        }
    });
});


$("#download-music-img").click(function () {
    var r = confirm("此次下载将扣除您20积分，是否继续?");
    if (r == true) {
        $.ajax({
            url: "/judgePoints",
            type: "post",
            success: function (res) {
                console.log()
                if (res.code == 1) {
                    $("#download-music-form").submit();
                } else {
                    alert("您的积分不足");
                }
            }
        })
    }
});
$("#download-music-img2").click(function () {
    alert("您尚未登录,请先登录");
});