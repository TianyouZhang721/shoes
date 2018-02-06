

$(()=>{

	var hid = parseInt(location.search.split("=")[1]);

	
	function getLocalTime(ns){
	return new Date(parseInt(ns)*1000).toLocaleString().replace(/年|月/g,"-").replace(/日/g," ");
}
	$newsInner = $(".news_main_inner");
	$nextNew = $(".next_news");
	$related = $(".related>ul");
	$.ajax({
		type:"get",
		url:"data/routes/news/newAll.php",
		data:location.search.slice(1)
	}).then(data=>{
		var html = "";
		for(var n of data){
			html+=`
				<h3>${n.title}</h3>
				<div class="intro clearfix">
					<div class="fl">
						<span>${getLocalTime(n.publish_time)}</span>
					</div>
					<div class="fr">
						<span class="view_count">
							<img src="img/icon/icon_news_view.png" alt="">
							${n.view}
						</span>
					</div>
				</div>
				<div class="content">
					<p>${n.des}
						<img src="${n.details}" alt="">
					
					</p>
					<p>微信公众号：【get运动潮流】，扫码带您进入Sneaker、时尚潮流最前线，更有免费球鞋真假鉴定服务等您来体验！</p>
					<p class="scroll">
						<img src="img/icon/zY3fuPywDPiVShRW1366_image_wh_550x200.jpeg" alt="">
					</p>

				</div>
			`
		}
		$newsInner.html(html);
	})

	$.ajax({
		type:"get",
		url:"data/routes/news/newAll.php",
		data:"hid="+(hid+1)
	}).then(data=>{
		var html = "";
		for(var n of data){
			html+=`
				<a href="news.html?hid=${n.hid}" target="_blank">
					<div class="top clearfix">
						<div class="fl">下一篇</div>
						<div class="fr">
							<img src="img/icon/icon_go2.png" alt="">
						</div>
					</div>
					<h6>${n.title}</h6>
					<div class="bottom clearfix">
						<div class="pic">
							<img src="${n.sm}" alt="">
						</div>
					</div>
				</a>
			`
		}
		$nextNew.html(html);
	})


	$.ajax({
		type:"get",
		url:"data/routes/news/getNewsFashion.php",
	}).then(data=>{
		var html = "";
		for(var n of data){
			html+=`
				<li>
					<a href="news.html?hid=${n.hid}" target="_blank">
						<img src="${n.sm}" alt="">
						<div class="cover"></div>
						<h2>${n.title}</h2>
					</a>
				</li>
			`
		}
		$related.html(html);
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


$(()=>{
	$(window).scroll(()=>{
		var scrollTop = $(window).scrollTop();
		if(scrollTop>380){
			$("#totop").show();
		}else{
			$("#totop").hide();
		}
	})
})


// 评论区
$(()=>{
		function getLocalTime(ns){
		return new Date(parseInt(ns)*1000).toLocaleString().replace(/年|月/g,"-").replace(/日/g," ");
	}
	// 加载评论区列表
	function loadComment(){
		// 获取news_id
		var news_id = location.search.slice(5);
		console.log(news_id);
		var $submit_reply = $(".submit_reply");
		var $comment_list = $(".comment_list>ul");
		$.ajax({
			type:"get",
			url:"data/routes/comment/loadComment.php",
			data:{news_id:news_id}
		}).then(data=>{
			console.log(1);
			console.log(data);
			var uname = data.uname[0];
			var comments = data.comments;
			console.log(comments);
			console.log(uname);

			// var html = `
			// 	<span>回复@${uname}</span>
			// 	<a href="javascript:;">
			// 		<img src="img/icon/icon_delete.png" alt="">
			// 	</a>
			// `
			// $submit_reply.html(html);
			var html = "";
			for(var c of comments){
				html+=`
					<li class="comment_item" data-time="${c.timer}">
						<div class="item_avator">
							<a><img src="img/icon/defaul_avator.png" alt="">
								</a>
						</div>
						<div class="item_content">
							<div class="c_nickname">
								<span>${c.uname}</span>
								<span>${getLocalTime(c.timer)}</span>
							</div>`;
							if(c.reply!=""){
								html+=`<div class="c_quote">
								<p>引自 @${c.pname}：</p>
								<p>${c.reply}</p>
							</div>`
							}
							html+=`
							<div class="c_message">
								<p>${c.comment}</p>
							</div>
							<div class="c_action clearfix">
								<div class="fr">
									<a class="item_like`;
									if(c.liked=="1"){
										html+=` selected`;
									}
									html+=`">${c.item_like}</a>
									<a class="item_reply"></a>
								</div>
							</div>
						</div>
					</li>
				`
			}
			$comment_list.html(html);


			
		})


	}
	loadComment();

	// var $action = $(".c_action");
	// 点击like货回复
	var $comment_list = $(".comment_list>ul");
	$comment_list.on("click",".fr>a",function(e){
		var $fixedLog = $(".fixed.log");
		e.preventDefault();
		$.ajax({
			type:"get",
			url:"data/routes/user/isLogin.php"
		}).then(data=>{
			if(data.ok==1){
				// 获取background-image得最后一个/得下标
				var sIndex = parseInt($(this).css("background-image").lastIndexOf("/"));
				// 获取background-image的最后一个)的下标
				var fIndex = parseInt($(this).css("background-image").lastIndexOf(")"));
				// 获取图片的src值
				var backImg = $(this).css("background-image").slice(sIndex+1,fIndex-1);
				if($(this).is(".item_like")&&backImg=="like_default.png"){
					//切换item_like
					$(this).addClass('selected');
					// 获取item_like的值
					var i = parseInt($(this).html());
					// 获取点击得评论得下标
					var index = parseInt($(this).parent().parent().parent().parent().index())+1;
					console.log(i,index);
					var news_id = location.search.slice(5);
					console.log(news_id);
					var t = $(this).parent().parent().parent().parent().data("time");
					console.log(t);
					$.ajax({
						type:"post",
						url:"data/routes/comment/addLike.php",
						data:{item_like:i,timer:t,news_id:news_id}
					}).then(data=>{
						console.log(data);
						$(".load").addClass("go");
						var timer = setTimeout(()=>{
							$(".load").removeClass("go");
						},900);
						$(this).html(i+1);
					})
				}else if($(this).is(".item_reply")){
	                $('html, body').animate({  
	                    scrollTop: $(".scroll").offset().top 
	                }, 2000);  
					var shake = 0;
					var $textarea = $(".comment_area")
					// 显示为谁回复
					$(".submit_reply").removeClass('s_hide');
					// textarea获取焦点
					$textarea.focus();
					// textarea边框闪烁
					var timer = setInterval(()=>{
						if(shake<10){
							if(shake%2==0){
								console.log(1);
								$textarea.parent().addClass('shake');
							}else{
								$textarea.parent().removeClass('shake');
							}
							shake++;
						console.log(shake);

						}else{
							clearInterval(timer);
							timer=null;
						}
						
					},300)
					// 获取为谁回复的名字
					var name = $(this).parent().parent().parent().children().first().children("span").html();
					console.log(name);
					$textarea.attr("placeholder","@"+name+":");
					$(".submit_reply").on("click","a>img",function(e){
						$(this).parent().parent().addClass('s_hide');
						$textarea.blur();
						$textarea.attr("placeholder","添加评论");
					})

				}
			}else{
				// 未登录提示
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
		
	})

	var $comment_area = $(".submit_form>.editor_textarea");
	$.ajax({
		type:"get",
		url:"data/routes/user/isLogin.php"
	}).then(data=>{
		console.log(data);
		if(data.ok==0){
			$comment_area.children(':eq(1)').show();   //显示登陆
			$comment_area.children(':eq(0)').hide();   //隐藏评论
		}else{
			$comment_area.children(':eq(1)').hide();   //隐藏登录 
			$comment_area.children(':eq(0)').show();   //显示评论

			// 发表评论
			var $submit_btn = $(".submit_btn");
			var $fixedCom = $(".fixed.comment");
			var $fixedSuc = $(".fixed.success");
			$submit_btn.click(e=>{
				e.preventDefault();
				var $tar = $(e.target);
				console.log($tar);
				if($comment_area.children(':eq(0)').attr("placeholder")=="添加评论"){
					var textarea_value = $comment_area.children(':eq(0)').val();
					var news_id = location.search.slice(5);
					console.log(textarea_value);
					if(textarea_value==""){
						$fixedCom.show();
						$fixedCom.children().last().removeClass("sweet_alert hideSweet").addClass("sweet_alert showSweet");
						$fixedCom.on("click","button",function(e){
							$(this).parent().parent().hide();
						})
					}else{
						$.ajax({
							type:"post",
							url:"data/routes/comment/addComment.php",
							data:{comment:textarea_value,news_id:news_id}
						}).then(data=>{
							console.log(data);
							$(".comment_area").val("");
							$fixedSuc.show();
							$fixedSuc.children().last().removeClass('sweet_alert hideSweet').addClass("sweet_alert showSweet");
							var timer = setTimeout(()=>{
								$fixedSuc.hide();
							},1000)
							loadComment();
						})
					}
					
					
				}else{
					var textarea_value = $comment_area.children(':eq(0)').val();
					console.log(textarea_value);
					var news_id = location.search.slice(5);
					console.log(news_id);
					if(textarea_value==""){
						$fixedCom.show();
						$fixedCom.children().last().removeClass("sweet_alert hideSweet").addClass("sweet_alert showSweet");
						$fixedCom.on("click","button",function(e){
							$(this).parent().parent().hide();
						})
					}else{
						// console.log($(this))
						// var t = $tar.parent().parent().next().children().last().data("time");
						$.ajax({
							type:"post",
							url:"data/routes/comment/addComment.php",
							data:{reply:textarea_value,news_id:news_id}
						}).then(data=>{
							console.log(data);
							$(".comment_area").val("");
							$fixedSuc.show();
							$fixedSuc.children().last().removeClass('sweet_alert hideSweet').addClass("sweet_alert showSweet");
							var timer = setTimeout(()=>{
								$fixedSuc.hide();
							},1000)
							loadComment();
						})
					}
					
				}
				
			});
		}
	})
	// 点击登陆或注册跳转到register.html
	var $login = $(".log_action");
	$login.on("click","a",function(e){
		e.preventDefault();
		var url = location.href;
		url = encodeURIComponent(url);
		console.log(url);
		location =  "register.html?back="+url;
	})


	// 点击回复 或 关注
	


	
})

