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
.pdtContent {
	cursor: pointer;
}
.readTitle {
	cursor: pointer;
}
th {
	background-color:#f7f7f7;
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
// 	$("#btnRegister").click(function() {
// 		console.log("클릭됨");
// 		$("#frmPage").attr("action", "/review/ntRegister");
// // 		$("input[name=not_num]").remove();
// 		$("#frmPage").submit();
// 		location.href = "/review/reviewRegister";
// 	});
// 	$(".readTitle").click(function(e){
// 		e.preventDefault();
// 		console.log("타이틀 클릭됨");
// 		var rev_num = $(this).attr("data-rno");
// 		$("input[name=rev_num]").val(rev_num);
// 		$("#frmRead").attr("action", "/review/reviewContent");
// 		$("#frmRead").submit();
// 	});
	$("#btnRegister").click(function(){
		location.href = "/review/reviewRegister";
	});
	$(".readTitle").click(function(e){
		e.preventDefault();
		console.log("제목클릭됨");
		var rev_num = $(this).attr("data-rno");
		$("input[name=rev_num]").val(rev_num);
		$("#frmRead").attr("action", "/review/reviewContent");
		$("#frmRead").submit();
	});
	
	function image() {
		$(".revImage").each(
				function() {
					var fileName = $(this).attr("data-img");
//						console.log("fileName:" + fileName);
					var slice = fileName.lastIndexOf("/")
					var path = fileName.substring(0, slice + 1);
					var real = fileName.substring(slice + 1);
					var thumbnail = path + "s_" + real;
//						console.log(thumbnail);
					$(this).attr(
							"src",
							"/review/displayFile?fileName="
									+ thumbnail);
				});
	}
	image();
// 	$("#pdtContent").click(function(){
// 		console.log("클릭됨");
// 		location.href = "/shop/detail";
// 	});
});
</script>
<div class="container-fluid">

<!-- 	<form id="frmPage" action="/review/reviewBoard" method="get"> -->
<!-- 		<input type="hidden" name="rev_num"/> -->
<!-- 		<input type="hidden" name="rev_pdt_name"/> -->
<!-- 		<input type="hidden" name="page"  -->
<%-- 			value="${pagingDto.page }"/> --%>
<!-- 		<input type="hidden" name="perPage" -->
<%-- 			value="${pagingDto.perPage }"/> --%>
<!-- 	</form> -->
	<form id="frmRead" action="/review/reviewContent" method="get">
		<input type="hidden" name="rev_num"/> 
		<input type="hidden" name="rev_pdt_name"/>
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
		<h3 class="title-w3ls text-center text-bl mb-5">리뷰 게시판</h3>
<%-- 		<c:if test="${mem_id}"> --%>
		<button type="button" id="btnRegister" class="btn text-wh" style="background: #fd5c63;">글쓰기</button>
<%-- 		</c:if> --%>
		<form action = "/review/reviewBoard" method="post">
		<div style="height: 20px"></div>
		<table class="table text-center">
				<thead>
					<tr >
						<th>글번호</th> 
						<th>이미지</th> 
						<th>상품명</th> 
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
				<c:forEach items="${list }" var="reviewVo">
					<tr style="font-weight:bold;">
						<td>${reviewVo.rev_num }</td>
						<c:if test="${not empty reviewVo.rev_image}">
							<td><img class="revImage" alt="도시락" data-img="${reviewVo.rev_image}"></td>
						</c:if>
						<td>
							<c:forEach items="${productList}" var="ProductVo">
								<c:if test="${reviewVo.rev_pdt_name == ProductVo.pdt_num}">
									${ProductVo.pdt_name}
								</c:if>
							</c:forEach>
						</td>
						<td><a data-rno="${reviewVo.rev_num}" class="readTitle" href="#">${reviewVo.rev_title }</a></td>
						<td>${reviewVo.rev_writer }</td>
						<td><fmt:formatDate value="${reviewVo.rev_regdate }" 
								pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</form>
			<div style="height: 50px">
				<nav class="navbar">
					<ul class="pagination mx-auto">
						<c:if test="${pagingDto.hasPrev == true }">
							<li class="page-item"><a class="page-link"
								data-page="${pagingDto.startPage - 1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${pagingDto.startPage }"
							end="${pagingDto.endPage }" var="v">
							<li
								<c:choose>
									<c:when test="${pagingDto.page == v}">
									class="page-item active"
									</c:when>
									<c:otherwise>
									class="page-item"
									</c:otherwise>
								</c:choose>>
								<a class="page-link" data-page="${v}">${v}</a>
							</li>
						</c:forEach>
						<c:if test="${pagingDto.hasNext == true }">
							<li class="page-item"><a class="page-link"
								data-page="${pagingDto.endPage + 1}">Next</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			
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