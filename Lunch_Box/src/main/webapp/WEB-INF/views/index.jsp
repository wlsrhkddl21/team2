<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.support ul {
		text-align: left;
		padding: 10px;
	}
	.support h4 {
		padding: 20px;
		border-bottom: 1px solid #cacaca;
	}
	.support h4 a{
		color: inherit;
		font-weight: bold;
	}
	
	.support .col-lg-6 {
		padding-left: 30px;
		padding-right: 30px;
	}
	.support ul a{
		font-size: 15px;
		color: #a4a4a4;
	}
	.support ul a:hover{
		color: #fd5c63;
	}
	
</style>
<script>
$(function() {
	$(".not_title").click(function() {
		var num = $(this).attr("data-bno");
		$("#num").attr("name","not_num").val(num);
		$("#mainForm").attr("action","/board/ntRead");
		$("#mainForm").submit();
	});
	$(".faq_title").click(function() {
		var num = $(this).attr("data-bno");
		$("#num").attr("name","faq_num").val(num);
		$("#mainForm").attr("action","/board/faqRead");
		$("#mainForm").submit();
	});

});
</script>
<!-- 	banner slider -->
	<div id="homepage-slider" class="st-slider">
		<input type="radio" class="cs_anchor radio" name="slider" id="play1" checked="" />
		<input type="radio" class="cs_anchor radio" name="slider" id="slide1" />
		<input type="radio" class="cs_anchor radio" name="slider" id="slide2" />
		<input type="radio" class="cs_anchor radio" name="slider" id="slide3" />
		<div class="images">
			<div class="images-inner">
				<div class="image-slide">
					<div class="banner-w3ls-1">

					</div>
				</div>
				<div class="image-slide">
					<div class="banner-w3ls-2">

					</div>
				</div>
				<div class="image-slide">
					<div class="banner-w3ls-3">

					</div>
				</div>
			</div>
		</div>
		<div class="labels">
			<div class="fake-radio">
				<label for="slide1" class="radio-btn"></label>
				<label for="slide2" class="radio-btn"></label>
				<label for="slide3" class="radio-btn"></label>
			</div>
		</div>
	</div>
<!-- 	//banner slider -->
<!-- best menu -->
	<div class="gallery py-5" id="gallery">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title-w3ls text-bl mb-5">BEST MENU</h3>
			<div class="row no-gutters">
				<c:forEach items="${top3List}" var="vo">
				<div class="col-md-4 gallery-grid1">
					<p style="text-align: center;">${vo.pdt_name }</p>
					<a href="/shop/detail/${vo.pdt_num }">
						<img src="/admin/displayFile?fileName=${vo.pdt_image}" alt=" " class="img-fluid" />
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
<!-- recommend menu -->
	<div class="gallery py-5" id="gallery">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title-w3ls text-bl mb-5">RECOMMEND</h3>
			<div class="row no-gutters">
				<c:forEach items="${pdtList}" var="vo" begin="0" end="2">
				<div class="col-md-4 gallery-grid1">
					<p style="text-align: center;">${vo.pdt_name}</p>
					<a href="/shop/detail/${vo.pdt_num }">
						<img src="/admin/displayFile?fileName=${vo.pdt_image}" alt=" " class="img-fluid" />
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
<!-- Review -->
	<!-- 	gallery -->
	<div class="gallery py-5" id="gallery">
		<div class="container py-xl-5 py-lg-3">
			<h3 class="title-w3ls text-center text-bl mb-5">RECENT REVIEW</h3>
			<div class="row no-gutters">
				<c:forEach items="${reviewList}" var="list" begin="0" end="2" varStatus="num">
				<div class="col-md-4 gallery-grid1">
					<a href="#gal${num.count}">
						<img src="/review/displayFile?fileName=${list.rev_image}" alt=" " class="img-fluid" />
					</a>
				</div>
				</c:forEach>
			</div>
			<div class="row no-gutters">
				<c:forEach items="${reviewList}" var="list" begin="3" varStatus="num">
				<div class="col-md-4 gallery-grid1">
					<a href="#gal${num.count+3}">
						<img src="/review/displayFile?fileName=${list.rev_image}" alt=" " class="img-fluid" />
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
		<c:forEach items="${reviewList}" var="list" varStatus="num">
		<div id="gal${num.count}" class="pop-overlay animate">
			<div class="popup">
				<img src="/review/displayFile?fileName=${list.rev_image}" alt="Popup Image" class="img-fluid" />
				<p class="mt-4">${list.rev_content}
				</p>
				<a class="close" href="#gallery">&times;</a>
			</div>
		</div>
		</c:forEach>
	</div>
<!-- 	//gallery -->

<!-- 	support -->
	<form id="mainForm" action="" method="get">
		<input id="num" type="hidden" /> 
		<input type="hidden" name="page" value="1"/>
		<input type="hidden" name="perPage" value="10"/>
	</form>
	
	<div class="support py-2" id="support">
		<div class="container py-xl-5 py-lg-3">
			<div class="row support-bottom text-center mb-5">
				<div class="col-lg-6 support-grid mainNotice">
					<span class="fa fa-headphones"></span>
					<h4 class="title-w3ls text-center text-bl mb-3"><a href="/board/notice">공지사항</a></h4>
					<ul>
						<c:forEach items="${hotList}" var="list">
						<li><a href="#" data-bno="${list.not_num}" class="not_title">${list.not_title}</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-lg-6 support-grid mainFAQ">
					<span class="fa fa-question"></span>
					<h4 class="title-w3ls text-center text-bl mb-3"><a href="/board/faq">자주하는질문</a></h4>
					<ul>
						<c:forEach items="${faqList}" var="list">
						<li><a href="#" data-bno="${list.faq_num}" class="faq_title">${list.faq_title}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
<!-- 	support -->
<%@ include file="include/footer.jsp" %>