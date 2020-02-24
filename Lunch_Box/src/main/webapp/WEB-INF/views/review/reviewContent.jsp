<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
 .page-item.active .page-link {
    z-index: 1;
    color: #000 ;
    background-color: #e0e0eb;
    border-color: #e0e0eb;
}
.not_title {
	cursor: pointer;
}
</style>
<script>
$(document).ready(function(){
	$(".page-link").click(function(e){
		e.preventDefault(); // 브라우저의 기본기능 막기 (a 태그 동작 막기)
		var page = $(this).attr("data-page");
		$("input[name=page]").val(page);
		$("#frmPage").submit();
	});
	$("#btnRegister").click(function() {
		console.log("클릭됨");
		$("#frmPage").attr("action", "/board/ntRegister");
		$("input[name=not_num]").remove();
		$("#frmPage").submit();
	});
	$(".not_title").click(function(e){
		e.preventDefault();
		var not_num = $(this).attr("data-bno");
		$("input[name=not_num]").val(not_num);
		$("#frmRead").attr("action", "/board/ntRead");
		$("#frmRead").submit();
	});
});
</script>
<div class="container-fluid">

	<form id="frmPage" action="/review/reviewBoard" method="get">
		<input type="hidden" name="rev_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	<form id="frmRead" action="/review/reviewBoard" method="get">
		<input type="hidden" name="rev_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<br>
		<div style="height: 20px"></div>
		<h3 class="title-w3ls text-center text-bl mb-5">리뷰 상세보기</h3>
		<form action = "/review/reviewBoard" method="get">
		<div style="height: 20px"></div>
		<table class="table text-center table-striped">
				<thead>
					<tr>
						<th>글번호</th> 
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					
				<c:forEach items="${list }" var="reviewVo">
					<tr>
						<td>${reviewVo.rev_num }</td>
						<td>${reviewVo.rev_title }</td>
						<td>${reviewVo.rev_writer }</td>
						<td><fmt:formatDate value="${reviewVo.rev_regdate }" 
								pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${reviewVo.rev_viewcnt }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</form>
			
			
				</div>
		</div>
		<div style="height: 30px">
		<div class="col-md-2">
		</div>
	</div>
	</div>
	<!-- pagination -->
	<!-- 페이지 -->
		
	<!-- // pagination -->
<%@ include file="../include/footer.jsp" %>