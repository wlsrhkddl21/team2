<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/buyStyle.jsp"%>
<style>

.btn-outline-light{
	font-size: 20px;
	margin: 15px;
	padding: 15px;
	padding-left:15px;
	padding-right:15px;
	font-weight: 600;
}
</style>
<script>
	$(function(){
		
		$("#btnHome").click(function(){
			location.href="/";
			console.log("클릭");
		});
		$("#btnBuyList").click(function(){
			location.href="/mp/buyList";
		});
		
	});

</script>
<div class="container-fluid">
	<!--구매 페이지 -->
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
									<h3 class="mb-4 sec-title-w3 let-spa text-bl">주문 완료</h3>
									<div class="process">
										<ol>
											<li><span class="num">1</span>장바구니</li>
											<li><span class="num">2</span>주문서 작성/결제</li>
											<li><span class="num selected">3</span>주문 완료</li>
										</ol>
									</div>
								</div>
							</div>
							<div class="form-w3ls p-md-5 p-4">
								<table class="table">
									<tr>
										<th height="100px"
											style="font-size: 30px; font-weight: 800; align-content: center;">
											<div style="margin-top: 15px;">주문이 성공적으로 완료 되었습니다.</div>
										</th>
									</tr>
								</table>
								<div class="text-center">
									<button class="btn btn-outline-light" id="btnHome" type="button" style="background: #fd5c63;">홈
										으로</button>
									<button class="btn btn-outline-light" id="btnBuyList" type="button" style="background: #fd5c63;">주문
										내역</button>
								</div>
							</div>
						</div>
						<div class="col-lg-2 map" style="margin-bottom: 300px;"></div>
						<!-- //contact form -->
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<div class="col-md-2"></div>

<%@ include file="../include/footer.jsp"%>