$(()=>{
	var $racesList = $(".races_list");
	console.log(1);
	$.ajax({
		type:"get",
		url:"data/routes/new_shopping/getNewShopping.php"
	}).then(data=>{
		console.log(data);
		var html = "";
		for(var n of data){
			html+=`
				<li class="s_rase clearfix">
					<img src="${n.pic}" alt="">
					<div class="s_info">
						<h2>
							<span>${n.title}</span>
						</h2>
						<p>颜色：${n.color}</p>
						<p>货号: ${n.keyNum}</p>
						<p>发售日期: ${n.publish_time}</p>
						<p>发售价格: ${n.price}</p>
					</div>
				</li>
			`
		}
		$racesList.html(html);
		
	



	
		function isRun(year){
			return (year%4===0&&year%100!==0) || year%400===0;
		}
		var $calendarTitle = $(".calendar_title");
// 颜色
		

		//获取当前日期
		var date = new Date().toLocaleDateString();
		//年
		var y = parseInt(date.split("/")[0]);
		//月
		var m = parseInt(date.split("/")[1]);
		//日
		var d = parseInt(date.split("/")[2]);
		var clickCi = 0;
		

		// 日历
		function calendar(y,m,d){
			
			// var html1 = `
			// 	<a href="#" class="arrow prev">
			// 		<span>上一页</span>
			// 	</a>
			// 	<a href="#" class="arrow next">
			// 		<span>下一页</span>
			// 	</a>
			// 	<div class="monthWrap currentMonth">
			// 		<div class="calendar_title">
			// `;
			var html = "";
			var calendarTitle = $(".calendar_title");
			html+=`<a href="#" class="monthTitle">${m}月${y}</a>
			`;

			$calendarTitle.html(html);

			var titleYear = parseInt($calendarTitle.children().html().split("月")[1]);
			var titleMonth = parseInt($calendarTitle.children().html().split("月")[0]);
			// var titleYear = parseInt($calendarTitle.children().html().split("月")[1]);
			// var titleMonth = parseInt($calendarTitle.children().html().split("月")[0]);

			var totalDay;
			//每月的天数
			if(m==1||m==3||m==5||m==7||m==8||m==10||m==12){
				totalDay = 31;
			}else if(m==4||m==6||m==9||m==11){
				totalDay = 30;
			}else if(m==2){
				totalDay = isRun(y) ? 29 : 28;
			}
			// var $dayList1 = $(".calendar_inner");
			var $dayList1 = $(".column_left .calendar_dayLists");
			var html1 = "";
			for(var i=1;i<=totalDay;i++){
				html1+=`
					<li id="dayList${i}" rel="${i}" class="eventsDay">
						<a href="${y}-${m}-${d}">${i}</a>
					</li>
				`;
			}
			// html1+=`</ul></div>`;

			$dayList1.html(html1);


			// function getColor(titleMonth,titleYear,y,m,d){
				var y = parseInt(date.split("/")[0]);
				console.log(y);
				//月
				var m = parseInt(date.split("/")[1]);
				//日
				var d = parseInt(date.split("/")[2]);
				// 获取日历标题
				var $dayList1 = $(".column_left .calendar_dayLists");
				// var $dayList1 = $(".calendar_inner");
				
				console.log(titleMonth);
				if(y==titleYear&&m==titleMonth){
					// $dayList1.children(":eq(2)").children(":eq(1)").children(':eq('+d+')').children().addClass('today');
					$dayList1.children(':eq('+d+')').children().addClass('today');
				}
				var monthArr = [];
				var yearArr = [];
				for(var v of data){

					//获取数据库中发售日期的月份
					var sqlMonth = parseInt(v.publish_time.split("-")[1]);
					monthArr[monthArr.length] = sqlMonth;
					
					//获取数据库中发售日期的年份
					var sqlYear = parseInt(v.publish_time.split("-")[0]);
					yearArr[yearArr.length] = sqlYear;
				}


				//遍历年份数组
				for(var i=0;i<yearArr.length;i++){
					// 如果数据库中商品年份与数组中年份相等
					if(yearArr[i]==titleYear){
						for(var j=0;j<monthArr.length;j++){
							// 如果数据库中商品年份与数组中年份相等，则加class
							if(monthArr[j]==titleMonth){
								var arr = [];
								for(var d of data){
									arr[arr.length] = parseInt(d.publish_time.split("-")[2]);
								}
								$dayList1.children(':eq('+(arr[i]-1)+')').children().addClass('dayWithCurrent');
								// $dayList1.children(":eq(2)").children(":eq(1)").children(':eq('+(arr[i]-1)+')').children().addClass('dayWithCurrent');
							}
						}
					}
					
				}	

				if(clickCi==0){
					var monthWrap = document.querySelector(".calendar_inner .monthWrap");
					var cMonthWrap = monthWrap.cloneNode(true);
					cMonthWrap.className = "monthWrap currentMonth1";
					document.querySelector(".calendar_inner").appendChild(cMonthWrap);

				}	
					
			// }

		}

		//有发售日期变色

		

		calendar(y,m,d);

		// var $dayList1 = $(".column_left .calendar_dayLists");
		// var $dayList1 = $(".calendar_inner");
		
		// var titleMonth = parseInt($calendarsTitle.children().html().split("月")[0]);
		

		// getColor(titleMonth,titleYear,y,m,d);


		

		function nextMonth(e){
			e.preventDefault();
			var $tar = $(e.target);
			console.log($tar);
			var titleYear = parseInt($calendarTitle.children().html().split("月")[1]);
			var titleMonth = parseInt($calendarTitle.children().html().split("月")[0]);
			// var $monthWrap = $(".monthWrap");

			// console.log(calendar_inner);

			if($tar.parent().is(".next")){
				m+=1;
				clickCi++;
				titleMonth+=1;
				if(m>12){
					m=1;
					titleMonth = 1;
					y+=1;
					titleYear+=1;
				}
				// var monthWrap = document.querySelector(".calendar_inner .monthWrap");
				// var cMonthWrap = monthWrap.cloneNode(true);
				// document.querySelector(".calendar_inner").insertBefore(cMonthWrap,monthWrap);
				
				// var $inner = $(".monthWrap");
				// $inner.addClass('yidong');
				// var a = document.querySelector(".calendar_inner");
				// var b = a.cloneNode(true);
				// console.log(b);
				// document.querySelector(".calendar").appendChild(b);
				// b.className = "calendar_inner yidong";
				
				if(clickCi>0){
					var $yidongleft =$(".monthWrap.currentMonth1");
					$yidongleft.addClass('yidongleft');
					clickCi=0;
					setTimeout(function(){$yidongleft.remove();
					},500)
					// a.className = "monthWrap currentMonth1 yidong";
					// console.log(a);
					calendar(y,m,d);

				}
				
				// calendarInner.removeChild(cMonthWrap);
				console.log(y,m,d,titleYear,titleMonth);
				


				// getColor(titleMonth,titleYear,y,m,d);
				
			}else if($tar.parent().is(".prev")){
				clickCi++;
				m-=1;
				titleMonth-=1;
				if(m<1){
					m=12;
					titleMonth=12;
					y-=1;
					titleYear-=1;
				}

				if(clickCi>0){
					var $yidongright =$(".monthWrap.currentMonth1");
					$yidongright.addClass('yidongright');
					clickCi=0;
					setTimeout(function(){$yidongright.remove();
					},5000)
					// a.className = "monthWrap currentMonth1 yidong";
					// console.log(a);
					calendar(y,m,d);

				}
				calendar(y,m,d);

				// getColor(titleMonth,titleYear,y,m,d);

			}
		}

	// 上一月或下一月
		$(".column_left .calendar_inner").on("click","a",function(e){
			nextMonth(e);
		})
		// $(".column_right .calendar_inner").on("click","a",function(e){
		// 	nextMonth(e);
		// })


		


	
		

		

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
                    <a href="news.html?hid=${n.hid}" target="_blank">
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