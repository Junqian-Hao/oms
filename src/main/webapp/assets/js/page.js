/**
 * Created by macbookair on 2018/5/25.
 */
var curPage = 1; //当前页码
var total,pageSize,totalPage; //总记录数，每页显示数，总页数
getData(1);
$("#pagecount").on('click','span a',function(){
    var rel = $(this).attr("rel");
    if(rel){
        getData(rel);
    }
});
function getData(page){
    $.ajax({
        url:"",
        type:'POST',
        data: {'pageNum':page-1},
        beforeSend:function(){

        },
        success:function(json){
            // console.log(json);
            total = json.total; //总记录数
            pageSize = json.pageSize; //每页显示条数
            curPage = page; //当前页
            totalPage = json.totalPage; //总页数
            var ul=$('.theme_body').find('*').remove();
            string='';
            $.each(json.list,function(index,array){ //遍历json数据列
                string+='';

            });
            $(".theme_body").append(string);

        },
        complete:function(){ //生成分页条
            getPageBar();
        },
        error:function(){
            alert("数据加载失败");
        }
    });
}
//获取分页条
function getPageBar(){
    $("#pagecount").find('*').remove();
    //页码大于最大页数
    if(curPage>totalPage) curPage=totalPage;
    //页码小于1
    if(curPage<1) curPage=1;
    pageStr = "<span>共"+total+"条</span><span>"+curPage+"/"+totalPage+"</span>";

    //如果是第一页
    if(curPage==1){
        pageStr += "<span>首页</span><span>上一页</span>";
    }else{
        pageStr += "<span><a href='javascript:void(0)' rel='1'>首页</a></span><span><a href='javascript:void(0)' rel='"+(curPage-1)+"'>上一页</a></span>";
    }

    //如果是最后页
    if(curPage>=totalPage){
        pageStr += "<span>下一页</span><span>尾页</span>";
    }else{
        pageStr += "<span><a href='javascript:void(0)' rel='"+(parseInt(curPage)+1)+"'>下一页</a></span><span><a href='javascript:void(0)' rel='"+totalPage+"'>尾页</a></span>";
    }
    $("#pagecount").append(pageStr);
}