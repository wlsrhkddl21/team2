<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<style>
.mypage_info {
	padding: 35px;
	border: 5px solid #ededed;
	margin-top: 20px;
}
.disnone{
	display: none;
}
</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	$(".updateTxt").attr("readonly",true);
	$("#mem_address").click(function() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#mem_address").val(data.address);
			}
		}).open();
	});
	$("#btnUpdate").click(function(){
		$(".disnone").show();
		$(".updateTxt").attr("readonly",false);
		$("#mem_address").attr("disabled",false);
		$(this).hide();
		$("#mem_pass").val("");
		$("#mem_pass2").val("");
	});
	
	$("#btnCancel").click(function(){
		$(".disnone").hide();
		$(".updateTxt").attr("readonly",true);
		$("#mem_address").attr("disabled",true);
		$("#btnUpdate").show();
	});
	
	$("#btnSubmit").click(function(){
		var mem_pass = $("#mem_pass").val();
		var mem_pass2 =  $("#mem_pass2").val();
		if(mem_pass!=mem_pass2||mem_pass==""||mem_pass2==""){
			alert("비밀번호를 확인하세요.");
		}else if(mem_pass==mem_pass2&&mem_pass!=""){
			$("#memUpdate").submit();
			alert("수정완료");
		}
	});
});
</script>
<c:remove var="msg" scope="session" />
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div style="height: 20px;"></div>
			<h3 class="title-w3ls text-center text-bl mb-5">My page</h3>
			<div class="row">
				<div class="col-md-3">
					<div style="height: 20px;"></div>
					<%@ include file="../include/myMenu.jsp"%>
				</div>
				<div class="col-md-9">
						<div class="mypage_info" style="width: 700px;">
						<h4 style="margin-bottom: 15px; text-align:center;">내 정보 변경</h4>
						<section class="contact py-5" id="contact">
	<div class="container">
		<div class="row mx-sm-0 mx-2" id="divJoin">
			<div class="col-lg-2 map"></div>
			<div class="col-lg-8 main_grid_contact">
				<div class="form-w3ls p-md-5 p-4">
					<form id="memUpdate" action="/mp/memUpdate" method="post">
						<div class="form-group">
						<label for="mem_name">이름</label>
						<input id="mem_name" class="form-control" type="text"
							name="mem_name" placeholder="Name"  readonly="readonly"
							value="${memVo.mem_name }" disabled="disabled"/>
						</div>
						
						<div class="form-group">
						<label for="mem_id">이메일(아이디)</label>
							<input id="mem_id" class="form-control" type="text" 
							placeholder="Email" name="mem_id" readonly="readonly"
							value="${memVo.mem_id }" disabled="disabled"/>
						</div>
						
						<div class="form-group">
						<label for="mem_pass">비밀번호</label>
							<input id="mem_pass" class="form-control updateTxt" type="password"
							name="mem_pass" placeholder="Password"  value="*******" required/>
						</div>
							<div class="form-group disnone">
							<label for="mem_name">비밀번호 확인</label>
							<input id="mem_pass2" class="form-control updateTxt" type="password"
								name="mem_pass2" placeholder="Password Check" value="*******" required/>
						</div>
						

						<div class="form-group">
						<label for="mem_name">주소</label>
							<input id="mem_address" class="form-control updateAd" type="text"
								name="mem_address" placeholder="Address"  required 
								disabled="disabled" value="${memVo.mem_address }"/>
						</div>
						<div class="form-group disnone">
						<label for="mem_name">상세주소</label>
							<input id="mem_detailAddress" class="form-control" type="text"
								name="mem_detailAddress" placeholder="Detailed Address"  required/>
						</div>
						<div class="form-group">
						<label for="mem_name">전화번호</label>
							<input id="mem_tel" class="form-control updateTxt" type="text"
								name="mem_tel" placeholder="Phone Number" value="${memVo.mem_tel }"
								 required/>
						</div>
						<div class="input-group1 text-right">
							<button type="button" id="btnUpdate">수정</button>
							<button type="button" class="disnone" id="btnSubmit">완료</button>
							<button type="button" class="disnone" id="btnCancel">취소</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-lg-2 map"></div>
			<!-- //contact form -->
		</div>
	</div>
</section>
						</div>
				</div>
				<div class="col-md-2" style="height: 600px;"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>