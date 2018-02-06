$(()=>{
	$txtName = $("#uname");
	$txtPwd = $("#upwd");

	$txtName.blur(e=>{
		checkName($(e.target));
	})
	// 检验用户名是否存在
	function checkName(txt){
		return new Promise(callback=>{
			$.ajax({
				type:"post",
				url:"data/routes/user/checkName.php",
				data:"uname="+txt.val().trim(),
				dataType:"text"
			}).then(text=>{
				if(text=="false"){
					alert("用户名已存在");
				}else{
					callback();
				}
			})
		})
		
	}


	// 单击注册按钮触发事件直接返回首页
	var $btnReg = $("#btnReg");
	var $loginBox = $(".login_box");
	var $logoutBox = $(".logout_box");
	$btnReg.click(e=>{
		checkName($txtName).then(()=>{
			$.ajax({
				type:"post",
				url:"data/routes/user/register.php",
				data:"uname="+$txtName.val().trim()+"&upwd="+$txtPwd
				.val().trim(),
				dataType:"text"
			}).then(()=>{

				alert("注册成功");

			})
		})
	})

	var $tab_item = $(".tab_item");
	var $tab = $(".tab_lv");
	var $panel = $(".register_inner");
	$tab_item.click(e=>{

		e.preventDefault();
		var $tar = $(e.target);
		console.log($tar);
		$tar.parent().addClass('tab_current');
		$tar.parent().siblings().removeClass('tab_current');
		if($tar.is(".login")){
			$tab.addClass('left');
			$panel.children().last().removeClass('disable');
			$panel.children(":eq(1)").addClass('disable');
		}else{
			$tab.removeClass('left');
			$panel.children().last().addClass('disable');
			$panel.children(":eq(1)").removeClass('disable');
		}
	})
})

