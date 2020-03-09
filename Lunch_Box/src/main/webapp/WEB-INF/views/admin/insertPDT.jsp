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
	$("#btnSubfile").click(function() {
		
		$("#pdt_Subimage").trigger("click");
	});
	
	$("#btnSubmit").click(function(){
		var pdt_name = $("#pdt_name").val();
		var pdt_price = $("#pdt_price").val();
		if(pdt_name!=""&&pdt_price!=""){
		$("#insertForm").submit();
		}else if(pdt_name==""){
			alert("상품명을 입력하세요");
		}else if(pdt_price==""){
			alert("가격을 입력하세요");
		}
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6 main_grid_contact" style="margin-bottom: 300px;">    
			<form role="form" method="post" id="insertForm" action="/admin/insertPDT" enctype="multipart/form-data"
			style="margin: 30px;">
				<div class="form-group">
					<label for="pdt_category">종류</label>
						
							<span>
							<select class="form-control" id="pdt_category" name="pdt_category">
								<option value="한식">한식</option>
								<option value="양식">양식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
							</select>	
						</span>
				</div>
				<div class="form-group">
					<label for="pdt_name"> 상품명 </label> 
					<input
						type="text" class="form-control" id="pdt_name" name="pdt_name" placeholder="상품명*" />
				</div>
				<div class="form-group">
					<label for="pdt_price"> 가격 </label> 
					<input
						type="text" class="form-control" id="pdt_price" name="pdt_price" placeholder="가격*"/>
						
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-outline-dark" id="btnFile">메인 사진 등록</button>
					<input
						type="file" class="form-control-file" id="pdt_image" name="file" style="display:none;"/>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-outline-dark" id="btnSubfile">서브 사진 등록</button>
					<input
						type="file" class="form-control-file btn-outline-dark" id="pdt_Subimage" name="subFile" style="display:none;"/>
				</div>
				<button type="button" id="btnSubmit" class="btn btn-outline-dark">등록</button>
				<button type="button" id="btnList" class="btn btn-outline-dark">목록</button>
			</form>
		</div>
		<div style="height:400px;"></div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>