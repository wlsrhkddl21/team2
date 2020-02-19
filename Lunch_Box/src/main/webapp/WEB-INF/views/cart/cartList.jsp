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
		var isThis = $(this);
		var sData = {
				"cart_count" : ++count,
				"cart_num" : cart_num
		};
		countAjax(isThis,sData);
	});
	
	//count down
	$(".down").click(function() {
		var isThis = $(this);
		var cart_num = $(this).parents("tr").find(".chk").val();
		var count = $(this).parent().parent().find("#count").val();
		var sData = {
				"cart_count" : --count,
				"cart_num" : cart_num
		};
		
		countAjax(isThis,sData);
	});
	
	// count update
	$(".update").click(function() {
		var cart_num = $(this).parents("tr").find(".chk").val();
		var count = $(this).parent().parent().find("#count").val();
		var isThis = $(this);
		var sData = {
				"cart_count" : count,
				"cart_num" : cart_num
		};
		
		countAjax(isThis,sData);
	});
	
	// all buy
	$(".allBuy").click(function() {
		$(".chk").each(function() {
			var numHidden = document.createElement("input");
			numHidden.setAttribute("type", "hidden");
			numHidden.setAttribute("value", $(this).parents("tr").find("#num").val() );
			numHidden.setAttribute("name", "pdt_num");
			numHidden.setAttribute("id","pdt_num");
			document.getElementById("cartForm").appendChild(numHidden);
			
			var countHidden = document.createElement("input");
			countHidden.setAttribute("type", "hidden");
			countHidden.setAttribute("value", $(this).parents("tr").find("#count").val());
			countHidden.setAttribute("name", "cart_count");
			countHidden.setAttribute("id","cart_count");
			document.getElementById("cartForm").appendChild(countHidden);
		});
	});
	
	// check buy
	$(".checkBuy").click(function() {
		$(".chk:checked").each(function() {
			var numHidden = document.createElement("input");
			numHidden.setAttribute("type", "hidden");
			numHidden.setAttribute("value", $(this).parents("tr").find("#num").val() );
			numHidden.setAttribute("name", "pdt_num");
			numHidden.setAttribute("id","pdt_num");
			document.getElementById("cartForm").appendChild(numHidden);
			
			var countHidden = document.createElement("input");
			countHidden.setAttribute("type", "hidden");
			countHidden.setAttribute("value", $(this).parents("tr").find("#count").val());
			countHidden.setAttribute("name", "cart_count");
			countHidden.setAttribute("id","cart_count");
			document.getElementById("cartForm").appendChild(countHidden);
		});
	});
	// select buy
	$(".oneBuy").click(function() {
		var numHidden = document.createElement("input");
		numHidden.setAttribute("type", "hidden");
		numHidden.setAttribute("value", $(this).parent().find("#num").val());
		numHidden.setAttribute("name", "pdt_num");
		numHidden.setAttribute("id","pdt_num");
		document.getElementById("cartForm").appendChild(numHidden);
		
		var countHidden = document.createElement("input");
		countHidden.setAttribute("type", "hidden");
		countHidden.setAttribute("value", $(this).parents("tr").find("#count").val());
		countHidden.setAttribute("name", "cart_count");
		countHidden.setAttribute("id","cart_count");
		document.getElementById("cartForm").appendChild(countHidden);
	});
	
	// count ajax
	function countAjax(isThis,sData) {
		$.ajax({
			"type" : "post",
			"url" : "/cart/updateCount",
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sData),
			"success" : function(rData) {
				isThis.parents("tr").find("#count").val(rData);
				getPrice();
			}
		});
	}
	
	// ajax price
	function getPrice() {
		$.ajax({
			url : "/cart/totalPrice",
			type : "post",
			success : function(rData) {
				$("#result").text(rData.strResult);
				$("#tip").text(rData.strTip);
				$("#total").text(rData.strTotalPrice);
			}
		});
		
		$(".chk").each(function() {
			var me = $(this);
			var price = me.parents("tr").find(".price").text();
			var count = me.parents("tr").find("#count").val();
			var sData = {
					"price" : price,
					"count" : count
			}
			$.ajax({
				url : "/cart/price",
				type : "post",
				data : sData,
				success : function(rData) {
					
				me.parents("tr").find(".totalPrice").text(rData.strTotal);
				me.parents("tr").find(".point").text(rData.strPoint);
				
				}
			});
		});
	} 
	
	getPrice();
	
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
										<th scope="col">포인트 적립</th>
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
													<td style="color : lightcoral"><span class="point"></span>P</td>
													<td class="totalPrice"></td>
													<td><div>
													<span class="btn_box block white middle oneBuy">
													<input id="num" type="hidden" value="${vo.pdt_num}"/>
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
												<td colspan="8" class="empty">장바구니가 비었습니다.</td>
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
										<td><span id="result"></span>원</td>
									</tr>
									<tr>
										<th colspan="2" style="text-align: right;">총 적립 포인트</th>
									</tr>
									<tr>
										<th scope="row">배송료</th>
										<td><span id="tip"></span>원</td>
									</tr>
									<tr>
										<th scope="row">결제금액</th>
										<td><span style="color :#fd5c63; font-size: 20px" id="total"></span>원</td>
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