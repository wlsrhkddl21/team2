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
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
});
</script>
<div class="container-fluid">

	<form id="frmPage" action="/review/reviewBoard" method="get">
		<input type="hidden" name="rev_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	<form id="frmRead" action="/review/reviewBoard" method="get">
		<input type="hidden" name="rev_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	
	<section class="contact py-5" id="contact">
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
						<form action="/review/reviewRegister" method="post">
							
							<div class="form-group">
								<label>제목</label>
								<input id="rev_title" class="form-control" type="text" name="rev_title">
							</div>
							<div class="form-group">
								<label>글내용</label>
								<input id="rev_content" class="form-control" type="text" name="rev_content">
							</div>
							<!-- 별점 -->
							<label>만족도</label>
							<div class="starRev">
								<span class="starR1 on">별1_왼쪽</span>
								<span class="starR2">별1_오른쪽</span>
								<span class="starR1">별2_왼쪽</span>
								<span class="starR2">별2_오른쪽</span>
								<span class="starR1">별3_왼쪽</span>
								<span class="starR2">별3_오른쪽</span>
								<span class="starR1">별4_왼쪽</span>
								<span class="starR2">별4_오른쪽</span>
								<span class="starR1">별5_왼쪽</span>
								<span class="starR2">별5_오른쪽</span>
							</div>
							<!-- /별점 -->	
							<div class="input-group1 text-right">
								<button id="btnLogin" class="btn" type="submit">Submit</button>
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