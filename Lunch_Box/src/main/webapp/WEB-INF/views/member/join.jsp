<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<style>
#idCheck {
	height: 44px;
}
.rOnly {
	readonly : readonly;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var msg = "${msg}";
		var isCheck = false;
		$("#mem_address").click(function() {
			
			new daum.Postcode({
				oncomplete : function(data) {
					$("#mem_address").val(data.address);
				}
			}).open();
		});
		
		// 아이디 체크
		$("#btnCheck").on("click", function(e){
			e.preventDefault();
			$.ajax({
				type : "post",
				url  : "/lb/idCheck",
				data : {
					"mem_id" : $("#mem_id").val()
				},
				success : function(data) {
					if ($.trim(data) == 0) {
						alert("사용 가능한 아이디");
						isCheck = true;
						$("#mem_id").addClass("rOnly");
					} else if ($.trim(data) == 2) {
						alert("아이디를 입력 해주세요.");
						isCheck = false;
					} else {
						alert("사용중인 아이디입니다.");
						isCheck = false;
					}
				}
			});
		});
		
		// 회원 가입
		
		$("#btnSubmit").click(function(e) {
			e.preventDefault();
			console.log("클릭");
			$.ajax({
				type : "post",
				url : "/lb/joinPost",
				data : {
					"mem_id" : $("#mem_id").val(),
					"mem_pass" : $("#mem_pass").val(),
					"mem_pass2" : $("#mem_pass2").val(),
					"isCheck" : isCheck
				},
				success : function(data) {
					console.log(data);
					if (msg == "succees") {
						alert("회원가입을 축하합니다");
					} else {
						alert("비밀번호가 일치하지 않습니다");
					}
				}
			});
		});
		
	});
</script>

<!-- contact -->
<section class="contact py-5" id="contact">
	<div class="container">
		<h3 class="title-w3ls text-center text-bl mb-5">회원 가입</h3>
		<div class="row mx-sm-0 mx-2" id="divJoin">
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
								name="mem_name" placeholder="Name"  required/>
						</div>
							<div class="form-group">
							<p><input id="mem_id" class="form-control rOnly" type="text", 
								name="mem_id" placeholder="Email" style="width: 86%; display: initial;" required/>
								<button id="btnCheck">중복확인</button></p>
						</div>
						
						
							<div class="form-group">
							<input id="mem_pass" class="form-control" type="text"
								name="mem_pass" placeholder="Password"  required/>
						</div>
							<div class="form-group">
							<input id="mem_pass2" class="form-control" type="text"
								name="mem_pass2" placeholder="Password Check"  required/>
						</div>
						

						<div class="form-group">
							<input id="mem_address" class="form-control" type="text"
								name="mem_address" placeholder="Address"  required/>
						</div>
						<div class="form-group">
							<input id="mem_tel" class="form-control" type="text"
								name="mem_tel" placeholder="Phone Number"  required/>
						</div>

						<div class="input-group1 text-right">
							<button  type="submit" id="btnSubmit">Submit</button>
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