<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
div {
	display: block;
}
.num {
	float: left;
    width: 30px;
    height: 30px;
    margin-right: 8px;
    border-radius: 100%;
    background: #cacaca;
    color: #fff;
    font-size: 16px;
    text-align: center;
    line-height: 30px;
}
.selected {
	background-color: #fd5c63;
}
li {
    float: left;
    padding: 0 0 0 30px;
/*     background: url(http://www.homeal.net/_skin/homeal/img/common/arr_step.png) no-repeat 15px 50%; */
    color: #a4a4a4;
    font-size: 16px;
    font-weight: 400;
    line-height: 30px;
}
ol {
	list-style: none;
}
.process {
	float : right;
}
.tbl_col{
	table-layout: fixed;
	clear: both;
	width: 100%;
	border-collapse: collapse;
}
th {
	padding: 15px 0;
	background: #f7f7f7;
	color: #333;
	font-size: 15px;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
}
td {
	padding: 15px 0;
	border-bottom: 1px solid #e6e6e6;
	color: #333;
	font-size: 14px;
	text-align: center;
	vertical-align: middle;
}
.tbl_price {
	position : relative;
	padding: 30px;
	border-bottom: 1px solid #dbdbdb;
	background : #f9f9f9;
	text-align: right;
}
.tbl_price table{
	float: right;
	width: 400px;
}
.tbl_price table th{
	padding: 7px 0;
	color: #333;
	font-size: 15px;
	font-weight: 400;
	text-align: left;
}
.tbl_price table td{
	padding: 7px 0;
	color: #333;
	font-size: 15px;
	text-align: right;
}
.left {
	padding-left: 15px;
	text-align: left;
}
p {
 	margin: 0;
 	padding: 0;
 	font-size: inherit;
 	letter-spacing: inherit;
 	line-height: normal;
 	color: inherit;
}
</style>

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
								</tbody>
							</table>
						<div class="tbl_price">
							<p style="">배송비는 20000원 이상 구매시 무료배송 입니다.</p>
							<table>
								<colgroup>
									<col style="width:35%;">
									<col style="width:65%;">
								</colgroup>
								<tbody>
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