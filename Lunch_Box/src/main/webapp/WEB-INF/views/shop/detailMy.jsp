<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<style>
	.div_text{
		font-size: 18px;
	}
	.selDiv{
		margin: 5px;
	}
	.count {
		display: none;
	}
</style>
<script type="text/javascript">
//----------------------------- 사용자 함수 정의---------------------------------------------

//가격 가져오기
function getSelectVal(id) {

	var val = $("#" + id + " :selected").val();

	return val;
}
//가격 계산

function getPrice() {

	var rice = $("input[name=rice]").attr("data-price");
	var soup = $("input[name=soup]").attr("data-price");
	var side1 = $("input[name=side1]").attr("data-price");
	var side2 = $("input[name=side2]").attr("data-price");
	var side3 = $("input[name=side3]").attr("data-price");

	//없는값 0으로
	rice = chageNtoZero(rice);
	soup = chageNtoZero(soup);
	side1 = chageNtoZero(side1);
	side2 = chageNtoZero(side2);
	side3 = chageNtoZero(side3);

// 	console.log("rice:" + rice);
// 	console.log("soup:" + soup);
// 	console.log("side1:" + side1);
// 	console.log("side2:" + side2);
// 	console.log("side3:" + side3);

	var price = parseInt(rice) + parseInt(soup) + parseInt(side1)
			+ parseInt(side2) + parseInt(side3);
	
	$("#price").text(price);
	$("#span_pdt_price").text(price);
	
// 	console.log(price);
	

}

function chageNtoZero(val) {
	if (val == 'n' || val == "") {
		val = 0;
	}
	return val;
}

//모두 셀렉트 됐는지 확인
function chkSelectN() {

	var rice = getSelectVal("rice");
	var soup = getSelectVal("soup");
	var side1 = getSelectVal("side1");
	var side2 = getSelectVal("side2");
	var side3 = getSelectVal("side3");

	if (chageNtoZero(rice) == 0) {
		return false;
	} else if (chageNtoZero(soup) == 0) {
		return false;
	} else if (chageNtoZero(side1) == 0) {
		return false;
	} else if (chageNtoZero(side2) == 0) {
		return false;
	} else if (chageNtoZero(side3) == 0) {
		return false;
	}

	return true;
}

