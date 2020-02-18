<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/cartStyle.jsp" %>

<script>
$(document).ready(function() {
	// all Check
	$("#allCheck").click(function() {
		if ($("#allCheck").prop("checked")) {
			console.log($("#allCheck"));
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
			
	});
	
	// check delete
	$("#btnDelete").click(function() {
		var checkArr = [];
		$(".chk:checked").each(function() {
			checkArr.push($(this).val());
		});
		console.log("checkArr:" , checkArr);
		var sArr = checkArr.join(",");
		var d = {"checkArr" : sArr }
		$.post("/cart/delete", d , function(rData) {
			var msg = rData.trim();
			if (msg == "success") {
			location.href="/cart/list";
			}
		});
	});
	
	// select Delete
	$(".oneDelete").click(function() {
		var cart_num = $(this).parents("tr").find(".chk").val();
		var myDecision = confirm("정말 삭제하시겠습니까?");
		if (myDecision == true) {
			location.href="/cart/oneDelete/"+cart_num;
		}
	});
	
	// Cart clean
	$("#btnAllDelete").click(function() {
		var myDecision = confirm("장바구니를 비우시겠습니까?");
		if (myDecision == true) {
		location.href="/cart/deleteAll";
		}
	});
	
	// count up
	$(".up").click(function() {
		var cart_num = $(this).parents("tr").find(".chk").val();
		var count = $(this).parent().parent().find("#count").val();
		var sData = {
				"cart_count" : ++count,
				"cart_num" : cart_num
		};
		var url = "/cart/updateCount";
		countAjax(url,sData);
	});
	
	//count down
	$(".down").click(function() {
		var cart_num = $(this).parents("tr").find(".chk").val();
		var count = $(this).parent().parent().find("#count").val();
		var sData = {
				"cart_count" : --count,
				"cart_num" : cart_num
		};
		var url = "/cart/updateCount";
		
		countAjax(url,sData);
	});
	
	// count update
	$(".update").click(function() {
		var cart_num = $(this).parents("tr").find(".chk").val();
		var count = $(this).parent().parent().find("#count").val();
		var sData = {
				"cart_count" : count,
				"cart_num" : cart_num
		};
		var url = "/cart/updateCount";
		
		countAjax(url,sData);
	});
	
	// all buy
	$(".allBuy").click(function() {
		var arr = new Array();
		$(".chk").each(function() {
			var obj = new Object();
			obj.pdt_num = $(this).parents("tr").find("#pdt_num").val();
			obj.cart_count = $(this).parents("tr").find("#count").val();
			arr.push(obj);
		});
		var sData = JSON.stringify(arr);
		buyAjax(sData)
	});
	
	// check buy
	$(".checkBuy").click(function() {
		var arr = new Array();
		$(".chk:checked").each(function() {
			var obj = new Object();
			obj.pdt_num = $(this).parents("tr").find("#pdt_num").val();
			obj.cart_count = $(this).parents("tr").find("#count").val();
			arr.push(obj);
		});
		var sData = JSON.stringify(arr);
		buyAjax(sData)
	});
	// select buy
	$(".oneBuy").click(function() {
		var arr = new Array();
		var obj = new Object();
		obj.pdt_num = $(this).parent().find("#pdt_num").val();
		obj.cart_count = $(this).parents("tr").find("#count").val();
		arr.push(obj);
		var sData = JSON.stringify(arr);
		buyAjax(sData);
	});
	
	// buy ajax
	function buyAjax(sData) {
		$.ajax({
			url : "/cart/buy",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			data : sData,
			dataType : "text"
		});
	}
	// count ajax
	function countAjax(url,sData) {
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sData),
			"success" : function(rData) {
				var msg = rData.trim();
				if (msg == "success") {
					location.href="/cart/list";
				}
			}
		});
	}
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
									<col style="width:5%;">
									<col style="width:20%;">
									<col style="width:25%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col"><input type="checkbox" id="allCheck"/></th>
										<th scope="col"></th>
										<th scope="col">상품명</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">적립금</th>
										<th scope="col">합계</th>
										<th scope="col">선택</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${isEmpty == false}">
											<c:forEach items="${list}" var="vo">
												<tr>
													<td><input type="checkbox" class="chk" value="${vo.cart_num}"/></td>
													<td><img src="../images/blog3.jpg" width="70" height="70" border="0"/></td>
													<td class="left">${vo.pdt_name}</td>
													<td class="price">${vo.pdt_price}</td>
													<td><span><span id="qty"><input type="text" id="count" value="${vo.cart_count}"  />
													<a><img class="up" src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"/></a>
													<a><img class="down" src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"/></a>
													</span>
													<a class="btn_box white middle update">변경</a>
													</span>
													</td>
													<td></td>
													<td>${vo.pdt_total}</td>
													<td><div>
													<span class="btn_box block white middle oneBuy">
													<input id="pdt_num" type="hidden" value="${vo.pdt_num}"/>
													<a>구매</a>
													</span>
													<span class="btn_box block white middle oneDelete">
													<a>삭제</a>
													</span>
													</div></td>
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
							<c:if test="${isEmpty == false}">
							<div>
							<div class="tbl_price">
								<table class="tbl_col">
									<colgroup>
										<col style="width:35%;">
										<col style="width:65%;">
									</colgroup>
								<tbody>
									<tr>
										<th colspan="2" style="text-align: right;">배송비는 <span style="color :#fd5c63">50,000원</span> 이상 구매 시 무료배송 적용됩니다.</th>
									</tr>
									<tr>
										<th scope="row">주문금액</th>
										<td><span>${result}</span>원</td>
									</tr>
									<tr>
										<th scope="row">배송료</th>
										<td>${tip}원</td>
									</tr>
									<tr>
										<th scope="row">결제금액</th>
										<td><span style="color :#fd5c63; font-size: 20px">${total}</span>원</td>
									</tr>
								</tbody>
								</table>
							</div>
							</div>
							</c:if>
						<div class="btn_cart">
							<div class="check">
								<span class="box_btn" ><a class="white large" href="#" id="btnDelete">선택삭제</a></span>
								<span class="box_btn" ><a class="white large" href="#" id="btnAllDelete">장바구니 비우기</a></span>
							</div>
							<div class="order">
								<span class="box_btn"><a class="large black" href="/shop/single">계속 쇼핑하기</a></span>
								<span class="box_btn checkBuy"><a class="large black" href="#">선택상품 주문하기</a></span>
								<span class="box_btn allBuy"><a class="large green" href="#">전체상품 주문하기</a></span>
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