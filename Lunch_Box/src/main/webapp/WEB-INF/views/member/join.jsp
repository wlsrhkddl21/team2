<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
	
<script>
// $(document).ready(function(){
// 	$("#btnSubmit").click(function(){
// 		location.href = "/lb/login";
// 	});
// });
</script>

	<!-- contact -->
	<section class="contact py-5" id="contact">
		<div class="container">
			<h3 class="title-w3ls text-center text-bl mb-5">회원 가입</h3>
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-8 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<h4 class="mb-4 sec-title-w3 let-spa text-bl">Send us a message</h4>
						<form action="/lb/joinPost" method="post">
							<div class="row">
								<div class="col-sm-6 form-group pr-sm-1">
									<input id="mem_name"class="form-control" type="text" name="mem_name" placeholder="Name" required="">
								</div>
								<div class="col-sm-6 form-group pl-sm-1">
									<input id="mem_id" class="form-control" type="email" name="mem_id" placeholder="Email"
										>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6 form-group pr-sm-1">
									<input id="mem_pass" class="form-control" type="password" name="mem_pass" placeholder="Password" >
								</div>
								<div class="col-sm-6 form-group pl-sm-1">
									<input id="mem_passCheck" class="form-control" type="password" name="mem_passCheck" placeholder="PasswordCheck"
										>
								</div>
							</div>
							
							<div class="form-group">
								<input id="mem_address" class="form-control" type="text" name="mem_address" placeholder="Address"
									>
							</div>
							<div class="form-group">
								<input id="mem_tel" class="form-control" type="text" name="mem_tel" placeholder="Phone Number"
									>
							</div>
							
							<div class="input-group1 text-right">
								<button class="btn" type="submit" id="btnSubmit">Submit</button>
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