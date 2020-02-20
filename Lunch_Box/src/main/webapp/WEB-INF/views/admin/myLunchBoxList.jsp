<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	$("#insertMLB").click(function(){
		$("#modal-a").trigger("click");		
	});
	$("#btnModal").click(function(){
		var lunch_type = $("#lunch_type").val();
		var lunch_name = $("#lunch_name").val();
		var lunch_price = $("#lunch_price").val();
		console.log("type:"+lunch_type+" name:"+lunch_name+" price:"+lunch_price);
		var sData={
				"lunch_type":lunch_type,
				"lunch_name":lunch_name,
				"lunch_price":lunch_price
		};
		var url = "/myLunch/insert";
		$.post(url,sData,function(rData){
			console.log(rData);
			if(rData=="success"){
				alert("등록완료");
				location.href="/myLunch/readAll";
			}
			
		});
	});
	
	$("#typeSelect").change(function(){
		var type = $(this).val();
		var url = "/myLunch/readAll";
		$.get(url,type,function(rData){
			
			
		});
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 main_grid_contact">
			<a id="modal-a" href="#modal-container" role="button" class="btn"
				data-toggle="modal" style="display: none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">나만의 도시락 메뉴 등록</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modal_rno" /> <label
								for="modal_reply_text">종류</label>
								<select id="lunch_type" class="form-control">
									<option value="rice">밥</option>
									<option value="side">반찬</option>
									<option value="soup">국</option>
								</select> 
								<label for="lunch_name">내용</label> 
								<input type="text" class="form-control" id="lunch_name" />
								<label for="lunch_price">가격</label> 
								<input type="number" class="form-control" id="lunch_price" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnModal">
								등록</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnModalClose">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="row">
				<div class="col-md-6 text-left">
					<a href="/admin/list"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">목록</a>
				</div>
				<div class="col-md-6 text-right">
					<a id="insertMLB" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">상품등록</a>
				</div>
			</div>
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>No</th>
						<th>종류
						<select name="type" id="typeSelect">
						<option value="rice">밥</option>
						<option value="side">반찬</option>
						<option value="soup">국</option>
						</select>
						</th>
						<th>내용</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="myLunchVo">
						<tr>
							<td>${myLunchVo.lunch_num }</td>
							<td>${myLunchVo.lunch_type }</td>
							<td>${myLunchVo.lunch_name }</td>
							<td>${myLunchVo.lunch_price }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>