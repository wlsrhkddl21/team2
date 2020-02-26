<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<style>
	.div_text{
		font-size: 18px;
	}
	.margin_self{
		margin-left: 1253px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		var mem_id = "${sessionScope.mem_id}";
		console.log(mem_id);
		
		$("#btnSub").click(function(){
			var elCount = $("input[name=buy_count]");
			var count = elCount.val();
			var pdt_price = ${productVo.pdt_price};
			console.log("수량 빼기"+count);
			if(count > 1){
				count --;
				elCount.val(count);
				$("#span_pdt_count").text(count);	
				$("#span_pdt_price").text(count*pdt_price);	
			}else{
				return;
			}
		});
		$("#btnAdd").click(function(){
			var elCount = $("input[name=buy_count]");
			var count = elCount.val();
			var pdt_price = ${productVo.pdt_price};
			count ++;
			elCount.val(count);
			$("#span_pdt_count").text(count);
			$("#span_pdt_price").text(count*pdt_price);	
		});
		$("#bntCart").click(function(e) {
			e.preventDefault();
			var count = $("#pdt_count").val();
			if (mem_id != "") {
				location.href="/cart/insert/"+"${productVo.pdt_num}"+"/"+count;
			} else {
				alert("로그인이 필요합니다.");
				location.href="/lb/login";
			}
		});
		
		$("#bntBuy").click(function(){

			if(mem_id == ""){
				console.log("아이디없음");
				 alert("결제는 로그인 후에 이용할 수 있습니다.");
			}else{
				$("#buy_form").submit();
			}
		});
		
	});
</script>
<div class="container-fluid" id="long" data-long="short">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<%@ include file="../include/recentListDiv.jsp"%>
			<div class="row">
				<div class="col-md-4">
				<div style="height: 30px;"></div>
					<img src="/admin/displayFile?fileName=${productVo.pdt_image}" alt="상품이미지" class="img-fluid"
						style="height: 380px; width: 380px;" />
				</div>
				<div class="col-md-8">
				<form action="/shop/buy" method="post" id="buy_form">
				<input type="hidden" name="pdt_num" value="${productVo.pdt_num }"/> 
					<div style="height: 30px;"></div>
						<h1 style="color: #fd5c63;">${productVo.pdt_name}</h1>
						<hr>
						<p>${productVo.pdt_category }</p>
						<b style="font-size: 25px;">판매가: <fmt:formatNumber
								value="${productVo.pdt_price }" type="number" />원</b>
						<div class="div_text">배송비 : 2,500원 (5만원 이상 무료)</div>
						<div class="div_text">적립금 : 구매 금액의 5%</div>
						<div class="div_text">수량: <input type="button" class="btn btn-light" value="-" id="btnSub"/>
									<input name="buy_count" type="text" value="1" style="width: 50px;" id="pdt_count" />
									<input type="button" class="btn btn-light" value="+" id="btnAdd"/>
						</div>
						<hr>
						<div class="div_text">총 상품 가격: <span id="span_pdt_price">${productVo.pdt_price }</span>원 (<span id="span_pdt_count">1</span>개)</div>
						<hr>
						<div style="font-size: 45px;"> 
							<input type="button" class="btn btn-light" value="장바구니 담기" id="bntCart"/>
							<input type="button" class="btn btn-light" value="구매하기" id="bntBuy"/>
						</div>
				</form>				
				</div>
			</div>
			<div class="col-md-12 text-center" style="margin-top: 20px;">
				<table class="table" id="detail_img"> 
					<tr>
						<td style="font-size: 30px;"><a 
						style="color:  gray;" href="#detail_img">상세보기 이미지</a></td>
						<td style="font-size: 30px;"><a href="#review" style="color:  gray;">리뷰 게시판</a></td>
					</tr>
				</table>
			</div>
			<div class="col-md-12 text-center">
				<img src="/admin/displayFile?fileName=${productVo.pdt_subimage}"
					alt="상세보기 이미지" class="img-fluid" />
			</div>
			<div class="col-md-12 text-center">
				<table class="table" id="review"> 
					<tr>
						<td style="font-size: 30px;"><a 
						style="color: gray;" href="#detail_img">상세보기 이미지</a></td>
						<td style="font-size: 30px;"><a href="/review/reviewBoard" style="color: gray;">리뷰 게시판</a></td>
					</tr>
				</table>
			</div>
			
			<!-- 리뷰게시판 -->
			<div class="col-md-12 ">		
				
				<form>
					
					<div class="form-group">
						<label for="repWriter">REVIEW</label>
							<input type="text" id="repWriter" value="${mem_id}"
								class="form-control" readonly/>
					</div>
					<div class="form-group">
						<label for="repContent">댓글내용</label>
							<input type="text" id="repContent"
								class="form-control"/>
					</div>
					
					<div class="form-group">
						<label>상품명</label>
							<select name="rev_pdt_name" id="rev_pdt_name"class="form-control">
								<c:forEach items="${list}" var="list">
									<option value="${list.pdt_num}">${list.pdt_name}</option>
								</c:forEach>
							</select>
					</div>
								
					<div class="form-group">
						<label>사진첨부</label>
							<input id="rev_image" class="form-control" type="file" name="file">
					</div>	
					
					<div class="form-group">
						<button type="button" class="btn-xs btn-success"
							id="btn_reply">작성완료</button>
					</div>
				</form>
			</div>
			<!-- 리뷰게시판 끝 -->
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>