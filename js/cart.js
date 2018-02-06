$(()=>{
	function loadCart(){

		$.ajax({
			type:"get",
			url:"data/routes/cart/getCart.php"
		}).then(data=>{
			var shoe = data.data;
			var count = data.count[0].c;
			var colors = data.colors;
			var html = `<tr>
							<th style="border-bottom:none"></th>
							<th style="text-align:center">
								<label>
									<input type="checkbox" class="i_chk" `;
							if(parseInt(count)==shoe.length){
								html+=`checked`;
							}
							html+=`
									>全选
								</label>
								商品
							</th>
							<th>单价(元)</th>
							<th>数量</th>
							<th>小计(元)</th>
							<th>操作</th>
						</tr>`;
			for(var i=0;i<shoe.length;i++){
				html+=`
				<tr class="s_item">
					<td class="checked">
						<input type="checkbox" class="i_chk" data-iid="${shoe[i].iid}" name="checkItem" `;
					if(`${shoe[i].is_checked}`==1){html+=`checked`;}
					html+=`	>
					</td>
					<td>
						<div class="order_s">
							<a href="#">
								<img src="${shoe[i].sm}" alt="">
							</a>
							<a href="#" style="padding-top: 5px;">${shoe[i].title}</a>

						<span>尺码：${colors[i].size}&nbsp;&nbsp;&nbsp;</span>
							<span>颜色：${colors[i].color}</span>
						</div>
					</td>
					<td style="text-align: center;">
						<span>￥${shoe[i].price}</span>
					</td>
					<td style="text-align: center;">
						<span class="td_stock">
							<a class="reduce">-</a>
							<input type="text" class="tb_text" readonly="true" value="${shoe[i].count}" data-iid="${shoe[i].iid}">
							<a class="add">+</a>
						</span>
					</td>
					<td style="text-align: center;">
						<span class="s_item_cost">¥${shoe[i].price*shoe[i].count}</span>
					</td>
					<td style="text-align: center;">
						<a class="s_item_del">删除</a>
					</td>
				</tr>
				`
			}
			var $tbody = $("#tbody1");
			$tbody.html(html);
			setTimeout(()=>{
				getTotal();
				// chkAll()
			},100);


			
			// 为单个按钮绑定单击事件
			
			
		})
	}
			var $tbody = $("#tbody1");
	
	$tbody.on("click","td>input.i_chk",function(e){
		if($(this).is(":checked")){
			$.ajax({
				type:"post",
				url:"data/routes/cart/selectOne.php",
				data:"chkOne=1&iid="+$(this).data("iid"),
				dataType:"text"
			}).then(()=>{
				loadCart();
			})
			// $(this).attr("checked",true);
		}else{
			// $(this).attr("checked",false);
			$.ajax({
				type:"post",
				url:"data/routes/cart/selectOne.php",
				data:"chkOne=0&iid="+$(this).data("iid"),
				dataType:"text"
			}).then(()=>{
				loadCart();
			})
		}
	})

	// 为全选按钮绑定单击事件
	var $checkOne = $("td>input.i_chk");

	$tbody.on("click","label>input.i_chk",function(e){
		if($(this).is(":checked")){
			// $("[name=checkItem]:checkbox").attr("checked",true);

			$.post(
				"data/routes/cart/selectAll.php",
				"chkAll=1"
			).then(()=>{
				loadCart();
			})
		}else{
			// $("[name=checkItem]:checkbox").attr("checked",false);

			$.post(
				"data/routes/cart/selectAll.php",
				"chkAll=0"
			).then(()=>{
				loadCart();
			})
		}
	})

	


	// 为+-号绑定单击事件
	$tbody.on("click",".td_stock>a",function(e){
		e.preventDefault();
		var input = $(this).siblings('input');
		var n = parseInt(input.val());
		if($(this).is(".add")){
			n++;
				$.ajax({
					type:"post",
					url:"data/routes/cart/updateCart.php",
					data:"count="+n+"&iid="+input.data("iid"),
					dataType:"text"
				}).then(()=>{
					loadCart();
				})
							
		}else{
			n--;
			if(n==0){
				if(confirm("是否继续删除该商品")){
					$.ajax({
						type:"post",
						url:"data/routes/cart/updateCart.php",
						data:"count="+n+"&iid="+input.data("iid"),
						dataType:"text"
					}).then(()=>{
						loadCart();
					})
				}
			}else{
					$.ajax({
						type:"post",
						url:"data/routes/cart/updateCart.php",
						data:"count="+n+"&iid="+input.data("iid"),
						dataType:"text"
					}).then(()=>{
						loadCart();
					})
			}
		}
		
		
	})


	// 总价和数量
	var $counts = $(".cart_sum .fr span>em#s-select-quantity");
	var $totals = $(".cart_sum .fr em.s_total_cost");
	function getTotal(){
		var $rows = $(".s_item .i_chk:checked");
		var inputs = $rows.parent().parent().find(".td_stock>input");
		var subs = $rows.parent().parent().find(".s_item_cost");
		var count = 0;
		var total = 0;
		for(var i=0;i<inputs.length;i++){
			console.log(inputs[i].value);
			count+=parseInt(inputs[i].value)
		}
		for(var j=0;j<subs.length;j++){
			total+=parseFloat(subs[j].innerHTML.slice(1))
		}

		$counts.html(count);
		$totals.html("¥"+total);
		
	}

	$.ajax({
		type:"get",
		url:"data/routes/user/isLogin.php"
	}).then(data=>{
		if(data.ok==0)
			location=
				"register.html?back="+
				encodeURIComponent(location.href);
		else
			loadCart();
	})
})