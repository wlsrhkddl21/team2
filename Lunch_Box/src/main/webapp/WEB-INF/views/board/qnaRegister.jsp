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
		$("#frmList").attr("action", "/board/qna");
		$("#frmList").submit();
	});
	
	// submit버튼
	$("#btnSubmit").click(function(){
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
		<h3 class="title-w3ls text-center text-bl mb-5">문의하기</h3>
	<form id="frmList" action="/board/qna">
		<input type="hidden" name="page" value="${pagingDto.page }"/>
		<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
	</form>
	<div class="row">
		<div class="col-md-12 main_grid_contact">
			<!--  action 을 생략하면 현재경로 : /board/qnaRegister -->
			<form role="form" method="post" id="registerForm" style="padding:30px">
				<input type="hidden" name="page" value="${pagingDto.page }"/>
				<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
				<input type="hidden" name="qna_writer" value="${mem_id }"/>
				<div class="form-group">
					<label for="qna_title">Title</label>
					<input type="text" class="form-control" id="qna_title" 
						name="qna_title"/>
				</div>
				<div class="form-group">
					<label for="qna_conetent">Content</label>
					<textarea class="form-control" rows="5" id="qna_content" 
						name="qna_content"></textarea>
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