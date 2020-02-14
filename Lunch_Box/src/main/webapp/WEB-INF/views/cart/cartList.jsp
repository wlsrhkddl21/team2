<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/cartStyle.jsp" %>

<script>
$(document).ready(function() {
	$("#addBtn").click(function() {
		$("input[name=mem_id]").val($("#mem_id").val().trim());
		$("input[name=pdt_num]").val($("#pdt_num").val());
		$("input[name=cart_count]").val($("#cart_count").val());
		$("#cartForm").attr("action","/cart/insert");
		$("#cartForm").submit();
	});
	
});
</script>
	<!-- contact -->
	<section class="contact py-5" id="contact">
		<div class="container">
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-12 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<div>
						<h3 class="mb-4 sec-title-w3 let-spa text-bl">장 바 구 니</h3>
							<div class="process">
								<ol>
									<li><span class="num selected">1</span>장바구니</li>
									<li><span class="num">2</span>주문서 작성/결제</li>
									<li><span class="num">3</span>주문 완료</li>
								</ol>
							</div>
						</div>
					</div>
					<div class="form-w3ls p-md-5 p-4">
						<div>
						<form id="cartForm" action="#" method="POST" style="margin: 0px;">
						<input type="hidden" name="mem_id">
						<input type="hidden" name="pdt_num">
						<input type="hidden" name="cart_count">
							<table class="tbl_col" >
								<colgroup>
									<col style="width:10%;">
									<col style="width:20%;">
									<col style="width:30%;">
									<col style="width:20%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox"/></th>
										<th scope="col"></th>
										<th scope="col">상품명</th>
										<th scope="col">가격</th>
										<th scope="col">수량</th>
										<th scope="col">번호</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="">
											<c:forEach items="${list}" var="vo">
												<tr>
													<td><input type="checkbox"/><a href="/cart/delete/${vo.cart_num}">삭제</a></td>
													<td><img src="../images/blog3.jpg" width="70" height="70" border="0"/></td>
													<td class="left">${vo.pdt_name}</td>
													<td>${vo.pdt_price}</td>
													<td>${vo.cart_count}</td>
													<td>${vo.cart_num}</td>
												</tr>
										</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="6" class="empty">장바구니가 비었습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						<div class="tbl_price">
							<table>
								<colgroup>
									<col style="width:35%;">
									<col style="width:65%;">
								</colgroup>
								<tbody>
									<tr>
										<th colspan="2" style="text-align: center;">배송비는 20000원 이상 구매 시 무료배송 적용됩니다.</th>
									</tr>
									<tr>
										<th scope="row">주문금액</th>
										<td>20000원</td>
									</tr>
									<tr>
										<th scope="row">배송료</th>
										<td>0원</td>
									</tr>
									<tr>
										<th scope="row">결제금액</th>
										<td>20000원</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btn_cart">
							<div class="check">
								<span class="box_btn" ><a class="white large" href="#">선택삭제</a></span>
								<span class="box_btn" ><a class="white large" href="#">장바구니 비우기</a></span>
							</div>
							<div class="order">
								<span class="box_btn"><a class="large black" href="#">계속 쇼핑하기</a></span>
								<span class="box_btn"><a class="large black" href="#">선택상품 주문하기</a></span>
								<span class="box_btn"><a class="large green" href="#">전체상품 주문하기</a></span>
							</div>
						</div>
						</form>
						</div>
					</div>
				</div>
				<div class="col-lg-2 map">
				</div>
				<!-- //contact form -->
			</div>
		</div>
	</section>
	<!-- //contact -->

	

	
<%@ include file="../include/footer.jsp" %>