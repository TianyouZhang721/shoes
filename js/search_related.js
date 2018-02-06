$(()=> {
    var $tabs = $(".tabs");
    var $news_content = $("#search_content1");
    var $products_content = $("#search_content2");
    var $equip_content = $("#search_content3");

    var $news = $(".item_news>ul");
    var $products = $(".item_products>ul");
    var $equip = $(".item_equip>ul");
    var $input = $(".search_box>input");
    var $kw = $input.val();
    var clickCi = 0;
    var str = "";

    function isShow(){
        if($kw==""){
            console.log(1);
            var html = `
                <div class="search_none">
                    <img src="img/icon/none.png" alt="">
                </div>
            `;
            $news_content.html(html).show();
            $products_content.html(html);
            $equip_content.html(html);
        }
    }
    isShow();





    function getLocalTime(ns) {
        return new Date(parseInt(ns) * 1000).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
    }
    $tabs.on("click", "ul>li", function (e) {
        $(this).children().addClass("current");
        $(this).siblings().children().removeClass("current");
        var i = $(this).index();
        $(this).parent().parent().next().children(":eq("+i+")").show();
        $(this).parent().parent().next().children(":eq("+i+")").siblings().hide();
        $(".btn_search").click();


        var clickStr = $(this).children().html();
        if(clickStr!==str){
            if(clickCi>=3){
                $(".load").hide();
            }
            clickCi+=1;
            str=clickStr;
            console.log(str);
            console.log(clickCi);

        }
    })

    $(".btn_search").click(e => {
        var $tar = $(e.target);
        var $input = $(".search_box>input");
        var $kw = $input.val();
        console.log($kw);
        if($kw!=""){
            $(".load").addClass("go");
            timer = setTimeout(()=>{
                $(".load").removeClass('go');
                if ($tabs.children().children().children(".current").html() == "资讯") {
                    $news_content.show();
                    $news_content.siblings().hide();
                    console.log("资讯");
                    $.ajax({
                        type: "get",
                        url: "data/routes/search/searchNews.php",
                        data: "kw="+$kw
                    }).then(data=>{
                        console.log(data);
                        var count = data.count;
                        console.log(count);
                        var html = `
                     <div class="c_tips">`;
                        html += `
                    <span>
                        含&nbsp;&nbsp;
                        <em>nike</em>
                        &nbsp;&nbsp;的搜索结果约&nbsp;&nbsp;${count[0].c}&nbsp;&nbsp;条
                    </span>
                `;
                        // $("#search_content1 .c_tips").html(html);
                        html+=`</div>
                                <div class="c_items item_news">
                                    <ul>`;
                        var news = data.news;
                        for (var n of news) {
                            html += `
                        <li class="s_news_item s_object_item">
                                                <a href="news.html?hid=${n.hid}">
                                                    <div class="news_img">
                                                        <img src="${n.sm}" alt="">
                                                    </div>
                                                    <dl class="news_text">
                                                        <dt>${n.title}
                                                        </dt>
                                                        <dd class="news_desc">
                                                            ${n.des}
                                                        </dd>
                                                        <dd class="news_time">
                                                            ${getLocalTime(n.publish_time)}
                                                        </dd>
                                                    </dl>
                                                </a>
                                            </li>
                    `;
                        }
                        html+=`</ul>
                                </div>`
                        $news_content.html(html);
                    })
                } else if ($tabs.children().children().children(".current").html() == "商品") {
                    console.log("商品 ");
                    $products_content.show();
                    $products_content.siblings().hide();
                    $.ajax({
                        type: "get",
                        url: "data/routes/search/searchProducts.php",
                        data: "kw="+$kw
                    }).then(data => {
                        var count = data.count;
                        var html = `
                     <div class="c_tips">`;
                        html += `
                    <span>
                        含&nbsp;&nbsp;
                        <em>nike</em>
                        &nbsp;&nbsp;的搜索结果约&nbsp;&nbsp;${count[0].c}&nbsp;&nbsp;条
                    </span>
                `;
                        // $("#search_content2 .c_tips").html(html);
                        html+=`</div>
                                <div class="c_items item_products">
                                    <ul class="clearfix">`;
                        var products = data.products;
                        for (var p of products) {
                            html += `
                        <li class="s_products_item s_object_item">
                                            <div class="product_pic">
                                                <a href="product.html?sid=${p.sid}">
                                                    <img src="${p.img}" alt="">
                                                </a>
                                            </div>
                                            <div class="product_title">
                                                <a href="#">${p.title}</a>
                                            </div>
                                            <div class="product_info clearfix">
                                                <div class="product_price">
                                                    <div class="price_current">¥${p.price}</div>
                                                </div>
                                            </div>
                                        </li>
                    `;
                        }
                        html+=`</ul>
                                </div>`;
                        $products_content.html(html);
                    })
                }else if($tabs.children().children().children(".current").html() == "装备"){
                    $equip_content.show();
                    $equip_content.siblings().hide();
                    $.ajax({
                        type: "get",
                        url: "data/routes/search/searchEquip.php",
                        data: "kw="+$kw
                    }).then(data => {
                        console.log(data);
                        var count = data.count;
                        var html = `
                     <div class="c_tips">`;
                        html += `
                    <span>
                        含&nbsp;&nbsp;
                        <em>nike</em>
                        &nbsp;&nbsp;的搜索结果约&nbsp;&nbsp;${count[0].c}&nbsp;&nbsp;条
                    </span>
                `;
                        // $("#search_content3 .c_tips").html(html);
                        html+=`</div>
                                <div class="c_items item_equip">
                                    <ul class="clearfix">`;
                        var equip = data.equip;
                        for (var e of equip) {
                            html += `
                        <li class="s_equip_item s_object_item">
                                            <div class="equip_pic">
                                                <a href="#">
                                                    <img src="${e.img}" alt="">
                                                </a>
                                            </div>
                                            <div class="equip_title">
                                                <a href="#">${e.title}</a>
                                            </div>
                                            <div class="equip_info">
                                                <span>${e.subtitle}</span>
                                            </div>
                                        </li>
                    `;
                        }
                        html+=`</ul>
                                </div>`
                        $equip_content.html(html);
                    })
                }
            },900)
        }


    })
})
