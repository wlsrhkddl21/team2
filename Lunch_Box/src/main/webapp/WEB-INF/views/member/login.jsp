<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
	var msg = "${msg}";
	if (msg == "실패") {
		alert("로그인 실패");
	}
	if (msg == "성공") {
		alert("로그인 성공");
	}
	
	$("#btnLogin").click(function(e){
		
	});
});
</script>	

	<!-- contact -->
	<section class="contact py-5" id="contact">
		<div class="container">
			<h3 class="title-w3ls text-center text-bl mb-5">로그인</h3>
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-8 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<h4 class="mb-4 sec-title-w3 let-spa text-bl">로 그 인 폼</h4>
						<form action="/lb/loginPost" method="post">
							
							<div class="form-group">
								<input id="mem_id" class="form-control" type="email" name="mem_id" placeholder="Email"
									required="">
							</div>
							<div class="form-group">
								<input id="mem_pass" class="form-control" type="text" name="mem_pass" placeholder="Password"
									>
							</div>
							
							<div class="input-group1 text-right">
								<button id="btnLogin" class="btn" type="submit">Submit</button>
							</div>
						</form>
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