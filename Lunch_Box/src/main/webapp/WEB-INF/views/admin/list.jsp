<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.pdt_name{
cursor : pointer;
}
</style>
<script>
// 	console.log("${list }");
$(document).ready(function(){
	$(".pdt_name").click(function(e){
		e.preventDefault();
// 		console.log("클릭됨");
		var pdt_num = $(this).attr("data-num");
// 		location.href = "/admin/content";
		location.href = "/admin/content?pdt_num="+pdt_num;
	});
	function thumbnail(){
		$(".pdtImg").each(function(){
			var fileName = $(this).attr("data-img");
			console.log("fileName:"+fileName);
			var slice = fileName.lastIndexOf("/")
			var path = fileName.substring(0,slice+1);
			var real = fileName.substring(slice+1);
			var thumbnail = path+"s_"+real;
			console.log(thumbnail);
			$(this).attr("src","/admin/displayFile?fileName="+thumbnail);
		});
	}
	thumbnail();
});
</script>
	
<form>

</form>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<div style = "text-align:right">
			<a href="/admin/insertPDT" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">상품등록</a>
			</div>
			<table class="table table-striped">
					<tr>
						<th>No</th>
						<th style = "text-align:center">Image</th>
						<th style = "text-align:center">종류</th>
						<th style = "text-align:center">상품명</th>
						<th style = "text-align:center">판매량</th>
					</tr>
					<tbody>
					<c:forEach items="${list}" var="productVo">
					<tr>
						<td>${productVo.pdt_num}</td>
						<c:if test="${not empty productVo.pdt_image}">
						<td style = "text-align:center">
						<img alt="상품이미지" class ="pdtImg" data-img="${productVo.pdt_image}" 
						>
						</td>
						</c:if>
						<td style = "text-align:center">${productVo.pdt_category}</td>
						<td><a class="pdt_name" href="#" data-num="${productVo.pdt_num}">${productVo.pdt_name}</a></td>
						<td style = "text-align:center">${productVo.pdt_sales}</td>
					</tr>
					</c:forEach>
					</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>