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
	console.log("${list }");
$(document).ready(function(){
	$(".pdt_name").click(function(e){
		e.preventDefault();
		console.log("클릭됨");
		var pdt_num = $(this).attr("data-num");
// 		location.href = "/admin/content";
		location.href = "/admin/content?pdt_num="+pdt_num;
	});
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
						<td>
						<img alt="상품이미지" src="/admin/displayFile?fileName=${productVo.pdt_image}">
						${productVo }
						</td>
						</c:if>
						<td>${productVo.pdt_category}</td>
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