<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
th{
	background-color:#f7f7f7;
}
</style>
<script>
	$(document).ready(function() {

	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8 main_grid_contact form-w3ls p-md-5 p-4">
		<div class="row" style="
    margin-bottom: 10px;">
		<div class="col-md-6">
		<a href="/admin/list" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">전체상품</a>
		<a href="/myLunch/readAll" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">나만의도시락</a>
		<a href="/admin/orderList" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">주문목록</a>
		</div>
		<div class="col-md-6"></div>
		</div>
		<div class="row">
		<div class="col-md-3">
		<%@include file="../include/adminBuyPage.jsp"%>
		</div>
		<div class="col-md-9">
		</div>
		</div>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>