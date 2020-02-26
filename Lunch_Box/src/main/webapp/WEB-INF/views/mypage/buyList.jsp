<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>
.mypage_info {
	padding: 35px;
	border: 5px solid #ededed;
	margin-top: 20px;
}
th{
	background: #f8f9fa;
}
</style>
<script>
	$(document).ready(function(e) {
		$(".proView").click(function(e) {
			e.preventDefault();
			var buy_num = $(this).attr("data-buy_num");
			$(".detailView").each(function(){
				var detail_num = $(this).attr("data-buy_detail");
				if(buy_num==detail_num){
					$(this).toggle();
				}
			});
		});
	});
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
						<h4 style="margin-bottom: 15px; ">구매 목록</h4>
							<table class="table text-center">
								<thead>
									<tr>
										<th>구매일</th>
										<th>배송지</th>
										<th>전화번호</th>
										<th>상품</th>
										<th>금액</th>
									</tr>
								</thead>
								<%-- 									${buyFirstlist } --%>
								<%-- 									${buyList } --%>
								<tbody>
									<c:forEach items="${buyFirstlist  }" var="buyJoinDto">
										<tr>
											<td>${buyJoinDto.buy_date }</td>
											<td>${buyJoinDto.buy_address }</td>
											<td>${buyJoinDto.buy_tel }</td>
											<c:forEach items="${proList }" var="productVo">
												<c:if test="${buyJoinDto.pdt_num==productVo.pdt_num }">
													<td><a href="#" class="proView"
														data-buy_num="${buyJoinDto.buy_num }">${productVo.pdt_name }(상세보기)</a>
													</td>
												</c:if>

											</c:forEach>
											<td>${buyJoinDto.buy_price }</td>
										</tr>
										<c:forEach items="${buyList }" var="buyView">
											<c:if test="${buyView.buy_num==buyJoinDto.buy_num }">
												<tr style="display:none;" class="detailView" data-buy_detail="${buyView.buy_num }" >
													<td></td>
													<td></td>
													<td></td>

													<c:forEach items="${proList }" var="productVo">
														<c:if test="${buyView.pdt_num==productVo.pdt_num }">

															<td><a href="/shop/detail/${buyView.pdt_num }"
																class="proView" style="font-size:13px">(${productVo.pdt_name })</a>
															</td>
															<td>${productVo.pdt_price }</td>
														</c:if>
													</c:forEach>

												</tr>
											</c:if>
										</c:forEach>
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