$(()=>{
	// 首页轮播自动播放
	var $Inimgs = $(".carousel"),
		LIWIDTH = 1200,moved = 0,INTERVAL = 500,WAIT = 5000,canMove = true,timer = null;
	var $listCon = $(".banner_control>.banner_list");
	$.ajax({
		type:"get",
		url:"data/routes/product/getCarousel.php"
	}).then(data=>{
        var html = "";
		for(var p of data){
			html+=`
				<a href="newsall.html"" style="background:url('${p.img}') center center no-repeat;background-size:100% 100%; class="banner_3d">
				</a>
			`
		}
		// html+=`
		// 						// <img src="${p.img}" alt="${p.title}">
		// 	<li>
		// 		<a href="${data[0].href}">
		// 			<img src="${data[0].img}" alt="${data[0].title}">
		// 		</a>
		// 	</li>
		// `;
		$Inimgs.html(html).css("width",LIWIDTH);
		$Inimgs.children().first().addClass('active');

		var html1 = "";
		for(var i=0;i<data.length;i++){
			html1+=`
				<li class="list_control">
				    <div class="clip">
				        <img data-list="${i+1}" src="${data[i].img}" alt="${data[i].title}">
				    </div>
				</li>
			`
		}
		// $listCon.html(html1).children().first().children().children().addClass('active');
		$listCon.html("<li></li>".repeat(data.length))
			     .children().first().addClass("hover");


		$listCon.on("click","li",function(e){
			var i = parseInt($(this).index());
			$(this).addClass('hover').siblings().removeClass('hover');
			$Inimgs.children(":eq("+i+")").addClass('active').siblings().removeClass('active');
		})

		$(".banner").mouseenter(function(){
			var thisPy = $(this).children().offset().top;
			var thisPx = $(this).children().offset().left;
			var boxWidth = $(this).children().outerWidth();
		    var boxHeight = $(this).children().outerHeight();
		    $(this).children().addClass('threeD');
		    $(".threeD").mousemove(function(e){
		    	var mouseX = e.pageX - thisPx;
		    	var mouseY = e.pageY - thisPy;
		    	var x;
		    	var y;
		    	if(mouseX > boxWidth/2){
		    		x = mouseX - boxWidth/2;
		    		$(".threeD").css({
		    			"box-shadow":-((boxWidth-mouseX)/100)+"px "+(-((boxHeight-mouseY)/100))+"px "+50+"px "+"rgba(0,0,0,.5)"
		    		});
		    	}else{
		    		x = mouseX - boxWidth/2;
		    		$(".threeD").css({
		    			"box-shadow":(boxWidth-mouseX)/200+"px "+(boxHeight-mouseY)/200+"px "+50+"px "+"rgba(0,0,0,.5)"
		    		});
		    	}
		    	if(mouseY > boxHeight/2){
		    		y = boxHeight/2-mouseY;
		    	}else{
		    		y = boxHeight/2 - mouseY;
		    	}
		    	$(".threeD").css({
		    		"-webkit-transform": "rotateY(" + x / 50 + "deg) " + "rotateX(" + y / 50 + "deg)",
		    	});
		    })
		})

		$(".banner").mouseleave(function(){
			$(this).children().removeClass('threeD');
			$(this).children().css({
			      "-webkit-transform": "rotateY(0deg) rotateX(0deg)"
			    });
		})

		function autoMove(){
			if(canMove){
				var index = $Inimgs.children(".active").index();
				timer = setInterval(()=>{
					index++;
					var $active = $Inimgs.children(".active");
					var $hover = $listCon.children(".hover");
					if(index==data.length){
						$Inimgs.children().first().addClass('active');
						$listCon.children().first().addClass('hover');
						index=0;
					}
					// index++;
					$active.next().addClass('active');
					$active.removeClass('active');
					$hover.next().addClass('hover');
					$hover.removeClass('hover');


				},4000);
			}
		}
		autoMove();

		

		// 鼠标放上停止自动播放
		$(".banner").hover(

			()=>{//关闭轮播的开关变量
				canMove=false;
				clearInterval(timer);//停止等待
				timer=null;
			},
			()=>{//打开轮播开关，启动自动轮播
				canMove=true;
				autoMove();
			}
		);

		// $listCon.on("click","li div img",function(e){
		// 	var $tar = $(this);
		// 	console.log($tar);
		// 	$tar.addClass('active');
		// 	$tar.parent().parent().siblings().children().children().removeClass('active');
		// 	moved = $tar.parent().parent().index();
		// 	console.log(moved);
		// 	$Inimgs.stop(true).animate({
		// 		left:-LIWIDTH*moved
		// 	},INTERVAL);
		// })

	})


	
	
})


