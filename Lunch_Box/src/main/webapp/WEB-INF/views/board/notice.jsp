<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
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
});
</script>
<div class="container-fluid">
${pagingDto }
	<form id="frmPage" action="/board/notice" method="get">
		<input type="hidden" name="not_num"/>
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
		<h3 class="title-w3ls text-center text-bl mb-5">공지사항</h3>
		<button type="button" id="btnRegister" class="btn btn-primary">글쓰기</button>
		<div style="height: 20px"></div>
		<table class="table">
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
				<c:forEach items="${list }" var="boardVo">
					<tr>
						<td>${boardVo.not_num }</td>
						<td>${boardVo.not_title } []</td>
						<td>${boardVo.not_writer }</td>
						<td>${boardVo.not_regdate}</td>
						<td>${boardVo.not_viewcount }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div style="height: 50px"></div>
		<div class="container-fluid">
			<div class="row" >
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<nav>
								<ul class="pagination">
									<c:if test="${pagingDto.hasPrev == true }">
									<li class="page-item" >
										<a class="page-link" data-page="${pagingDto.startPage - 1}">Previous</a>
									</li>
									</c:if>
									<c:forEach begin="${pagingDto.startPage }" 
											   end="${pagingDto.endPage }" 
											   var="v">
									<li 
										<c:choose>
											<c:when test="${pagingDto.page == v}">
											class="page-item active"
											</c:when>
											<c:otherwise>
											class="page-item"
											</c:otherwise>
										</c:choose>
									>
										<a class="page-link" data-page="${v}">${v}</a>
									</li>
									</c:forEach>
									<c:if test="${pagingDto.hasNext == true }">
									<li class="page-item">
										<a class="page-link" data-page="${pagingDto.endPage + 1}">Next</a>
									</li>
									</c:if>
								</ul>
							</nav>
							<div style="height: 50px"></div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
	<!-- pagination -->
	<!-- 페이지 -->
		
	<!-- // pagination -->
<%@ include file="../include/footer.jsp" %>