/**
 * Created by macbookair on 2018/5/29.
 */

$("#search-btn").on("click", function () {
    var content = $("#search-input").val();

    if (content==null){

    }else {

        var json =
            {
                thispage:1,
                input:content
            };
        $.ajax({
            url: "/searchMusic",
            type: "POST",
            contentType :"application/json",
            data: JSON.stringify(json),

            success: function (res) {
                window.location.href = 'http://localhost:8080/searchpage?content='+content;
            }

        })

    }

});
