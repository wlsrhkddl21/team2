<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
th {
	background-color: #f7f7f7;
}
</style>
<script>
	$(document).ready(function() {
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
		<div class="col-md-8 main_grid_contact form-w3ls p-md-5 p-4">
			<div class="row" style="margin-bottom: 10px;">
				<div class="col-md-6">
					<a href="/admin/list"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">전체상품</a>
					<a href="/myLunch/readAll"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">나만의도시락</a>
					<a href="/admin/orderList"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">주문내역</a>
				</div>
				<div class="col-md-6"></div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<%@include file="../include/adminBuyPage.jsp"%>
				</div>
				<div class="col-md-9">
				<table class="table text-center">
								<thead>
									<tr>
										<th>구매일</th>
										<th>배송지</th>
										<th>아이디</th>
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
											<td>${buyJoinDto.mem_id }</td>
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
																style="font-size:13px">${productVo.pdt_name }(${buyView.buy_count }개)</a>
															</td>
															<td>${productVo.pdt_price*buyView.buy_count }</td>
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
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>