<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	$("#btnList").click(function(){
		location.href="/admin/list";
	});
	
	$("#btnFile").click(function() {
		$("#pdt_image").trigger("click");
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<form role="form" method="post" action="/admin/insertPDT" enctype="multipart/form-data">
				<div class="form-group">
					<label for="pdt_category">종류</label>
						
							<span>
							<select class="form-control" id="pdt_category" name="pdt_category">
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
							</select>	
						</span>
				</div>
				<div class="form-group">
					<label for="pdt_name"> 상품명 </label> 
					<input
						type="text" class="form-control" id="pdt_name" name="pdt_name"/>
				</div>
				<div class="form-group">
					<label for="pdt_date"> 일수 </label> 
					<input
						type="text" class="form-control" id="pdt_date" name="pdt_date"/>
				</div>
				<div class="form-group">
					<label for="pdt_price"> 가격 </label> 
					<input
						type="text" class="form-control" id="pdt_price" name="pdt_price"/>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" id="btnFile">이미지 파일 찾기</button>
					<input
						type="file" class="form-control-file" id="pdt_image" name="file" style="display:none;"/>
				</div>
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="button" id="btnList" class="btn btn-danger">목록</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>