$(()=>{
	$("#header").load("header.html");
})
$(()=>{
	var $basImgs = $(".product_list.basket>ul");
	var $guiImgs = $(".product_list.guizu>ul");
	var $newImgs = $(".product_list.new>ul");
	var $fasImgs = $(".product_list.fashion>ul");
	$.ajax({
		type:"get",
		url:"data/routes/shopping/getShoppingBasket.php",
		data:"style=篮球鞋",
		error:function(){
			alert("网络错误请检查");
		}
	}).then(data=>{
		console.log(data);
		var html = `
			<li class="b_img">
				<a href="productAll.html?kw=篮球" target="_blank">
					<div class="product_div">
						<img src="img/shopping_product/cropped_CS686X450_1_.jpg" alt="">
					</div>
				</a>
			</li>
		`;
		for(var p of data){

			html+=`
				<li>
					<a href="product.html?sid=${p.sid}" target="_blank">
						<div class="product_div">
							<img src="${p.img}" alt="">
						</div>
						<h6>${p.title}</h6>
						<div class="product_info clearfix">
							<div class="product_price">¥${p.price}</div>
							<div class="product_source">${p.saleStyle}</div>
						</div>
					</a>
				</li>
			`
		}
		$basImgs.html(html);
	})

    $.ajax({
        type:"get",
        url:"data/routes/shopping/getShoppingBasket.php",
        data:"style=贵族",
        error:function(){
            alert("网络错误请检查");
        }
    }).then(data=>{
        console.log(data);
        var html = `
			<li class="b_img">
				<a href="productAll.html?kw=贵族" target="_blank">
					<div class="product_div">
						<img src="img/shopping_product/cropped_350zebra_686x450.jpg" alt="">
					</div>
				</a>
			</li>
		`;
        for(var p of data){

            html+=`
				<li>
					<a href="product.html?sid=${p.sid}" target="_blank">
						<div class="product_div">
							<img src="${p.img}" alt="">
						</div>
						<h6>${p.title}</h6>
						<div class="product_info clearfix">
							<div class="product_price">¥${p.price}</div>
							<div class="product_source">${p.saleStyle}</div>
						</div>
					</a>
				</li>
			`
        }
        $guiImgs.html(html);
    })

    $.ajax({
        type:"get",
        url:"data/routes/shopping/getShoppingBasket.php",
        data:"style=跑步",
        error:function(){
            alert("网络错误请检查");
        }
    }).then(data=>{
        console.log(data);
        var html = `
			<li class="b_img">
				<a href="productAll.html?kw=跑步" target="_blank">
					<div class="product_div">
						<img src="img/shopping_product/cropped_eqt686x450.jpg" alt="">
					</div>
				</a>
			</li>
		`;
        for(var p of data){

            html+=`
				<li>
					<a href="product.html?sid=${p.sid}" target="_blank">
						<div class="product_div">
							<img src="${p.img}" alt="">
						</div>
						<h6>${p.title}</h6>
						<div class="product_info clearfix">
							<div class="product_price">¥${p.price}</div>
							<div class="product_source">${p.saleStyle}</div>
						</div>
					</a>
				</li>
			`
        }
        $newImgs.html(html);
    })

    $.ajax({
        type:"get",
        url:"data/routes/shopping/getShoppingBasket.php",
        data:"style=休闲",
        error:function(){
            alert("网络错误请检查");
        }
    }).then(data=>{
        console.log(data);
        var html = `
			<li class="b_img">
				<a href="productAll.html?kw=休闲" target="_blank">
					<div class="product_div">
						<img src="img/shopping_product/cropped_PANTS686X450.jpg" alt="">
					</div>
				</a>
			</li>
		`;
        for(var p of data){

            html+=`
				<li>
					<a href="product.html?sid=${p.sid}" target="_blank">
						<div class="product_div">
							<img src="${p.img}" alt="">
						</div>
						<h6>${p.title}</h6>
						<div class="product_info clearfix">
							<div class="product_price">¥${p.price}</div>
							<div class="product_source">${p.saleStyle}</div>
						</div>
					</a>
				</li>
			`
        }
        $fasImgs.html(html);
    })


    // 楼层滚动
	var $lift = $(".lift");
	var $productLists = $(".product_list");
	$(window).scroll(()=>{
        var scrollTop=$(window).scrollTop();
        var offsetTop=$(".product_list.basket").offset().top;
        if(offsetTop<scrollTop+innerHeight/2)
            $lift.show();
        else
            $lift.hide();
        for(var p of $productLists){
        	var $p = $(p);
        	var offsetTop = $p.offset().top;
            if(offsetTop<scrollTop+innerHeight/2){
				var i = $productLists.index($p);
				var $li = $lift.find(".lift_item:eq("+i+")");
				$li.addClass("lift_item_on").siblings().removeClass("lift_item_on");
            }
		}
    })

	$lift.on("click",".lift_item",function(e){
		var $li = $(this);
		if(!$li.is(":last-child")){
			var i = $li.index();
			var offsetTop = $productLists.eq(i).offset().top;
            $("html,body").stop(true).animate({
                scrollTop:
                    $("#header").is(".header_fix")?
                        offsetTop-80:offsetTop-80-80
            },500);
		}else
            $("html,body").stop(true).animate({
                scrollTop:0
            },500);

	})
})

// 鼠标悬停图片放大
$(()=>{
	var $listImg = $(".product_list>ul");
	$listImg.on("mouseenter","img",function(){
		console.log($(this));
		$(this).addClass('scale');
		$(this).parent().parent().parent().addClass('shadow');
	})
	$listImg.on("mouseleave","img",function(){
		$(this).removeClass('scale');
		$(this).parent().parent().parent().removeClass('shadow');
	})
})


/*为search按钮添加单击事件，跳转到商品列表页*/
//查找data-trigger属性为search的a绑定单击事件