function displayCnt(v){
// 	console.log("함수!" + v);
	if (v==true){
		$(".count").css("display","block");
		$("input[name=buy_count]").val(1);
// 		console.log("함수2!" + v);
	}else{
		$(".count").css("display","none");
		$("#span_pdt_price").text("");
// 		console.log("함수2!" + v);
	}
}
//----------------------------- 사용자 함수 정의 --------------------------------------------- (end)

	$(function(){
		
		var mem_id = "${sessionScope.mem_id}";
		var chkN = chkSelectN();
		
// 		console.log(mem_id);
// 		console.log(chkN);
		
		$("#btnSub").click(function(){
			var elCount = $("input[name=buy_count]");
			var count = elCount.val();
			var pdt_price = $("#price").text();
			var parsePrice = parseInt(pdt_price);
			
			console.log("수량 빼기"+count);
			console.log(parsePrice);
			
			if(count > 1){
				count --;
				elCount.val(count);
				
				if(chkN==false){
					console.log("값 0");
					elCount.val(1);
					return;
				}
				
				$("#span_pdt_count").text(count);
				$("#span_pdt_price").text(count*parsePrice);
				
			}else{
				
				if(chkN==false){
					console.log("값 0");
					elCount.val(1);
					return;
				}
				
				return;
			}
		});
		
		$("#btnAdd").click(function(){
			var elCount = $("input[name=buy_count]");
			var count = elCount.val();
			var pdt_price = $("#price").text();
			var parsePrice = parseInt(pdt_price);
			
			if(chkN==false){
				console.log("값 0");
				elCount.val(1);
				return;
			}
			
			count ++;
			elCount.val(count);
			$("#span_pdt_count").text(count);
			$("#span_pdt_price").text(count*parsePrice);
		
		});
		$("#bntCart").click(function() {
			var count = $("#pdt_count").val();
			location.href="/cart/insert/"+"${productVo.pdt_num}"+"/"+count;
		});
		
		$("#bntBuy").click(function(){

			if(mem_id == ""){
// 				console.log("아이디없음");
				 alert("결제는 로그인 후에 이용할 수 있습니다.");
				 location.href="/lb/login";
				 return;
			}else if(chkN==false){
// 				console.log("선택 X");
				 alert("옵션을 모두 선택해주세요.");
				 return;
			}else{
				
				var rice = $("input[name=buy_name]").attr("data-rice");
				var soup = $("input[name=buy_name]").attr("data-soup");
				var side1 = $("input[name=buy_name]").attr("data-side1");
				var side2 = $("input[name=buy_name]").attr("data-side2");
				var side3 = $("input[name=buy_name]").attr("data-side3");
				var price = parseInt($("#price").text());
				$("input[name=buy_price]").val(price);
				var name = rice+","+soup+","+side1+","+side2+","+side3;
				console.log(name);
// 				console.log(price);
				$("input[name=buy_name]").val(name);
				
				$("#buy_form").submit();
			}
			
		});
		
		//셀렉트 상자
		$("#rice").change(function(){
			var value = $(this).find("option:selected").data("num");
			var name = $(this).find("option:selected").data("name");
			var price = $(this).val();
			
			$("input[name=rice]").attr("data-price",price);
			$("input[name=rice]").val(value);
			$("input[name=buy_name]").attr("data-rice",name);
			
			console.log(name);
			//상태 변경
			chkN = chkSelectN();
			//가격 수정
			getPrice();
			displayCnt(chkN);
		});
		
		$("#soup").change(function(){
			var value = $(this).find("option:selected").data("num");
			var name = $(this).find("option:selected").data("name");
			var price = $(this).val();
			
			console.log(name);
			
			$("input[name=soup]").attr("data-price",price);
			$("input[name=soup]").val(value);
			$("input[name=buy_name]").attr("data-soup",name);
			
			chkN = chkSelectN();
// 			console.log(chkN);
			getPrice();
			displayCnt(chkN);
		});
		
		$("#side1").change(function(){
			var value = $(this).find("option:selected").data("num");
			var name = $(this).find("option:selected").data("name");
			var price = $(this).val();
			
			console.log(name);
			
			$("input[name=side1]").attr("data-price",price);
			$("input[name=side1]").val(value);
			$("input[name=buy_name]").attr("data-side1",name);
			
			chkN = chkSelectN();
// 			console.log(chkN);
			getPrice();
			displayCnt(chkN);
		});
		
		$("#side2").change(function(){
			var value = $(this).find("option:selected").data("num");
			var name = $(this).find("option:selected").data("name");
			var price = $(this).val();
			
			console.log(name);
			
			$("input[name=side2]").attr("data-price",price);
			$("input[name=side2]").val(value);
			$("input[name=buy_name]").attr("data-side2",name);
			
			chkN = chkSelectN();
// 			console.log(chkN);
			getPrice();
			displayCnt(chkN);
		});
		
		$("#side3").change(function(){
			var value = $(this).find("option:selected").data("num");
			var name = $(this).find("option:selected").data("name");
			var price = $(this).val();
			
			console.log(name);
			
			$("input[name=side3]").attr("data-price",price);
			$("input[name=side3]").val(value);
			$("input[name=buy_name]").attr("data-side3",name);
			
			chkN = chkSelectN();
// 			console.log(chkN);
			getPrice();
			displayCnt(chkN);
		});
		//셀렉트 상자끝
			
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
				<div style="height: 30px;"></div>
					<img src="../images/my.PNG" alt="상품이미지" class="img-fluid"
						style="height: 380px; width: 380px;" />
				</div>
				<div class="col-md-8">
				<form action="/shop/buyMy" method="post" id="buy_form">
					<input type="hidden" name="buy_name"
						data-rice="" data-soup=""
						data-side1="" data-side2="" data-side3=""
					  /> 
					<input type="hidden" name="buy_count"/> 
					<input type="hidden" name="buy_price"/> 
					<input type="hidden" name="rice" data-price=""/> 
					<input type="hidden" name="soup" data-price=""/> 
					<input type="hidden" name="side1" data-price=""/> 
					<input type="hidden" name="side2" data-price=""/> 
					<input type="hidden" name="side3" data-price=""/> 
					<div style="height: 30px;"></div>
						<h1 style="color: #fd5c63;">나만의 도시락</h1>
						<hr>
						<p>나만의 도시락</p>
						<p>원하는 밥, 국, 반찬을 선택하여 주문하는 도시락</p>
						<b style="font-size: 25px;">판매가:<span id="price">0</span>원</b>
						<div class="div_text">배송비 : 2,500원 (5만원 이상 무료)</div>
						<div class="div_text">적립금 : 구매 금액의 5%</div>
						<hr>
						<div class="selDiv">&nbsp;&nbsp;밥:&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="rice" id="rice" class="select">
								<option value="n">=====선택=====</option>
								  <c:forEach items="${list }" var="vo">
								  	<c:if test="${vo.lunch_type eq 'rice'}">
								  		  <option value="${vo.lunch_price}"
								  		  		 data-name="${vo.lunch_name }"
								  		  		 data-num="${vo.lunch_num }">${vo.lunch_name }(${vo.lunch_price}원)</option>
								  	</c:if>
								  </c:forEach>
							</select>
						</div>
						<div class="selDiv">&nbsp;&nbsp;국:&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="soup" id="soup" class="select">
								<option value="n">=====선택=====</option>
								  <c:forEach items="${list }" var="vo">
								  	<c:if test="${vo.lunch_type eq 'soup'}">
								  		  <option value="${vo.lunch_price}" data-name="${vo.lunch_name }"
								  		  		 data-num="${vo.lunch_num }">${vo.lunch_name }(${vo.lunch_price}원)</option>
								  	</c:if>
								  </c:forEach>
							</select>
						</div>
						<div class="selDiv">반찬1:
								<select name="side1" id="side1" class="select">
									<option value="n">======선택======</option>
								  <c:forEach items="${list }" var="vo">
								  	<c:if test="${vo.lunch_type eq 'side'}">
								  		  <option value="${vo.lunch_price}" data-name="${vo.lunch_name }"
								  		  		 data-num="${vo.lunch_num }" >${vo.lunch_name }(${vo.lunch_price}원)</option>
								  	</c:if>
								  </c:forEach>
								</select>
						</div>
						<div class="selDiv">반찬2:
							<select name="side2" id="side2" class="select">
								<option value="n">======선택======</option>
								  <c:forEach items="${list }" var="vo">
								  	<c:if test="${vo.lunch_type eq 'side'}">
								  		  <option value="${vo.lunch_price}" data-name="${vo.lunch_name }"
								  		  		 data-num="${vo.lunch_num }" >${vo.lunch_name }(${vo.lunch_price}원)</option>
								  	</c:if>
								  </c:forEach>
							</select>
						</div>
						<div class="selDiv">반찬3:
							<select name="side3" id="side3" class="select">
								<option value="n">======선택======</option>
								  <c:forEach items="${list }" var="vo">
								  	<c:if test="${vo.lunch_type eq 'side'}">
								  		  <option value="${vo.lunch_price}"  data-name="${vo.lunch_name }"
								  		  		 data-num="${vo.lunch_num }" >${vo.lunch_name }(${vo.lunch_price}원)</option>
								  	</c:if>
								  </c:forEach>
							</select>
						</div>
						<hr class="count">
						<div class="div_text count">수량: <input type="button" class="btn btn-light" value="-" id="btnSub"/>
							<input class="text-center" name="buy_count" type="text" value="1" style="width: 50px;" id="pdt_count" readonly="readonly" />
							<input type="button" class="btn btn-light" value="+" id="btnAdd"/>
						</div>
						<hr>
						<div class="div_text">총 상품 가격: <span id="span_pdt_price"></span>원 (<span id="span_pdt_count">1</span>개)</div>
						<hr>
						<div style="font-size: 45px;"> 
							<input type="button" class="btn btn-light" value="구매하기" id="bntBuy"/>
						</div>
				</form>				
				</div>
			</div>
			<div class="col-md-12 text-center" style="margin-top: 20px;">
				<table class="table" id="detail_img"> 
					<tr>
						<td style="font-size: 30px;background: #eee"><a 
						style="color:  gray;" href="#detail_img">상세보기 이미지</a></td>
					</tr>
				</table>
			</div>
			<div class="col-md-12 text-center">
				<img src="../images/myDetail.jpg"
					alt="상세보기 이미지" class="img-fluid" />
			</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>