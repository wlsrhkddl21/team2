<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <link rel="stylesheet" type="text/css" href="http://www.homeal.net/_data/wing_homeal_temp.css"> -->
<link rel="stylesheet" href="/css/homeal.css">
<script type="text/javascript" src="http://www.homeal.net/wm_engine_SW/_engine/common/truelife.js?v=11"></script>
<script type="text/javascript" src="http://www.homeal.net/wm_engine_SW/_engine/common/auto_scroll.js"></script>
<script src="http://www.homeal.net/_skin/homeal/img/../jquery.cycle.all.js"></script>
<style>
 .csCenter_info { 
 	padding: 35px; 
 	border: 5px solid #ededed;
 	margin-top: 20px;
}
a {
  color: #000000;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects;
  cursor : pointer;
} 
</style>
<script>
$(document).ready(function(){
	$(".not_title").click(function(e){
		e.preventDefault();
		var not_num = $(this).attr("data-bno");
		$("input[name=not_num]").val(not_num);
		$("#frmRead").attr("action", "/board/ntRead");
		$("#frmRead").submit();
	});
	
	
	$(".faq_subject").each(function(){
		$(this).click(function(){
			$(this).next().toggle();	
		});
	});
	
	$(".rev_name").click(function(e) {
		e.preventDefault();
		// 		console.log("클릭됨");
		var rev_num = $(this).attr("data-num");
		// 		location.href = "/admin/content";
		location.href = "/review/reviewContent?rev_num=" + rev_num;
	});

		function thumbnail() {
			$(".pdtImg").each(
					function() {
						var fileName = $(this).attr("data-img");
//							console.log("fileName:" + fileName);
						var slice = fileName.lastIndexOf("/")
						var path = fileName.substring(0, slice + 1);
						var real = fileName.substring(slice + 1);
						var thumbnail = path + "s_" + real;
							console.log(thumbnail);
						$(this).attr(
								"src",
								"/review/displayFile?fileName="
										+ thumbnail);
					});
		}
		thumbnail();
});
</script>
<div class="container-fluid">
	<form id="frmRead" action="/board/notice" method="get">
		<input type="hidden" name="not_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div style="height: 20px;"></div>
			<h3 class="title-w3ls text-center text-bl mb-5">고객센터</h3>
			<div class="customer_info">
				<h3>런치박스 고객센터</h3>
				<strong>080-123-1234</strong>
				<span>평일 09시 ~ 17시, 점심 12시 ~ 13시(토/일  공휴일 휴무)</span>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div style="height: 20px;"></div>
					<%@ include file="../include/csMenu.jsp"%>
				</div>
				<div class="col-md-10">
					<div class="row">
							<div class="csCenter_info text-center">
							<div id="customer">
    <div class="board_group box_left"> <!-- 작업 완료 후 'box_left' 클래스명 추가 -->
        <div class="title">
            <h4>공지사항</h4>
            <a href="/board/notice" class="more">더보기+</a>
        </div>
        
<table class="tbl_board">
	<caption class="hidden">공지사항</caption>
	<colgroup>
		<col>
		<col style="width:22%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">제목</th>
			<th scope="col">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${hotList }" var="boardVo">
			<tr>
				<td><a data-bno="${boardVo.not_num}" class="not_title"> ${boardVo.not_title } </a></td>
				<td class=date><fmt:formatDate value="${boardVo.not_regdate }" 
						pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		
		<c:forEach items="${listPage }" var="boardVo">
			<c:if test="${boardVo.not_hot == 0 }">
			<tr>
				<td><a data-bno="${boardVo.not_num}" class="not_title"> ${boardVo.not_title } </a></td>
				<td class=date><fmt:formatDate value="${boardVo.not_regdate }" 
						pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
    </div>
    <div class="board_group box_right">
        <div class="title">
            <h4>고객후기</h4>
            <a href="/review/reviewBoard" class="more">더보기+</a>
        </div>
        <!-- 개발 영역 (작업 완료 후 상단 div 클래스명 추가 필수) -->
        <table class="tbl_board prd div">
            <caption class="hidden">상품후기</caption>
            <colgroup>
                <col style="width:90px;">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">상품</th>
                <th scope="col">제목</th>
            </tr>
            </thead>
            <tbody>
            		<c:forEach items="${reviewList}" var="reviewVo">
							<tr>
								<c:if test="${not empty reviewVo.rev_image}">
									<td class="img" style="padding-top: 3px;">
										<img alt="상품이미지" class="pdtImg" style="height:50px;"
										data-img="${reviewVo.rev_image}"></td>
								</c:if>
								<td class="left"><a class="rev_name" href="#"
									data-num="${reviewVo.rev_num}">${reviewVo.rev_title}</a></td>
							</tr>
					</c:forEach>
				</tbody>
        </table>
        <!-- //개발 영역 (작업 완료 후 상단 div 클래스명 추가 필수) -->
    </div>
    <div class="clear"></div>
    <div class="board_group">
        <div class="title">
            <h4>자주하는 질문</h4>
            <a href="/board/faq" class="more">더보기+</a>
        </div>
        
<table class="tbl_board_faq">
	<caption class="hidden">자주하는 질문</caption>
	<colgroup>
		<col style="width:60px;">
		<col style="width:135px;">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">분류</th>
			<th scope="col">제목</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list }" var="faqVo">
			<tr class="faq_subject">
				<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
				<td class="left" style="text-align:center;">BEST</td>
				<td class="left subject"><a data-bno="${faqVo.faq_num}" class="faq_title"> ${faqVo.faq_title } </a></td>
			</tr>
			<tr class="faq_content" id="faq97" style="display:none;">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				${faqVo.faq_content }
			</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
    </div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
				<div class="col-md-2" style="height: 200px;"></div>
			</div>
		</div>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp"%>