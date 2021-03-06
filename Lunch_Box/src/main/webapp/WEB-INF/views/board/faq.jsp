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
.faq_title {
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
	$("#btnRegister").click(function() {
		console.log("클릭됨");
		$("#frmPage").attr("action", "/board/faqRegister");
		$("input[name=not_num]").remove();
		$("#frmPage").submit();
	});
	$(".faq_title").click(function(e){
		e.preventDefault();
		var faq_num = $(this).attr("data-bno");
		$("input[name=faq_num]").val(faq_num);
		$("#frmRead").attr("action", "/board/faqRead");
		$("#frmRead").submit();
	});
});
</script>
<div class="container-fluid">
	<form id="frmPage" action="/board/faq" method="get">
		<input type="hidden" name="faq_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	<form id="frmRead" action="/board/faq" method="get">
		<input type="hidden" name="faq_num"/>
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
		<h3 class="title-w3ls text-center text-bl mb-5">자주하는질문</h3>
		<c:if test="${mem_id == 'admin'}">
		<button type="button" id="btnRegister" class="btn text-wh" style="background: #fd5c63;">글쓰기</button>
		</c:if>
		<div style="height: 20px"></div>
		<table class="table text-center">
				<thead>
					<tr>
						<th>글번호</th> 
						<th>글제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
				<c:forEach items="${list }" var="faqVo">
					<tr>
						<td>${faqVo.faq_num }</td>
						<td><a data-bno="${faqVo.faq_num}" class="faq_title"> ${faqVo.faq_title } </a></td>
						<td>${faqVo.faq_writer }</td>
						<td><fmt:formatDate value="${faqVo.faq_regdate }" 
								pattern="yyyy-MM-dd HH:mm:ss"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
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