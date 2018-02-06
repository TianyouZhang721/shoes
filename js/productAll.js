

$(()=>{
    getData(0,25);
    var $loadMore = $(".load_more");
    var counter = 0;
    var pageStart = 0;
    var pageSize = 15;

    $loadMore.click(e=>{
        counter++;
        pageStart = counter * pageSize;
        getData(pageStart,pageSize);

    })
    //offset已经显示的条数
    //pageSize每次多加载的条数
    function getData(offset,pageSize){
        var $productList = $(".s_product_list");
        var kw = location.search.slice(4);
        console.log(kw);
        $.ajax({
            type:"get",
            url:"data/routes/shopping/getShoppingAll.php",
            data:"kw="+kw
        }).then(data=>{
            console.log(data);
            var sum = data.length;
            var $product_count = $(".product_count");
            $product_count.children('em').html(sum);
            console.log(sum);
            console.log(offset+pageSize);
            // 如果没有更多可以加载则隐藏加载更多
            if(sum<offset+pageSize){
                $loadMore.hide();
            }
            var html = "";
            if(sum-offset<pageSize){
                pageSize = sum-offset;
            }
            for(var i=offset;i<(offset+pageSize);i++){
                html += `
                <li class="s_product_item">
						<a href="product.html?sid=${data[i].sid}">
							<div class="product_pic">
								<img src="${data[i].img}" alt="">
							</div>
							<h6>${data[i].title}</h6>
							<div class="product_info">
								<div class="product_price fl">¥${data[i].price}</div>
								<div class="product_source fr">${data[i].saleStyle}</div>
							</div>
						</a>
					</li>
            `
            }
            $productList.append(html);
        })

        var $crumbs = $(".crumbs");
        var kw = decodeURI(location.search.slice(4));
        console.log(kw);
        if(!kw){
            $crumbs.children(".items").hide();
        }else{
            $crumbs.children(".items").children().html("关键词:"+kw+`<a href="#">删除</a>`);
        }
    }


    // $(".s_product_list").
})