// shopping加载
$(()=>{
	var $hot = $(".shopping_menu_list>ul.hot");
	var $basketball = $(".shopping_menu_list>ul.basketball");
	var $run = $(".shopping_menu_list>ul.run");
	// var style = $liMenu.attr("data-type");
	// console.log(style);
	$.ajax({
		type:"post",
		url:"data/routes/shopping/getShoppingBasketIndex.php",
		data:"style=热门"
	}).then(data=>{
		var html = "";
		for(var p of data){
			html+=`
				<li data-style="热门"" data-id=${p.sid}>
					<a>
						<div class="product_pic">
							<img src="${p.img}">
						</div>
						<div class="product_intro">
							<h6>${p.title}</h6>
							<div class="price">￥${p.price}</div>
							<div class="${p.saleStyle}">自营</div>
						</div>
					</a>
				</li>		
			`
		}
		$hot.html(html);

	})

	$.ajax({
		type:"post",
		url:"data/routes/shopping/getShoppingBasketIndex.php",
		data:"style=篮球"
	}).then(data=>{
		var html = "";
		for(var p of data){
			html+=`
				<li data-style="篮球" data-id=${p.sid}>
					<a>
						<div class="product_pic">
							<img src="${p.img}">
						</div>
						<div class="product_intro">
							<h6>${p.title}</h6>
							<div class="price">￥${p.price}</div>
							<div class="${p.saleStyle}">自营</div>
						</div>
					</a>
				</li>		
			`
		}
		$basketball.html(html);

	})

	$.ajax({
		type:"post",
		url:"data/routes/shopping/getShoppingBasketIndex.php",
		data:"style=跑步"
	}).then(data=>{
		var html = "";
        console.log(data);
        for(var p of data){
			html+=`
				<li data-style="跑步" data-id=${p.sid}>
					<a>
						<div class="product_pic">
							<img src="${p.img}">
						</div>
						<div class="product_intro">
							<h6>${p.title}</h6>
							<div class="price">￥${p.price}</div>
							<div class="${p.saleStyle}">自营</div>
						</div>
					</a>
				</li>		
			`
		}
		$run.html(html);

	})
})

// 一楼鼠标移入事件
$(()=>{
	var $liMenu = $(".shopping_menu>ul>li>a");
	var style = $liMenu.attr("data-type");
	var $hot = $(".shopping_menu_list>ul.hot");
	var $basketball = $(".shopping_menu_list>ul.basketball");
	var $run = $(".shopping_menu_list>ul.run");

	$liMenu.click(e=>{
		var $tar = $(e.target);
		$tar.addClass('selected');
		$tar.parent().siblings().children().removeClass('selected');
		if($tar.attr("data-type")=="热门"){
			$hot.addClass("is_show scroll");
			$hot.siblings().removeClass('is_show');
		}else if($tar.attr("data-type")=="篮球"){
			$basketball.addClass('is_show scroll');
			$basketball.siblings().removeClass('is_show');
		}else if($tar.attr("data-type")=="跑步"){
			$run.addClass('is_show scroll');
			$run.siblings().removeClass('is_show');
		}
	})

	// var $productPic = $(".product_pic");
	// console.log($productPic);
	// var $productIntro = $(".product_intro");
	$(".shopping_menu_list").on("mouseenter","ul>li",function(e){
		$(this).children().children().last().addClass('toTop');
		// $productIntro.addClass('miao');
	})
	$(".shopping_menu_list").on("mouseleave","ul>li",function(e){
		$(this).children().children().last().removeClass('toTop');
		// $productIntro.addClass('miao');
	})
	// 点击跳转到对应商品的详情页
	$(".shopping_menu_list").on("click","ul>li",function(e){
		var sid = $(this).data("id");
		location = "product.html?sid="+sid;
	})

})

