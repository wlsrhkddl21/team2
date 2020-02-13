<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<br>
		<div style="height: 20px"></div>
		<h3 class="title-w3ls text-center text-bl mb-5">공지사항</h3>
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
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
	<!-- pagination -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 text-center">
			<div class="row">
			<nav>
				<ul class="pagination">
					<c:if test="${pagingDto.hasPrev == true }">
					<li class="page-item">
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
		</div>
	</div>
		</div>
		<div class="col-md-2">
		</div>
	
	<!-- // pagination -->
<%@ include file="../include/footer.jsp" %>