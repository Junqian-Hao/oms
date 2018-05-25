/**
 * Created by macbookair on 2018/5/23.
 */



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