// news
$(()=>{
	$newTab = $(".news_list>ul");
	$.ajax({
		type:"get",
		url:"data/routes/news/getNewsFashionAll.php"
	}).then(data=>{
		var html = "";
		for(var n of data){
			html+=`
				<li>
				    <a href="news.html?hid=${n.hid}">${n.title}</a>
				</li>

			`;
		}
		$newTab.html(html);
	})
})
$(()=>{
	var $newsNew = $(".news_menu_list>ul.newsNew");
	var $newsBasketball = $(".news_menu_list>ul.newsBasketball");
	var $newsFashion = $(".news_menu_list>ul.newsFashion");
	$.ajax({
		type:"get",
		url:"data/routes/product/getNews.php",
		data:"style=最新"
	}).then(data=>{
		var html = "";
		for(var p of data){
			html+=`
				<li data-type="${p.hid}">
				    <a href="news.html?hid=${p.hid}" title="${p.title}">
				        <div class="news_pic">
				            <img src="${p.sm}" alt="${p.title}">
				        </div>
				        <div class="news_intro">${p.title}</div>
				        <div class="news_tips">
				            <span class="tip_view">
				                <img src="img/icon/icon_ni_view.png" alt="">
				                ${p.view}
				            </span>
				        </div>
				    </a>
				</li>
			`
		}
		html+=`
			<li>
			    <a href="newsall.html">
			        <div class="news_pic">
			            <img src="img/news/sm/all_btn.jpg" alt="">
			        </div>
			    </a>
			</li>
		`;
		$newsNew.html(html);
	})

	$.ajax({
		type:"get",
		url:"data/routes/product/getNews.php",
		data:"style=篮球"
	}).then(data=>{
		var html = "";
		for(var p of data){
			html+=`
				<li data-type=="${p.hid}">
				    <a href="news.html?hid=${p.hid}" title="${p.title}">
				        <div class="news_pic">
				            <img src="${p.sm}" alt="${p.title}">
				        </div>
				        <div class="news_intro">${p.title}</div>
				        <div class="news_tips">
				            <span class="tip_view">
				                <img src="img/icon/icon_ni_view.png" alt="">
				                ${p.view}
				            </span>
				        </div>
				    </a>
				</li>
			`
		}
		html+=`
			<li>
			    <a href="newsall.html">
			        <div class="news_pic">
			            <img src="img/news/sm/all_btn.jpg" alt="">
			        </div>
			    </a>
			</li>
		`;
		$newsBasketball.html(html);
	})

	$.ajax({
		type:"get",
		url:"data/routes/product/getNews.php",
		data:"style=潮流"
	}).then(data=>{
		var html = "";
		for(var p of data){
			html+=`
				<li data-type=="${p.hid}">
				    <a href="news.html?hid=${p.hid}" title="${p.title}">
				        <div class="news_pic">
				            <img src="${p.sm}" alt="${p.title}">
				        </div>
				        <div class="news_intro">${p.title}</div>
				        <div class="news_tips">
				            <span class="tip_view">
				                <img src="img/icon/icon_ni_view.png" alt="">
				                ${p.view}
				            </span>
				        </div>
				    </a>
				</li>
			`
		}
		html+=`
			<li>
			    <a href="newsall.html">
			        <div class="news_pic">
			            <img src="img/news/sm/all_btn.jpg" alt="">
			        </div>
			    </a>
			</li>
		`;
		$newsFashion.html(html);
	})
})

$(()=>{
	$(".news_menu_list").on("click","ul>li",function(e){
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

$(()=>{
	var $liMenu = $(".news_menu>ul>li>a");
	var $newsNew = $(".news_menu_list>ul.newsNew");
	var $newsBasketball = $(".news_menu_list>ul.newsBasketball");
	var $newsFashion = $(".news_menu_list>ul.newsFashion");
	$liMenu.click(e=>{
			var $tar = $(e.target);
			$tar.addClass('selected');
			$tar.parent().siblings().children().removeClass('selected');
			if($tar.attr("data-type")=="最新"){
				$newsNew.addClass("is_show scroll");
				$newsNew.siblings().removeClass('is_show');
			}else if($tar.attr("data-type")=="篮球"){
				$newsBasketball.addClass('is_show scroll');
				$newsBasketball.siblings().removeClass('is_show');
			}else if($tar.attr("data-type")=="潮流"){
				$newsFashion.addClass('is_show scroll');
				$newsFashion.siblings().removeClass('is_show');
			}
		})
})

$(()=>{
	var $sellList = $(".sell_list>ul");
	var LIHEIGHT = 156,moved = 0,INTERVAL = 500,WAIT = 2000,canMove = true,timer = null;
	$.ajax({
		type:"get",
		url:"data/routes/new_shopping/getNewShopping.php"
	}).then(data=>{
		console.log(data[1]);
		console.log(data.length);
		var html = "";
		for(var v of data){
			html+=`
				<li class="clear" >
                    <a href="#">
                        <img src="${v.pic}" alt="">
                        <h6>${v.title}</h6>
                        <span class="price">${v.price}</span>
                        <span class="date">${v.publish_time}</span>
                    </a>
                </li>
			`
		}
		html+=`
			<li class="clear" >
                <a href="#">
                    <img src="${data[0].pic}" alt="">
                    <h6>${data[0].title}</h6>
                    <span class="price">${data[0].price}</span>
                    <span class="date">${data[0].publish_time}</span>
                </a>
            </li>
			<li class="clear" >
                <a href="#">
                    <img src="${data[1].pic}" alt="">
                    <h6>${data[1].title}</h6>
                    <span class="price">${data[1].price}</span>
                    <span class="date">${data[1].publish_time}</span>
                </a>
            </li>
			<li class="clear" >
                <a href="#">
                    <img src="${data[2].pic}" alt="">
                    <h6>${data[2].title}</h6>
                    <span class="price">${data[2].price}</span>
                    <span class="date">${data[2].publish_time}</span>
                </a>
            </li>
		`;
		$sellList.html(html).css("height",(data.length+3)*LIHEIGHT);


		// 发售日历轮播
		function autoMove1(){
			if(moved==data.length){
				moved=0;
				$sellList.css("top",0);
			}
			timer = setTimeout(()=>{
					move1(autoMove1);
			},WAIT);
		}
		autoMove1();
		function move1(callback){
			moved++;
			$sellList.stop(true).animate({
				top:-LIHEIGHT*moved
			},INTERVAL,callback);
		}


	})
})