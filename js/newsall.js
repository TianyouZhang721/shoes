function loadNews(pno=1,style){

    // if(location.search.slice(7)=="all"){
    //     var data="pno="+pno;
    // }

    $.ajax({
        type:"get",
        url:"data/routes/news/getNewsAll.php",
        data:"pno="+pno+"&style="+style
    }).then(output=>{
        console.log(output);
        var html = "";
        var news = output.data;
        for(var n of news){
            html+=`
                <li data-type="${n.hid}">
                    <a href="news.html?hid=${n.hid}">
                        <div class="news_pic">
                            <img src="${n.sm}" alt="">
                        </div>
                        <div class="news_info">${n.title}</div>
                        <div class="news_tips">
                            <span class="tip_view">
                                <img src="img/icon/icon_ni_view.png" alt="">
                                ${n.view}
                            </span>
                        </div>
                    </a>
                </li>
            `;
        }
        $(".news_item>ul").html(html);

        // 分页条
        var pageCount=output.pageCount,
            pageNo=output.pageNo;
        var html=`<a href="javascript:;" class="previous">上一页</a>`;
        for(var i=1;i<=pageCount;i++){
            html+=`<a href="javascript:;">${i}</a>`;
        }
        html+=`<a href="javascript:;" class="next">下一页</a>`;
        var $pages = $("#pages");
        $pages.html(html);
        $pages.children(":eq("+(pageNo)+")")
            .addClass("current");

        checkPage($pages,pageCount,pageNo);

        //为pages绑定单击事件
        $pages.off("click").click(e=>{
            var $tar = $(e.target);
            if($tar.is("a")){
                //如果a不是pages的第一个子元素和最后一个子元素
                if(!$tar.is(":first-child,:last-child")){
                    if(!$tar.is("current")){
                        var pno = $tar.html();
                        console.log(pno);
                        loadNews(pno,style);
                    }
                }else{
                    if(!$tar.is(".disabled")){
                        var $curr = $pages.children(".current");
                        if($tar.is(".next")){
                            loadNews(parseInt($curr.html())+1,style);
                        }else{
                            loadNews($curr.html()-1,style);
                        }
                    }
                }
            }

        })
    })
}

function checkPage($pages,pageCount,pageNo){
    //获得pages下两个a
    var $prev=$pages.children().first();
    var $next=$pages.children().last();
    //如果pageNo不是0，也不是pageCount
    if(pageNo!=1&&pageNo!=pageCount){
        $prev.removeClass(".disabled");
        $next.removeClass(".disabled");
    }else{
        //如果pageNo==0,就prev禁用
        if(pageNo==1){
            $prev.addClass("disabled");
        }
        if(pageNo==pageCount){
            $next.addClass("disabled");
        }

    }
}

$(()=>{
    loadNews();
})

$(()=>{
    $(".news_item").on("click","ul>li",function(e){
        console.log($(this));
        var hid = $(this).data("type");
        console.log(hid);
        $.ajax({
            type:"post",
            url:"data/routes/news/viewAdd.php",
            data:"hid="+hid
        }).then(data=>{
            if(data.code>0){
                return;
            }
        })
    })
})


// 热门文章
$(()=>{
    $.ajax({
        type:"get",
        url:"data/routes/news/getNewsFashionAll.php"
    }).then(data=>{
        var html = "";
        var $hotNew = $(".hot_items>ul");
        for(var n of data){
            html+=`
                <li data-type="${n.hid}">
                    <a href="news.html?hid=${n.hid}">
                        <div class="item_cover">
                            <img src="${n.sm}" alt="">
                        </div>
                        <h6>${n.title}</h6>
                    </a>
                </li>
            `
        }
        $hotNew.html(html);
    })
})

// 导航单击事件
$(()=>{
    var $newNav = $(".news_nav");
    $newNav.on("click","a",function(e){

        loadNews(1,$(this).html());
        $(this).addClass('current');
        $(this).siblings().removeClass('current');

        })
})
    
// 鼠标移入事件
$(()=>{
    var $newsUl = $(".news_item>ul");
    $newsUl.on("mouseenter","li",function(e){
        $(this).addClass('scall');
    });
    $newsUl.on("mouseleave","li",function(e){
        $(this).removeClass('scall');
    })
})
