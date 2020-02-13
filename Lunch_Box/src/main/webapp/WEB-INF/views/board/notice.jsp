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

<%@ include file="../include/footer.jsp" %>