<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.list-a {
	cursor: pointer;
}

.list-a:hover {
	background: #eee;
}
</style>
<!-- <div style="font-size: 20px;margin: 8px;"class="text-center"> -->
<!-- 님 -->
<!-- </div> -->
<!-- <div style="font-size: 15px" class="text-center"> -->
<!-- 	abc@abc.com -->
<!-- </div> -->
<div class="list-group">
	<div class="list-group-item text-center"
		style="background: #f99; font-size: 20px; color: white; font-weight: 600; height: 80px; padding-top: 25px;">
		My page</div>
	<a href="/mp/buyList" class="list-group-item list-a text-center">구매 목록</a>
	<a href="/mp/pointList" class="list-group-item list-a text-center" >포인트 내역</a>
</div>