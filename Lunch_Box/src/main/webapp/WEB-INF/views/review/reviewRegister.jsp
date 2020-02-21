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
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0  0;}
.starR2.on{background-position:-15px 0;}
</style>
<script>
$(document).ready(function(){
	$("#btnSubmit").click(function(){
		location.href = "/review/reviewBoard";
	});
	$("#btnFile").click(function(){
		("#pdt_image").trigger("click");
	});
});
</script>
<div class="container-fluid">

<!-- 	<form id="frmPage" action="/review/reviewBoard" method="get"> -->
<!-- 		<input type="hidden" name="rev_num"/> -->
<!-- 		<input type="hidden" name="page"  -->
<%-- 			value="${pagingDto.page }"/> --%>
<!-- 		<input type="hidden" name="perPage" -->
<%-- 			value="${pagingDto.perPage }"/> --%>
<!-- 	</form> -->
<!-- 	<form id="frmRead" action="/review/reviewBoard" method="get"> -->
<!-- 		<input type="hidden" name="rev_num"/> -->
<!-- 		<input type="hidden" name="page"  -->
<%-- 			value="${pagingDto.page }"/> --%>
<!-- 		<input type="hidden" name="perPage" -->
<%-- 			value="${pagingDto.perPage }"/> --%>
<!-- 	</form> -->
	
	
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
						<form action="/review/reviewRegister" method="post" enctype="multipart/form-data">
							
							<div class="form-group">
								<label>제목</label>
								<input id="rev_title" class="form-control" type="text" name="rev_title">
							</div>
							<div class="form-group">
								<label>글내용</label>
								<input id="rev_content" class="form-control" type="text" name="rev_content">
							</div>
							<div class="form-group">
								<label>상품명</label>
								<select name=rev_pdt_name class="form-control">
									<option selected value="안심스테이크 도시락">안심스테이크 도시락</option>
									<option  value="찹스테이크 도시락">찹스테이크 도시락</option>
									<option value="그랜드 소불고기 & 전복도시락">그랜드 소불고기 & 전복도시락</option>
									<option value="장어구이 도시락">장어구이 도시락</option>
								</select>
<!-- 								<input id="rev_content" class="form-control" type="select option" name="rev_content"> -->
							</div>
							
							<div class="form-group">
							
									<button type="button" class="btn btn-primary" id="btnFile">사진 첨부</button>
							<input type="file" class="form-control-file" id="pdt_image" name="file" style="display:none;"/>
							
							</div>
							
							<div class="input-group1 text-right">
								<button id="btnSubmit" class="btn" type="submit">Submit</button>
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