$(()=>{
	var $header = $(".header");
	var $brand = $(".brand");
	var $star = $(".star");
	$header.on("click","ul>li",function(e){
		console.log($(this));
		if($(this).is(":first-child")){
			$(this).children().addClass('current');
			$(this).siblings().children().removeClass('current');
			$brand.show();
			$star.hide();
		}else{
			$(this).children().addClass('current');
			$(this).siblings().children().removeClass('current');
			$brand.hide();
			$star.show();
		}
	})
})

$(()=>{
	var $shoesList = $(".shoes_filter_list>ul");
	$.ajax({
		type:"get",
		url:"data/routes/shoes/getShoesAll.php"
	}).then(data=>{
		console.log(data);
		var html = "";
		var shoe = data.data;
		for(var s of shoe){
			html+=`
				<li class="shoe_item">
				    <div class="item_box">
				        <a href="shoes_details.html?sid=${s.sid}">
				            <img src="${s.img}" alt="">
				        </a>
				        <a href="#">
				            <h2>${s.title}</h2>
				        </a>
				        <p class="shoe_price">
				            <i>¥</i>
				            ${s.price}
				        </p>
				        <div class="more_info">
				            <p class="time">${s.publish_time}</p>
				            <p class="desc">${s.subtitle}</p>
				            <p class="social">
				                <span class="first">点击量：${s.view}</span>
				            </p>
				        </div>
				    </div>
				</li>
			`
		}
		$shoesList.html(html);

		$shoesList.on("mouseenter","li.shoe_item",function(e){
			console.log($(this));
			$(this).children().addClass('hover');
			$(this).children().children().last().addClass('hover');
		})
		$shoesList.on("mouseleave","li.shoe_item",function(e){
			console.log($(this));
			$(this).children().removeClass('hover');
			$(this).children().children().last().removeClass('hover');

		})
	})
})