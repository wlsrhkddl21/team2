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
		고객센터</div>
	<div class="list-group-item list-a text-center" OnClick="location.href='/board/notice'">공지사항</div>
	<div class="list-group-item list-a text-center" OnClick="location.href='/board/qna'">문의게시판</div>
	<div class="list-group-item list-a text-center">자주하는질문</div>
</div>