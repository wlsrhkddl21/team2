<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {

	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<a href="/admin/list" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">목록</a>
			<table class="table table-striped text-center">
				<thead>
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="col-md-2"></div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>