<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/buyStyle.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.buy_text {
	color: #343a40;
}
</style>
<script type="text/javascript">

	$(function() {

		$("#btn_point").click(function() {
			//현재 가지고있는 포인트
			var mem_point = "${memberVo.mem_point}";
			var parse_mem_point = parseInt(mem_point);

			var span_price = $("#result_price");
			var txt_total_price = span_price.attr("data-price");
			var total_price = parseInt(txt_total_price);
// 			console.log(total_price);

			var point = $("input[name=use_point]").val();
			console.log(point);
			if (parse_mem_point < point) {
				alert("보유한 포인트가 모자랍니다.");
				return;
			}

			if (point % 100 != 0) {
				alert("포인트는 100 단위로 사용 가능합니다.");
				return;
			}

			if (point == "") {
				console.log("포인트 사용금액 없음")
				return;
			}

			if (point > total_price) {
				point = total_price;
				$("input[name=use_point]").val(point);
			}

			total_price = total_price - point;

			var th_point = $("#th_point");
			th_point.css("visibility", "visible")
			span_price.text(total_price);
			$("#span_point").text(point);
			$("#span_point").attr("data-use-point",point);
			span_price.attr("data-price-total",total_price);
			
		});

		$("#btn_point_cancle").click(function() {
			var th_point = $("#th_point");
			th_point.css("visibility", "hidden");
			var span_price = $("#result_price");
			var total_price = span_price.attr("data-price");
			span_price.text(total_price);
			span_price.attr("data-price-total",0);
			$("#span_point").attr("data-use-point",0);
		});
		
		$("#btnAdd").click(function() {
			
			new daum.Postcode({
				oncomplete : function(data) {
					$("#add_span").text(data.address);
				}
			
			}).open();
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
									<table class="tbl_col text-center">
										<thead>
											<tr>
												<th scope="col"></th>
												<th scope="col">상품명</th>
												<th scope="col">판매가</th>
												<th scope="col">배송비</th>
												<th scope="col">적립금</th>
												<th scope="col">수량</th>
												<th scope="col">주문금액</th>
											</tr>
											<c:set var="total_point" value="0"/>
											<c:set var="total_pdt_price" value="0"/>
											<!-- foreach -->
											<c:forEach items="${list }" var="dto">
											<tr>
											<c:set var="price" value="${dto.pdt_price*dto.buy_count }"></c:set>
											<c:set var="point" value="${dto.pdt_price*0.05 *dto.buy_count }"></c:set>
											<c:set var="total_pdt_price" value="${total_pdt_price+price}"/>
											<c:set var="total_point" value="${total_point+point}"/>
												<td scope="col"><img src="../images/test1.jpg"
													style="height: 100px; width: 100px;" /></td>
												<td scope="col">${dto.pdt_name}</td>
												<td scope="col"><fmt:formatNumber value= "${dto.pdt_price}" type="number"/> 원</td>
												<td scope="col">2,500원</td>
												<td scope="col">
													<span class="point" data-point="${point }">
													<fmt:formatNumber value="${point }"
														type="number"/></span>P
												</td>
												<td scope="col">${dto.buy_count }</td>
												<td scope="col"><span class="price" data-price="${price }">
														<fmt:formatNumber
														value="${price }" type="number"/></span>원</td>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="7">적립 예정 포인트 :<fmt:formatNumber value="${total_point}" type="number"/> P</td>
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
													<td colspan="2">
														<input type="button" value="포인트 사용 취소"
															class="btn btn-outline-dark" id="btn_point_cancle">
														<input type="button" value="포인트 사용"
															class="btn btn-outline-danger" id="btn_point">
													</td>
												</tr>
												<tr>
													<td colspan="2">포인트는 100단위 부터 사용 가능합니다.</td>
												</tr>
											</table>
										</div>
										<c:set var="total_price" value="${total_pdt_price}"></c:set>
										<c:if test="${total_pdt_price < 50000}">
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
																<c:when test="${total_pdt_price < 50000}">
																</c:when>
																<c:otherwise>style="display: none;"</c:otherwise>
															</c:choose>>배송비:(+) 2,500원</th>
													</tr>
													<tr>
														<th style="visibility: hidden;" id="th_point">포인트 사용:(-) 
																	<span id="span_point"></span>P</th>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								
								<h4 style="margin-top: 30px; margin-bottom: 15px;"class="buy_text">배송지 정보</h4>
								<table class="table text-center">
									<tr class="buy_text">
										<td style="font-size: 18px; font-weight: 300">배송 주소 :
											 <span id="add_span">${memberVo.mem_address }</span> <br> 
											<input type="button" id="btnAdd" value="주소 변경" class="btn btn-outline-dark" style="margin-top: 10px;"/>
										</td>
									</tr>
								</table>
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
<!-- 세부 주소 모달 -->
<div class="row">
		<div class="col-md-12">
			 <a id="modal-32239" href="#modal-container-32239" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-32239" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								Modal title
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							...
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-primary">
								Save changes
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								Close
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>

<%@ include file="../include/footer.jsp"%>