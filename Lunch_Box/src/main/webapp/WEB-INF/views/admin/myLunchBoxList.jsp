<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
th{
	background-color:#f7f7f7;
}

.form-control:disabled, .form-control[readonly] {
    background-color: #fff;
    opacity: 1;
}

</style>
<script>
$(document).ready(function(){
	
	
	$(".updateTxt").each(function(){
		$(this).attr("readonly","readonly");
		$(this).css("border", "none");
		$(this).css("text-align","center");
	});
	
	$(".checkboxs").change(function(){
		var that = $(this).is(":checked");
		var checkBox = $(this).parent().parent().children().find(".updateTxt");
		var type = $(this).parent().parent().children().find(".updateType");
		var typehide = $(this).parent().parent().children().find(".updateTypeHide");
		console.log(that);
		if(that==true){
		checkBox.attr("readonly" ,false);
		checkBox.css("border", "1px solid");
		type.show();
		typehide.hide();
		}else{
			checkBox.attr("readonly" ,true);
			checkBox.css("border", "none");
			type.hide();
			typehide.show();
		}
	});
	
	$("#insertMLB").click(function(){
		var url=""
		$("#modal-a").trigger("click");		
	});
	
	//모달창
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
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			$(".checkbox :checked").each(function() {
				var lunch_num = $(this).parents("tr").find(".lunch_num").text();
				
				var sData = {
						"lunch_num"  : lunch_num,
				};
				$.get("/myLunch/delete",sData,function(rData){
					if(rData=="success"){
						alert("삭제되었습니다.");
					}
				});
			});
		}
		location.href="/myLunch/readAll";
	});
	//수정버튼클릭
	$("#updateMLB").click(function(){
		$(".update").show();
		$(".updateHide").hide();
		$(".checkboxs").show();
	});
	
	$("#updateSubmit").click(function(){
		$(".checkbox :checked").each(function() {
			var lunch_type = $(this).parents("tr").find(".lunch_type").val();
			var lunch_num = $(this).parents("tr").find(".lunch_num").text();
			var lunch_name = $(this).parents("tr").find(".lunch_name").val();
			var lunch_price = $(this).parents("tr").find(".lunch_price").val();
			
			console.log(lunch_type);
			var sData = {
					"lunch_type" : lunch_type,
					"lunch_num"  : lunch_num,
					"lunch_name" : lunch_name,
					"lunch_price": lunch_price
			};
			$.ajax({
				"type" : "post",
				"url" : "/myLunch/update",
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				"dataType" : "text",
				"data" : JSON.stringify(sData),
				"success" : function(rData) {
					alert("수정되었습니다.");
				}
			});		
		});
		location.href="/myLunch/readAll";
	});
	//수정취소클릭
	$("#updateCancel").click(function(){
			
		$(".checkbox :checked").each(function(){
			var el = $(this).parent().parent().children().find(".form-control");
			el.attr("readonly" ,true);
			el.css("border", "none");
			console.log($(this));
			$(this).prop("checked",false);
		});
		$(".update").hide();
		$(".updateHide").show();
		$(".checkboxs").hide();
// 		console.log($(".checkbox :checked"));
	});
	
	$("#typeSelect").change(function(){
		var lunch_type = $(this).val();
// 		var type = {"lunch_type":$(this).val()};
		
		location.href = "/myLunch/readAll?lunch_type="+lunch_type;
// 		var url = "/myLunch/readAll?lunch_type="+type;
// 		$.get(url,type,function(rData){
			
// 		});
	});
});

</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12 ">
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
		<div class="col-md-2"></div>
		<div class="col-md-8 main_grid_contact form-w3ls p-md-5 p-4">
			<div class="row">
				<div class="col-md-6 text-left">
					<a href="/admin/list" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">전체상품</a>
					<a href="/myLunch/readAll" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">나만의도시락</a>
					<a href="/admin/orderList" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">주문내역</a>
				</div>
				<div class="col-md-6 text-right">
					<a id="updateSubmit" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2 update"
						style="display:none;">수정완료</a>
					<a id="btnDelete" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2 update"
						style="display:none;">선택삭제</a>
					<a id="updateCancel" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2 update"
						style="display:none;">취소</a>
					<a id="updateMLB" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2 updateHide">상품수정</a>
					<a id="insertMLB" href="#"
						class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">상품등록</a>
				</div>
			</div>
			<table class="table text-center">
				<thead>
					<tr>
						<th style="display:none;" class="update"></th>
						<th>No</th>
						<th>종류
						<select name="type" id="typeSelect">
						<option value="all"
						<c:if test="${lunch_type=='null' or lunch_type == 'all' }">
						selected
						</c:if>
						>모두</option>
						<option value="rice"
						<c:if test="${lunch_type=='rice' }">
						selected
						</c:if>
						>밥</option>
						<option value="side"
						<c:if test="${lunch_type=='side' }">
						selected
						</c:if>>반찬</option>
						<option value="soup"
						<c:if test="${lunch_type=='soup' }">
						selected
						</c:if>>국</option>
						</select>
						</th>
						<th>내용</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="myLunchVo">
						<tr>
							<td style="display:none;" class="update checkbox"><input type="checkbox" class="checkboxs"></td>
							<td><span class="lunch_num">${myLunchVo.lunch_num }</span></td>
							<td>
								<span class="updateHide">${myLunchVo.lunch_type }</span>
								<span class="update" style="display:none;">
									<select name="lunch_type" class="lunch_type">
										<option value="rice"
										<c:if test="${myLunchVo.lunch_type=='rice' }">
										selected
										</c:if>
										>밥류</option>
										<option value="side"
										<c:if test="${myLunchVo.lunch_type=='side' }">
										selected
										</c:if>>반찬류</option>
										<option value="soup"
										<c:if test="${myLunchVo.lunch_type=='soup' }">
										selected
										</c:if>>국류</option>
									</select>
								</span>
							</td>
							<td><input type="text" value="${myLunchVo.lunch_name }" class="form-control lunch_name updateTxt"
								name="lunch_name" /></td>
							<td><input type="text" value="${myLunchVo.lunch_price }" class="form-control lunch_price updateTxt"
								name="lunch_price" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>