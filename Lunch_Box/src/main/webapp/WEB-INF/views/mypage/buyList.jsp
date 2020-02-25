<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>
.mypage_info {
	padding: 35px;
	border: 5px solid #ededed;
	margin-top: 20px;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div style="height: 20px;"></div>
			<h3 class="title-w3ls text-center text-bl mb-5">My page</h3>
			<div class="row">
				<div class="col-md-3">
					<div style="height: 20px;"></div>
					<%@ include file="../include/myMenu.jsp"%>
				</div>
				<div class="col-md-9">
					<div class="row">
							<div class="mypage_info text-center">
								<table class="table text-center">
									<thead>
										<tr>
											<th>구매일</th>
											<th>배송지</th>
											<th>전화번호</th>
											<th>상품</th>
											<th>갯수</th>
											<th>금액</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${buyList }" var="buyJoinDto">
										<tr>
											<td>${buyJoinDto.buy_date }</td>
											<td>${buyJoinDto.buy_address }</td>
											<td>${buyJoinDto.buy_tel }</td>
										<c:forEach items ="${proList }" var="productVo">
											<c:if test="${buyJoinDto.pdt_num==productVo.pdt_num }">
											<td>${productVo.pdt_name }</td>
											</c:if>
										
										</c:forEach>
											<td>${buyJoinDto.buy_count }</td>
											<td>${buyJoinDto.buy_price }</td>
										</tr>
									</c:forEach>
										
									</tbody>
								</table>
							</div>
					</div>
				</div>
				<div class="col-md-2" style="height: 600px;"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>