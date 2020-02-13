<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<div class="row">
		<div class="col-md-12">
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
					<tr>
						<td>${boardVo.not_num }</td>
						<td><a data-bno="${boardVo.not_num }"
							   class="board-title">${boardVo.not_title } [${boardVo.not_cnt }]</a></td>
						<td>${boardVo.bot_writer }</td>
						<td><fmt:formatDate value="${boardVo.not_regdate}" 
								pattern="yyyy-MM-dd HH:mm:ss"/></td>
						
						<td>${boardVo.not_viewcnt }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


<%@ include file="../include/footer.jsp" %>