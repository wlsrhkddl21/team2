<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<script>

</script>	

	<!-- contact -->
	<section class="contact py-5" id="contact">
		<div class="container">
			<h3 class="title-w3ls text-center text-bl mb-5">회원 로그인</h3>
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-8 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<form action="/lb/loginPost" method="post">
							
							<div class="form-group">
								<input id="mem_id" class="form-control" type="text" name="mem_id" placeholder="이메일(아이디)"
									required="">
							</div>
							<div class="form-group">
								<input id="mem_pass" class="form-control" type="password" name="mem_pass" placeholder="비밀번호"
									required="">
							</div>
							
							<div class="input-group1 text-right">
								<button id="btnLogin" class="btn" type="submit">로그인 하기</button>
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