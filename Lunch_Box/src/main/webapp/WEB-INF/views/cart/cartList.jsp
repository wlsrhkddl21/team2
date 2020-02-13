<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
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
						<input type="text" id="mem_id" placeholder="id"/>
						<input type="text" id="pdt_num" placeholder="상품번호"/>
						<input type="text" id="cart_count" placeholder="갯수"/>
						<input id="addBtn" type="button" value="추가"/>
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
						<form id="cartForm" action="#" method="POST">
						<input type="hidden" name="mem_id">
						<input type="hidden" name="pdt_num">
						<input type="hidden" name="cart_count">
						<div>
							<table border="1">
								<thead>
									<tr>
										<th>체크</th>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo">
										<tr>
											<td>체크</td>
											<td>${vo.pdt_name}</td>
											<td>${vo.pdt_price}</td>
											<td>${vo.cart_count}</td>
										</tr>
									</c:forEach>
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