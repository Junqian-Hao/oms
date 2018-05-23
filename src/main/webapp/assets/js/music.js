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