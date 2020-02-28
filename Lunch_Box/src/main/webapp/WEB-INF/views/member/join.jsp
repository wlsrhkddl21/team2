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
 } 
#emailCheck {
	position: absolute;
 	    height: 44px; 
}
 .emailNum { 
 	display : none; 
 } 
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.3.2/dist/email.min.js"></script>
<script>
$(document).ready(function() {
		 (function(){
		      emailjs.init("user_o01mn37kDwq2kIlCQI60H");
		 })();
		
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
							$(".emailNum").show();
						} else {
							$(".emailNum").hide();
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
			
			var mem_id = $('#mem_id').val();
			var mem_pass = $('#mem_pass').val();
			var mem_pass2 = $('#mem_pass2').val();
			var mem_name = $('#mem_name').val();
			var mem_address = $("#mem_address").val();
			var detailAddress = $("#detailAddress").val();
			var mem_tel	 = $("#mem_tel").val();
			if(mem_id==""||mem_pass==""||mem_pass2==""||mem_name==""||mem_address==""||mem_tel==""){
// 				console.log("");
				alert("필수 입력사항을 모두 입력해주세요.");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "/lb/joinCheck",
				data : {
					"mem_id" : mem_id,
					"mem_pass" : mem_pass,
					"mem_pass2" : mem_pass2,
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
		      
		$("#emailCheck").click(function(e) {
			e.preventDefault();
			var id = $("#mem_id").val();
			$.ajax({
				type : "post",
				url : "/lb/emailCheck",
				data : {
					"mem_id" : id
				},
				success : function(data) {
					var template_params = {
				    		   "email" : data.email,
				    		   "fname": "test",
				    		   "name": "test",
				    		   "notes": data.key
				    };
				    	var service_id = "gmail";
				    	var template_id = "template_DLlwZKOA";
				    	emailjs.send(service_id, template_id, template_params);
				}
			})
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
					<p>*는 필수 입력 사항입니다.</p><br>
					<form id="joinForm" action="/lb/joinPost" method="post">
							<div class="form-group">
							<input id="mem_name" class="form-control" type="text"
								name="mem_name" placeholder="이름*"  required/>
						</div>
							<div class="form-group">
							<p><input id="mem_id" class="form-control" type="text" placeholder="이메일(아이디)*" 
								name="mem_id" style="width: 85%; display: initial;" required/>
								<span class="box_btn"><button id="btnCheck" class="btn btn-outline-dark">중복체크</button></span></p>
						</div>
						
							<div class="form-group emailNum">
							<p><input id="emailNum" class="form-control" type="text" placeholder="인증번호*" 
								name="emailNum" style="width: 79%; display: initial;"/>
								<span class="box_btn"><button id="emailCheck" class="btn btn-outline-dark">인증번호 받기</button></span></p>
						</div>
						
							<div class="form-group">
							<input id="mem_pass" class="form-control" type="password"
								name="mem_pass" placeholder="비밀번호*"  required/>
						</div>
							<div class="form-group">
							<input id="mem_pass2" class="form-control" type="password"
								name="mem_pass2" placeholder="비밀번호 확인*"  required/>
						</div>
						

						<div class="form-group">
							<input id="mem_address" class="form-control" type="text"
								name="mem_address" placeholder="주소*"  required/>
						</div>
						<div class="form-group">
							<input id="detailAddress" class="form-control" type="text"
								name="detailAddress" placeholder="상세주소"  required/>
						</div>
						<div class="form-group">
							<input id="mem_tel" class="form-control" type="text"
								name="mem_tel" placeholder="전화번호*"  required/>
						</div>
						</div>
						<div class="input-group1 text-right">
							<button  type="submit" id="btnSubmit">가입하기</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 map"></div>
		</div>
	
</section>




<%@ include file="../include/footer.jsp"%>