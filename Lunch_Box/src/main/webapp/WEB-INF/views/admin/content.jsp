<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.page-link{
	text-align: center;
}
</style>
<script>
$(document).ready(function(){
	$(".form-control").each(function(){
		$(".form-control").attr("disabled",true);
	});
	$("#btnList").click(function(){
		location.href="/admin/list";
	})
	$("#btnUpdate").click(function(){
		$(".form-control").attr("disabled",false);
		$(".updateShow").each(function(){
			$(this).show();
		});
		$(".updateHide").each(function(){
			$(this).hide();
		})
		
	});
	
	$("#btnFile").click(function(){
		$("#pdt_file").trigger("click");
		
	});
	
	$("#btnCancel").click(function(){
		$(".form-control").each(function(){
			$(".form-control").attr("disabled",true);
		});
		$(".updateShow").each(function(){
			$(this).hide();
		});
		$(".updateHide").each(function(){
			$(this).show();
		})
	});
})
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="col-lg-12 main_grid_contact">
				<div class="form-w3ls p-md-5 p-4">
					<form role="form">
						<div class="form-group">
							<label for="pdt_num">상품번호</label> 
							<input type="text" value="${productVo.pdt_num }" 
							class="form-control" id="pdt_num" 
							disabled/>
						</div>
						<div class="form-group">
							<label for="pdt_category">종류</label>
							 <input type="text"	value="${productVo.pdt_category}" 
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
							class="form-control" id="pdt_date"/>
						</div>
						<div class="form-group">
							<label for="pdt_price">가격</label> 
							<input type="text" value="${productVo.pdt_price}" 
							class="form-control" id="pdt_price" />
						</div>
						<div class="form-group">
							<label for="pdt_image">이미지</label> 
							 
					<input
						type="file" class="form-control-file" id="pdt_file" name="file" style="display:none;"/>
							<img src="/admin/displayFile?fileName=${productVo.pdt_image}" 
							 id="pdt_image" width="600px" height="600px"/><br>
							 <button type="button" class="btn btn-primary updateShow" id="btnFile" style="display:none;">사진 변경</button>
						</div>
						<button type="button" class="btn btn-primary" id="btnList">목록</button>
						<button type="button" class="btn btn-primary updateHide" id="btnUpdate">수정</button>
						<button type="button" class="btn btn-primary updateHide" id="btnDelete">삭제</button>
						<button type="button" class="btn btn-primary updateShow" id="btnSubmit" style="display:none;">완료</button>
						<button type="button" class="btn btn-primary updateShow" id="btnCancel" style="display:none;">취소</button>
					</form>
				</div>
			</div>
			<div class="row"  style="text-align:center;">
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
	</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>