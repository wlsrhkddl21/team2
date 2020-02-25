<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
#fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dashed blue;
	background-color: yellow;
	margin: auto;
}
#buttonDiv {
	clear :both;
}
#uploadedList > div {
	float : left;
	margin : 20px;	
}
</style>
<script>
$(function(){
	$("#btnList").click(function(){
		$("#frmList").attr("action", "/board/faq");
		$("#frmList").submit();
	});
	
	// submit버튼
	$("#btnSubmit").click(function(){
// 		var upDiv = $("#uploadedList > div");
// 		upDiv.each(function(index){
// 			var fileName = $(this).attr("data-filename");
// 			console.log("fileName:" + fileName);
// 			var hiddenInput = "<input type='hidden' name='files["+index+"]'"+
// 							  "value='" + fileName + "'/>";
// 			$("#registerForm").prepend(hiddenInput);
// 		});
		$("#registerForm").submit();  //폼전송
	});
});

</script>
<div class="container-fluid">
${pagingDto }
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div style="height: 20px"></div>
		<h3 class="title-w3ls text-center text-bl mb-5">자주하는질문 작성</h3>
	<form id="frmList" action="/board/faq">
		<input type="hidden" name="page" value="${pagingDto.page }"/>
		<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
	</form>
	<div class="row">
		<div class="col-md-12 main_grid_contact">
			<!--  action 을 생략하면 현재경로 : /board/register -->
			<form role="form" method="post" id="registerForm" style="padding:30px" action="faqRegister2">
				<input type="hidden" name="page" value="${pagingDto.page }"/>
				<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
				<input type="hidden" name="faq_writer" value="${mem_id }"/>
				<div class="form-group">
					<label for="faq_title">Title</label>
					<input type="text" class="form-control" id="faq_title" 
						name="faq_title"/>
				</div>
				<div class="form-group">
					<label for="faq_conetent">Content</label>
					<textarea class="form-control" rows="5" id="faq_content" 
						name="faq_content"></textarea>
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<label for="not_writer">writer</label> -->
<!-- 					<input type="text" class="form-control" id="not_writer"  -->
<!-- 						name="not_writer" /> -->
<!-- 				</div> -->
				<div class="form-group" id="buttonDiv">
				<button type="button" class="btn btn-primary" id="btnSubmit">
					Submit
				</button>
				<button type="button" class="btn btn-primary" id="btnList">
					List All
				</button>
				</div>
			</form>
		</div>
	</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>