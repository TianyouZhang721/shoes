$(()=>{
	var $title = $(".product_title");
	var $details = $(".column_left_inner");
	console.log(location.search.slice(1));
	$.ajax({
		type:"get",
		url:"data/routes/product/getDetails.php",
		data:location.search.slice(1)
	}).then(data=>{
		console.log(data);
		var fmy = data.familys;
		var html = "";
		for(var p of fmy){
			html+=`
				<h1 class="product_title" title="${p.title}">${p.title}</h1>
				<div class="product_back">
					<a href="shopping.html">&lt;&nbsp;&nbsp;返回</a>
				</div>
				<div class="product_share">
					<a href="#">
						<img src="img/icon/product_share.png" alt="">
					</a>
				</div>
				<div class="product_labels">
					<a href="#">${p.label}</a>
				</div>
				<div class="product_details">
					<div class="details_tabs">
						<div class="tab_lv">
							<span></span>
						</div>
						<div class="tab_item tab_current">
							<a href="#">商品详情</a>
						</div>
						<div class="tab_item">
							<a>成交记录(5)</a>
						</div>
					</div>
					<div class="details_content">
						<div class="details_panel">
							<div class="panel_content" style="display: block">
								<div class="picchose">
									<div class="pic_stage">
										<img src="${p.img}" alt="">

									</div>
									<ul>
										
									</ul>
								</div>
								<div class="pro_title">
									<span></span>
									商品详情
								</div>
								<p>
									<span>——&nbsp;&nbsp;购买须知&nbsp;&nbsp;——</span>
								</p>
								<p>
									<span>1.该商品将在下单后1-3天左右发货，周末不发货向后顺延；</span>
								</p>
								<p>
									<span>2.该商品每个帐号限购10件；</span>
								</p>
								<p>
									<span>3.量产的运动鞋都属于工业制品，并不能做到完全适合每个人的脚型，新鞋上脚会有可能出现磨脚等不合脚的情况，所以新鞋都会有一周到两周左右的磨合期；</span>
								</p>
								<p>
									<span>
										4.一般鞋子无特殊说明是不偏码，请按适合自己的正常尺码购买，脚型偏肥偏宽的建议买大一码；
									</span>
								</p>
							</div>
							<div class="panel_content_pic">
								<img src="${p.detail}"/>
							</div>
						</div>
					</div>
				</div>
			`
		}
		$details.html(html);
		var $ul = $(".picchose>ul");
		var imgs = data.imgs; 
		console.log(data.imgs);
		var html1 = "";
		for(var i of imgs){
			html1+=`
				<li>
					<div class="clip">
						<img src="${i.sm}" alt="">
					</div>
				</li>
			`;
		}
		$ul.html(html1);

		var $lgImg = $(".pic_stage>img");
		var $smImgs = $(".clip>img");

		$smImgs.click(e=>{
			var $tar = $(e.target);
			var src = $tar.attr("src");
			$lgImg.attr("src",src);
		})


		// 右侧
		var $content = $(".column_right_inner");
		var html = "";
		for(var p of fmy){
			html+=`
				<div class="cart_header">
					<div class="cart_price">
						<span class="s_price">￥${p.price}</span>
					</div>
				</div>
				<div class="cart_tb">
					<div class="s_size">
						<dl class="table_prop clearfix">
							<dt class="color_type">颜色</dt>
							<dd>
								<ul>`;
			var c = p.color.split(",");
			console.log(c);
			var s = p.size.split(",");
			console.log(s);
			for(var i=0;i<c.length;i++){
				html+=`<li class="color">${c[i]}</li>`;
			}
			html+=`	
								</ul>
							</dd>
						</dl>
						<dl class="table_prop clearfix">
							<dt class="size_type">尺寸</dt>
							<dd>
								<ul>`;
			for(var i=0;i<s.length;i++){
				html+=`<li class="s_size_item">
							<a>${s[i]}</a>
						</li>`;
			}
			html+=`
								</ul>
							</dd>
						</dl>
						<dl class="table_prop clearfix">
							<dd>
								<div class="s_product_image">
									<img src="${p.img}" alt="">
								</div>
							</dd>
						</dl>
						<dl class="table_prop clearfix">
							<dt class="count"></dt>
							<dd>
								<span class="tb_stock">
									<a class="reduce">-</a>
									<input type="text" value="1" class="input_count">
									<a class="add">+</a>
								</span>
							</dd>
						</dl>
						<dl class="table_prop clearfix">
							<dd class="prop_info">
								运费
								<span>￥20</span>
							</dd>
						</dl>
					</div>
				</div>
				<div class="cart_btn clear">
					<a class="btn_buy">立即购买</a>
					<a class="btn_cart">加入购物车</a>
					<img class="fly_img" src="img/shoes/md/s10.jpg" alt="">
				</div>
			`;
		}
		$content.html(html);


		// 点击加入购物车判断是否登录
		


		$content.on("click",".tb_stock>a",function(e){
			if($(this).is(".reduce")||$(this).is(".add")){
				// 获取输入框
				var input = $(this).parent().children(":eq(1)");
				console.log(input);
				//获取输入框中的值
				var n = parseInt(input.val());
				if($(this).is(".add")){
					n++;
				}else if(n>1){
					n--;
				}
				input.val(n);
			}
		})

		$content.on("click",".color,.s_size_item",function (e) {
			$(this).addClass("hover");
			$(this).siblings().removeClass("hover");
        })
		$content.on("click",".cart_btn>a",function(e){
			if($(this).parent().prev().find(".color").has(".hover")&&$(this).parent().prev().find(".s_size_item").has(".hover")){
                var $fixedLog = $(".fixed.log");
                var $fixedInfo = $(".fixed.info");
                var $color = $(this).parent().prev().children().children().first().children().last().children().children(".hover").html();
             	var $size = $(this).parent().prev().children().children(":eq(1)").children().last().children().children(".hover").children().html();
             	console.log($color,$size);
                if($(this).is(".btn_cart")){
                    $.ajax({
                        type:"get",
                        url:"data/routes/user/isLogin.php"
                    }).then(data=>{
                        if(data.ok==1){
                            if($(this).parent().prev().find(".color").is(".hover")&&$(this).parent().prev().find(".s_size_item").is(".hover")){

                                // 获取输入框
                                var input = $(this).parent().prev().find(".input_count");
                                console.log(input);
                                //获取输入框的值
                                var count = input.val();
                                console.log(count);
                                // var

                                // 获取商品id
                                var sid = location.search.split("=")[1];
                                console.log(sid);
                                $.ajax({
                                    type: "get",
                                    url: "data/routes/cart/addToCart.php",
                                    data: {sid: sid, count: count,size:$size,color:$color}
                                }).then(data => {
                                    if (data.code > 0) {
                                        $(this).next().addClass("fly");
                                        var timer = setTimeout(()=>{
                                            $(this).next().removeClass("fly");
                                            $.ajax({
												type:"get",
												url:"data/routes/cart/getCount.php"
											}).then(data=>{
												console.log(data[0].c);
												var count = (parseInt(data[0].c));
                                                $(this).parent().parent().parent().parent().parent().parent().parent().parent().prev().find("#myCart>em").html(count);
											})

                                        },1000);
                                        input.val(1);
                                    }
                                })
                            }else {
                                $fixedInfo.show();
                                $fixedInfo.children().last().removeClass("sweet_alert hideSweet").addClass("sweet_alert showSweet");
								$fixedInfo.on("click","button",function(e){
									$(this).parent().parent().hide();
                                    // $(this).parent().parent().children().last().removeClass("sweet_alert showSweet").addClass("sweet_alert hideSweet");
								})
                            }
                        }else{
                            $fixedLog.show();
                            $fixedLog.children().last().removeClass("sweet_alert hideSweet").addClass("sweet_alert showSweet");
                            $fixedLog.on("click","button",function(e){
                                if($(this).is(".cancel")){
                                    $(this).parent().parent().hide();
                                    // $(this).parent().parent().children().last().removeClass("sweet_alert showSweet").addClass("sweet_alert hideSweet");
                                }else{
                                    var url = location.href;
                                    url = encodeURIComponent(url);
                                    console.log(url);
                                    location =  "register.html?back="+url;
                                }
                            })
                        }
                    })

                }
			}

		})
	})
})
			
