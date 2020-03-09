<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
<style>
 .page-item.active .page-link {
    z-index: 1;
    color: #000 ;
    background-color: #e0e0eb;
    border-color: #e0e0eb;
}
.not_title {
	cursor: pointer;
}

</style>
<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
// 		location.href = "/review/reviewBoard";
		$("#registForm").submit(); 
		console.log("클릭됨");
	});
// 	$("#btnFile").click(function(){
// 		("#pdt_image").trigger("click");
// 	});
});
</script>
<div class="container-fluid">
		
	<section  class="contact py-5" id="contact" >
		<div class="container">
			<h3 class="title-w3ls text-center text-bl mb-5">리뷰작성</h3>
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-8 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<form id="registForm" action="/review/reviewInsert" method="post" enctype="multipart/form-data">
							<input type="hidden" name="buy_num" value="${buy_num }"> 
							<div class="form-group">
								<label>리뷰 제목</label>
								<input id="rev_title" class="form-control" 
									type="text" name="rev_title">
							</div>
							<div class="form-group">
								<label>리뷰 내용</label>
								<textarea rows="5" id="rev_content" class="form-control"
									name="rev_content"></textarea>
							</div>
							<div class="form-group">
								<label>작성자</label>
								<input id="rev_writer" value="${mem_id}"class="form-control" type="text" name="rev_writer" readonly>
							</div>
							<div class="form-group">
								<label>상품명</label>
								<select name="rev_pdt_name" id="rev_pdt_name"class="form-control">
								<c:forEach items="${list}" var="list">
									<option value="${list.pdt_num}">${list.pdt_name}</option>
								</c:forEach>
								</select>
							</div>
								
								
								<div class="form-group">
								<label>사진첨부</label>
								<input id="rev_image" class="form-control" type="file" name="file">
							</div>	
								
								
							
<!-- 							<div class="form-group"> -->
							
<!-- 									<button type="button" class="btn btn-primary" id="btnFile">사진 첨부</button> -->
<!-- 							<input type="file" class="form-control-file" id="pdt_image" name="file" /> -->
							
<!-- 							</div> -->
							
							<div class="input-group1 text-right">
								<button id="btnSubmit" class="btn btn-outline-dark" type="submit">작성 완료</button>
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
	</div>
<%@ include file="../include/footer.jsp" %>