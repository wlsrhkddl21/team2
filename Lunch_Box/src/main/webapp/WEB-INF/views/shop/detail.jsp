<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<style>
	.div_text{
		font-size: 18px;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-4">
				<div style="height: 30px;"></div>
					<img src="../../images/test1.jpg" alt=" " class="img-fluid"
						style="height: 380px; width: 380px;" />
				</div>
				<div class="col-md-8">
				<div style="height: 30px;"></div>
					<h1 style="color: #fd5c63;">${productVo.pdt_name}</h1>
					<hr>
					<p>${productVo.pdt_category }</p>
					<b style="font-size: 25px;">판매가: <fmt:formatNumber
							value="${productVo.pdt_price }" type="number" />원</b>
					<div class="div_text">배송비 : 2,500원 (5만원 이상 무료)</div>
					<div class="div_text">적립금 : 5%</div>
					<div class="div_text">수량: <input type="button" class="btn btn-light" value="-" id="btnSub"/>
								<input type="text" value="1" style="width: 50px;" />
								<input type="button" class="btn btn-light" value="+" id="btnAdd"/>
					</div>
					<hr>
					<div class="div_text">총 상품 가격: 1원 (1개)</div>
					<hr>
					<div style="font-size: 45px;"> 
						<input type="button" class="btn btn-light" value="장바구니 담기" id="bntCart"/>
						<input type="button" class="btn btn-light" value="구매하기" id="bntBuy"/>
					</div>
								
				</div>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>