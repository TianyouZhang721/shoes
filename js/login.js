$(()=>{
	var $txtYzm = $("#setYzm");
	$txtYzm.click(e=>{
		var $tar = $(e.target);
		$tar.attr("src","data/03_code_gg.php");
	});
	
})

$(()=>{
	var $btnLog = $("#btnLog");
	$btnLog.click(e=>{
		var $txtName = $("#log_form #uname").val();
		var $txtPwd = $("#log_form #upwd").val();
		var $txtYzm = $("#log_form #yzm").val();


		var unameReg = /^[a-z0-9]{3,12}$/i;
		var upwdReg = /^[a-z0-9]{3,12}$/i;
		//创建验证码的正则表达式
		var yzmReg = /^[a-z]{4}$/i;

		if(!unameReg.test($txtName)){
		    alert("用户名格式不正确,请检查后再试");
		    return;
		}
		if(!upwdReg.test($txtPwd)){
		    alert("密码格式不正确,请检查后再试");
		    return;
		}
		 //验证用户输入的验证码是否正确
		if(!yzmReg.test($txtYzm)){
		    alert("验证码格式不正确,请检查后再试");
		    return;
		}

		$.ajax({
			type:"post",
			url:"data/routes/user/login.php",
			data:"uname="+$txtName.trim()+"&upwd="+$txtPwd.trim()+"&yzm="+$txtYzm.trim(),
			error:function(){
				alert("网络发生故障，请检查！");
			}
		}).then(data=>{
			if(data.code>0){
				if(location.search!==""){
					location=decodeURIComponent(
						location.search.slice(6)
					);
				}else
					location="index.html";
			}else{
				alert(data.msg);
			}
		})
	})
})