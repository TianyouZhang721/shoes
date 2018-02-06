$(()=>{
	$(".btn_search").click(()=>{
		//获得id为txtSearch的内容,去掉开头和结尾的空格保存在变量kw中
		var kw=$("#search_input").val().trim();
		if(kw!=="")//如果kw不为""
			//用location跳转到products.html?kw=kw
			location="productAll.html?kw="+kw;
		else
			location = "productAll.html"
	});

	//搜索帮助
	var $txtSearch = $("#search_input");
	var $shelper = $("#shelper");
	$txtSearch.keyup(e=>{
		if(e.keyCode!==13){
			var $tar = $(e.target);
			$.ajax({
				type:"get",
				url:"data/routes/product/searchHelper.php",
				data:"term="+$tar.val()
			}).then(data=>{
				var html = "";
				for(var p of data){
					html+=`<li title="${p.title}">
						<div class="search-item" title="${p.title}" data-url="product_details?lid=${p.sid}">${p.title}</div>
					</li>`;
				}
				$shelper.show().html(html);
			})
		}else{
			$(".btn_search").click();
		}
	}).blur(()=>$shelper.hide());
})