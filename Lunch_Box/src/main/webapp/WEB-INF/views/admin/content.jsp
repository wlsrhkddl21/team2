<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<script>
	$(document).ready(function() {
		$(".form-control").each(function() {
			$(".form-control").css("border", "none");

		});

		$("#btnList").click(function() {
			location.href = "/admin/list";
		});

		$("#btnSubmit").click(function() {

		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				location.href = "/admin/delete?pdt_num=${productVo.pdt_num}";
			}

		});

		$("#btnUpdate").click(function() {
			$(".form-control").css("border", "1px solid");
			$(".updateShow").each(function() {
				$(this).show();
			});
			$(".updateHide").each(function() {
				$(this).hide();
			})

		});

		$("#btnFile").click(function() {
			$("#pdt_file").trigger("click");

		});
		$("#btnSubfile").click(function() {
			$("#pdt_Subfile").trigger("click");

		});

		$("#btnCancel").click(function() {
			$(".form-control").each(function() {
				$(".form-control").attr("disabled", true);
			});
			$(".updateShow").each(function() {
				$(this).hide();
			});
			$(".updateHide").each(function() {
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
					<form role="form" id="updateForm" action="/admin/updatePDT"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="pdt_image" value="${productVo.pdt_image }">
						<input type="hidden" name="pdt_subimage" value="${productVo.pdt_subimage }">
						<div class="form-group">
							<label for="pdt_num" style="font-weight:bold">상품번호</label> <input type="text"
								value="${productVo.pdt_num }" id="pdt_num" name="pdt_num"
								style="border:none;" readonly />
						</div>
						<div class="form-group">
							<label for="pdt_category" style="font-weight:bold">종류</label> <input type="text"
								value="${productVo.pdt_category}"
								class="form-control updateHide" /> <select
								class="form-control updateShow" id="pdt_category"
								name="pdt_category" style="display: none;">
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
							</select>
						</div>
						<div class="form-group">
							<label for="pdt_name" style="font-weight:bold">상품명</label> <input type="text"
								value="${productVo.pdt_name}" class="form-control" id="pdt_name"
								name="pdt_name" />
						</div>
						<div class="form-group">
							<label for="pdt_date" style="font-weight:bold">총일수</label> <input type="text"
								value="${productVo.pdt_date}" class="form-control" id="pdt_date"
								name="pdt_date" />
						</div>
						<div class="form-group">
							<label for="pdt_price" style="font-weight:bold">가격</label> <input type="text"
								value="${productVo.pdt_price}" class="form-control"
								id="pdt_price" name="pdt_price" />
						</div>
						<div class="form-group">
							<label for="pdt_image" style="font-weight:bold">상품이미지</label> <input type="file"
								class="form-control-file" id="pdt_file" name="file" style="display: none;" /> 
								<c:if test="${not empty productVo.pdt_image }">
								<img src="/admin/displayFile?fileName=${productVo.pdt_image}"
								id="pdt_image" width="600px" height="600px" class="updateHide" />
								</c:if>
								<br>
							<button type="button" class="btn btn-primary updateShow"
								id="btnFile" style="display: none;"> 메인 사진 변경</button>
						</div>
						<div class="form-group">
							<label for="pdt_Subimage" style="font-weight:bold;">상품서브이미지</label> <input type="file"
								class="form-control-file" id="pdt_Subfile" name="subFile" style="display: none;" /> 
								<c:if test="${not empty productVo.pdt_subimage }">
								<img src="/admin/displayFile?fileName=${productVo.pdt_subimage}"
								id="pdt_Subfile" class="updateHide" />
								</c:if>
							<br><button type="button" class="btn btn-primary updateShow"
								id="btnSubfile" style="display: none;"> 서브 사진 변경</button>
						</div>
						<button type="button" class="btn btn-primary" id="btnList">목록</button>
						<button type="button" class="btn btn-primary updateHide"
							id="btnUpdate">수정</button>
						<button type="button" class="btn btn-primary updateHide"
							id="btnDelete">삭제</button>
						<button type="submit" class="btn btn-primary updateShow"
							id="btnSubmit" style="display: none;">완료</button>
						<button type="button" class="btn btn-primary updateShow"
							id="btnCancel" style="display: none;">취소</button>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>