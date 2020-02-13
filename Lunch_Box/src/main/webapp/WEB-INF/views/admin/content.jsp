<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	$("#list").click(function(){
		location.href="/admin/list";
	})
})
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			${productVo};
			<form role="form">
				<div class="form-group">
					<label for="pdt_num">상품번호</label> 
					<input type="text" value="${productVo.pdt_num }" 
					class="form-control" id="pdt_num" />
				</div>
				<div class="form-group">
					<label for="pdt_category">종류</label> 
					<input type="text" value="${productVo.pdt_category}"
					class="form-control" id="pdt_category" />
				</div>
				<div class="form-group">
					<label for="pdt_name">상품명</label> 
					<input type="text" value="${productVo.pdt_name}"
					class="form-control" id="pdt_name" />
				</div>
				<div class="form-group">
					<label for="pdt_date">총일수</label> 
					<input type="text" value="${productVo.pdt_date}"
					class="form-control" id="pdt_date" />
				</div>
				<div class="form-group">
					<label for="pdt_price">가격</label> 
					<input type="text" value="${productVo.pdt_price}"
					class="form-control" id="pdt_price" />
				</div>
				<div class="form-group">
					<label for="pdt_image">이미지</label> 
					<input type="text" value="${productVo.pdt_image}"
					class="form-control" id="pdt_image" />
				</div>
				<button type="button" class="btn btn-primary" id="list">목록</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>