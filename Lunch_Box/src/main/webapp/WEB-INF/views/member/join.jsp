<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<style>

.btn_box {
	display: inline-block;
	overflow: hidden;
	text-align: center;
	vertical-align: top;
	margin: 0;
	padding: 0 10px;
	outline: 0;
	font-weight: 400;
	cursor:pointer;
}
/* .black { */
/* 	border: 1px solid #333; */
/* 	color: #fff; */
/* 	background: #333; */
/* } */
/* .middle { */
/* 	height: 30px; */
/* 	line-height: 30px; */
/* } */
 #btnCheck { 
 	    position: absolute;
 	    height: 44px; 
/*     right: 0; */
/*     top: 0; */
/*     height: 34px; */
/*     padding: 0 13px; */
/*     font-weight: bold; */
/*     line-height: 35px; */
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
		$("#btnCheck").click(function() {
			var mem_id = $("#mem_id").val();
			sData = {
					"mem_id" : mem_id,
					"isCheck" : isCheck
			};
			$.ajax({
					url : "/lb/idCheck",
					type : "post",
					data : sData,
					success : function(rData) {
						alert(rData.msg);
						if (rData.isCheck == "true") {
							isCheck = true;
						}
					}
			});
		});
		$("#mem_id").change(function() {
			isCheck = false;
		});
		// 아이디 체크 끝 
		
		// 회원 가입
		
		$("#btnSubmit").click(function(e) {
			e.preventDefault();
			$.ajax({
				type : "post",
				url : "/lb/joinCheck",
				data : {
					"mem_id" : $("#mem_id").val(),
					"mem_pass" : $("#mem_pass").val(),
					"mem_pass2" : $("#mem_pass2").val(),
					"isCheck" : isCheck
				},
				success : function(data) {
					if (data == "success") {
						alert("회원가입성공");
						$("#joinForm").submit();
					} else if (data == "fail") {
						alert("비밀번호가 일치하지 않습니다");
					}
					if (data == "msgCheck") {
						alert("이메일 중복체크를 해주세요");
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
					<form id="joinForm" action="/lb/joinPost" method="post">
							<div class="form-group">
							<input id="mem_name" class="form-control" type="text"
								name="mem_name" placeholder="이름"  required/>
						</div>
							<div class="form-group">
							<p><input id="mem_id" class="form-control" type="text" placeholder="이메일(아이디)" 
								name="mem_id" style="width: 86%; display: initial;"/>
								<span class="box_btn"><button id="btnCheck" class="btn btn-outline-dark">중복체크</button></span></p>
						</div>
						
							<div class="form-group">
							<input id="mem_pass" class="form-control" type="password"
								name="mem_pass" placeholder="비밀번호"  required/>
						</div>
							<div class="form-group">
							<input id="mem_pass2" class="form-control" type="password"
								name="mem_pass2" placeholder="비밀번호 확인"  required/>
						</div>
						

						<div class="form-group">
							<input id="mem_address" class="form-control" type="text"
								name="mem_address" placeholder="주소"  required/>
						</div>
						<div class="form-group">
							<input id="detailAddress" class="form-control" type="text"
								name="detailAddress" placeholder="상세주소"  required/>
						</div>
						<div class="form-group">
							<input id="mem_tel" class="form-control" type="text"
								name="mem_tel" placeholder="전화번호"  required/>
						</div>
						<div class="input-group1 text-right">
							<button  type="submit" id="btnSubmit">가입하기</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 map"></div>
		</div>
	</div>
</section>




<%@ include file="../include/footer.jsp"%>