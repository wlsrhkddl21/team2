<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.list-a {
	cursor: pointer;
}

.list-a:hover {
	background: #eee;
}
.style1 {
	background-color : #d9d9d9;
};
.style2 {
	backgroundColor : #eee
};

</style>
<!-- <div style="font-size: 20px;margin: 8px;"class="text-center"> -->
<!-- 님 -->
<!-- </div> -->
<!-- <div style="font-size: 15px" class="text-center"> -->
<!-- 	abc@abc.com -->
<!-- </div> -->
<script>
$(document).ready(function(){
	console.log(window.location.pathname);
	var path = window.location.pathname;
	
	if (path == "/mp/buyList") {
		
		$(".list-a").eq(0).text("구매 목록 > >");
	} else if (path == "/mp/pointList") {
		$(".list-a").eq(1).text("포인트 내역 > >");
	}
	 
// 	$(".list-a").prev().click(function(e){
		
// // 		e.preventDefault();
// 		var div = $(".list-a").prev();
// 		div.removeClass("style1 style2");
// 		div.addClass("style1");
// 	})
});
</script>
<div class="list-group">
	<div class="list-group-item text-center"
		style="background: #f99; font-size: 20px; color: white; font-weight: 600; height: 80px; padding-top: 25px;">
		My page</div>
	<span><a href="/mp/buyList" class="list-group-item list-a text-center">구매 목록</a></span>
	<span><a href="/mp/pointList" class="list-group-item list-a text-center" >포인트 내역</a></span>
</div>