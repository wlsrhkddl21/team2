<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/cartStyle.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.buy_text {
	color: #343a40;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#btn_point").click(function(){
			var mem_point = "${memberVo.mem_point}";
			var total_price = "${#result_price}.attr("data-price")";
			console.log(total_price);
			var point = $("input[name=use_point]").val();
			
			if(mem_point<point){
				alert("보유한 포인트가 모자랍니다.");
				return;
			}
			
			if(point%100 != 0){
				alert("포인트는 100 단위로 사용 가능합니다.");
				return;
			}
			
			
		});
	});

</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<section class="contact py-5" id="contact">
				<div class="container">
					<div class="row mx-sm-0 mx-2">
						<!-- map -->
						<div class="col-lg-2 map"></div>
						<!-- //map -->
						<!-- contact form -->
						<div class="col-lg-12 main_grid_contact">
							<div class="form-w3ls p-md-5 p-4">
								<div>
									<h3 class="mb-4 sec-title-w3 let-spa text-bl">주문/결제</h3>
									<div class="process">
										<ol>
											<li><span class="num">1</span>장바구니</li>
											<li><span class="num selected">2</span>주문서 작성/결제</li>
											<li><span class="num">3</span>주문 완료</li>
										</ol>
									</div>
								</div>
							</div>
							<div class="form-w3ls p-md-5 p-4">
								<div>
									<table class="tbl_col text-center tbl_buy">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">상품명</th>
												<th scope="col">배송비</th>
												<th scope="col">적립금</th>
												<th scope="col">수량</th>
												<th scope="col">주문금액</th>
											</tr>
											<c:set var="total_point" value="0"/>
											<c:set var="total_pdt_price" value="0"/>
											<!-- foreach -->
											<c:forEach items="${list }" var="buyVo">
											<tr>
											<c:set var="point" value="${buyVo.buy_price*0.05 *buyVo.buy_count }"></c:set>
											<c:set var="price" value="${buyVo.buy_price*buyVo.buy_count }"></c:set>
											<c:set var="total_pdt_price" value="${total_pdt_price+price}"/>
											<c:set var="total_point" value="${total_point+point}"/>
												<td scope="col"><img src="../images/test1.jpg"
													style="height: 100px; width: 100px;" /></td>
												<td scope="col">${buyVo.buy_pdt_name }</td>
												<td scope="col">2,500원</td>
												<td scope="col">
													<span class="point" data-point="${point }">
													<fmt:formatNumber value="${point }"
														type="number"/></span>P
												</td>
												<td scope="col">${buyVo.buy_count }</td>
												<td scope="col"><span class="price" data-price="${price }">
														<fmt:formatNumber
														value="${price }" type="number"/></span>원</td>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="6">적립 예정 포인트 :<fmt:formatNumber value="${total_point}" type="number"/> P</td>
											</tr>
										</thead>
									</table>
									<div class="row">
										<div class="col-md-6">
											<h4 style="margin-top: 30px; margin-bottom: 15px;"
												class="buy_text">포인트 사용</h4>
											<table class="table text-center"
												style="vertical-align: baseline;">
												<tr>
													<th>보유 포인트</th>
													<td><fmt:formatNumber value="${memberVo.mem_point }"
															type="number" />P</td>
												</tr>
												<tr>
													<th>사용 포인트</th>
													<td><input type="text" name="use_point"
														style="width: 110px; height: 12px; text-align: right;">P</td>
												</tr>
												<tr>
													<td colspan="2"><input type="button" value="포인트 사용"
														class="btn btn-secondary" id="btn_point"></td>
												</tr>
												<tr>
													<td colspan="2">포인트는 100단위 부터 사용 가능합니다.</td>
												</tr>
											</table>
										</div>
										<c:set var="total_price" value="${total_pdt_price}"></c:set>
										<c:if test="${total_pdt_price <= 50000}">
											<c:set var="total_price" value="${total_price+2500}"></c:set>
										</c:if>
										<div class="col-md-6">
											<h4 style="margin-top: 30px; margin-bottom: 15px;"
												class="buy_text text-center">
												총 결제 금액 : <span id="result_price" data-price="${total_price }"> <fmt:formatNumber
														value="${total_price }" type="number" /></span>
											</h4>
											<div>
												<table class="table tbl_result">
													<tr>
														<th>상품 가격:(+) <fmt:formatNumber
																value="${total_pdt_price }" type="number" /></th>
													</tr>
													<tr>
														<th
															<c:choose>
																<c:when test="${total_pdt_price <= 50000}">
																</c:when>
																<c:otherwise>style="display: none;"</c:otherwise>
															</c:choose>>배송비:(+) 2,500원</th>
													</tr>
													<tr>
														<th style="display: none;">테스트</th>
													</tr>
												</table>
											</div>
											${total_price}
											<!-- 	상품 가격 <br>
												+ 배송비 <br>
												- 포인트 사용금액 <br>
												 <br>
												총 적립금: -->
										</div>
									</div>
								</div>
								<h4 style="margin-top: 30px; margin-bottom: 15px;"class="buy_text">배송지 정보</h4>
								<div style="height: 30px;"></div>
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-1"></div>
										<div class="col-md-6">
											<div class="btn_cart" align="center">
												<div class="order">
													<span class="box_btn"><a class="large green"
														href="#" style="font-size: 25px;">결제 하기</a></span>
												</div>
											</div>
										</div>
										<div class="col-md-5"></div>
									</div>
								</div>

							</div>
						</div>
					</div>
					<div class="col-lg-2 map"></div>
				</div>
			</section>
		</div>

	</div>
</div>
<table class="table">
	<!-- 테이블 먼저 만들기 -->
	<!-- 구매 폼 만들기 1개상품 구매 완료 
				mapper, test 만들기 -->
</table>
<div class="col-md-2"></div>


<%@ include file="../include/footer.jsp"%>