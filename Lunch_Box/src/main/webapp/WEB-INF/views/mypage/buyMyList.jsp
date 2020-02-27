<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>
.mypage_info {
	padding: 50px;
	border: 5px solid #ededed;
	margin-top: 20px;
	margin-left: 60px;
}
</style>
<script>
	
</script>
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
							<h4 style="margin-bottom: 15px;">나만의 도시락 구매 목록</h4>
							<c:choose>
								<c:when test="${empty list}">
									<div>구매내역이 없습니다.</div>
								</c:when>
								<c:otherwise>
									<table class="table text-center">
										<tr>
											<th>구매일</th>
											<th>배송지</th>
											<th>전화번호</th>
											<th>상품</th>
											<th>갯수</th>
											<th>금액</th>
										</tr>
										<c:forEach items="${list }" var="vo">
											<tr>
												<td>${vo.buy_date }</td>
												<td>${vo.buy_address }</td>
												<td>${vo.buy_tel}</td>
												<td>${vo.buy_name }</td>
												<td>${vo.buy_count }</td>
												<td>${vo.buy_price }</td>
											</tr>
										</c:forEach>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="height: 600px;"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>