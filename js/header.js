$(()=>{
	function loadStatus(){
		var $loginBox = $(".login_box");
		var $logoutBox = $(".logout_box");
		$.ajax({
			type:"get",
			url:"data/routes/user/isLogin.php"
		}).then(data=>{
			if(data.ok==1){
				$loginBox.show();
				$logoutBox.hide();
				$.ajax({
					type:"get",
					url:"data/routes/cart/getCount.php"
				}).then(data=>{
                    var count = $("#myCart>em");
                    count.html(data[0].c)
                })
			}else{
				$loginBox.hide();
				$logoutBox.show();
			}
		})

		$loginBox.on("click","a.logout",function(e){
			e.preventDefault();
			console.log(1);
			$.ajax({
				type:"get",
				url:"data/routes/user/logout.php"
			}).then(()=>{
				location = "index.html";
			})
		})

		var i = location.href.lastIndexOf("/");
		var j = location.href.indexOf(".html");
		var href = location.href.slice(i+1,j);
		var $headerUl = $(".nav>div>ul");
        if(href=="index"){
			$headerUl.children(":eq(0)").children().addClass("selected");
            $headerUl.children(":eq(0)").siblings().children().removeClass("selected");
		}else if(href=="news"||href=="newsall"){
			$headerUl.children(":eq(1)").children().addClass("selected");
            $headerUl.children(":eq(1)").siblings().children().removeClass("selected");
        }else if(href=="shopping"||href=="product"){
			console.log(111);
            console.log(href);
            console.log($headerUl.children(":eq(2)").children());
            console.log($headerUl.children(":eq(2)"));
            $headerUl.children(":eq(2)").children().addClass("selected");
            $headerUl.children(":eq(2)").siblings().children().removeClass("selected");
		}else if(href=="shoes"){
            $headerUl.children(":eq(3)").children().addClass("selected");
            $headerUl.children(":eq(3)").siblings().children().removeClass("selected");
		}

	}


	$("#header").load("header.html",()=>{
		loadStatus();
	});


	$(window).scroll(()=>{
		var scrollTop = $(window).scrollTop();
		if(scrollTop>380){
			$("#header").addClass("header_fix");
		}else{
			$("#header").removeClass('header_fix');
		}
	})

	
})
