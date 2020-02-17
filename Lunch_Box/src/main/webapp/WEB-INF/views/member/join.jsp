<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$("#mem_address").click(function() {
			
			new daum.Postcode({
				oncomplete : function(data) {
					$("#mem_address").val(data.address);
				}
			}).open();
		});
		
		$("#btnSubmit").click(function(e){
			var mem_pass = $("#mem_pass").val();
			var mem_passCheck = $("#mem_passCheck").val();
			console.log(mem_pass);
			console.log(mem_passCheck);
			if (mem_pass != mem_passCheck) {
				alert("비밀번호가 일치하지 않습니다");
				e.preventDefault();
			} else {
				alert("회원가입을 축하드립니다");
				$("#joinForm").submit();
			}
			
		});
		
	});
</script>

<!-- contact -->
<section class="contact py-5" id="contact">
	<div class="container">
		<h3 class="title-w3ls text-center text-bl mb-5">회원 가입</h3>
		<div class="row mx-sm-0 mx-2">
			<!-- map -->
			<div class="col-lg-2 map"></div>
			<!-- //map -->
			<!-- contact form -->
			<div class="col-lg-8 main_grid_contact">
				<div class="form-w3ls p-md-5 p-4">
					<h4 class="mb-4 sec-title-w3 let-spa text-bl">Send us a
						message</h4>
					<form id="joinForm" action="/lb/joinPost" method="post">
						
							<div class="form-group">
							<input id="mem_name" class="form-control" type="text"
								name="mem_name" placeholder="Name">
						</div>
							<div class="form-group">
							<p><input id="mem_id" class="form-control" type="text"
								name="mem_id" placeholder="Email"><button>중복확인</button></p>
						</div>
						
						
							<div class="form-group">
							<input id="mem_pass" class="form-control" type="text"
								name="mem_pass" placeholder="Password">
						</div>
							<div class="form-group">
							<input id="mem_pass2" class="form-control" type="text"
								name="mem_pass2" placeholder="Password Check">
						</div>
						

						<div class="form-group">
							<input id="mem_address" class="form-control" type="text"
								name="mem_address" placeholder="Address">
						</div>
						<div class="form-group">
							<input id="mem_tel" class="form-control" type="text"
								name="mem_tel" placeholder="Phone Number">
						</div>

						<div class="input-group1 text-right">
							<button class="btn" type="submit" id="btnSubmit">Submit</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 map"></div>
			<!-- //contact form -->
		</div>
	</div>
</section>
<!-- //contact -->




<%@ include file="../include/footer.jsp"%>