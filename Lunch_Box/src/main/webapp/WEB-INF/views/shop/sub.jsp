<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp" %>
	<style>
.pdt-font-name {
	font-size: 25px;
}

.ptd-font-price {
	font-size: 20px;
}
</style>
<div style="height: 20px"></div>
<h3 class="title-w3ls text-center text-bl mb-5">정기 배송</h3>
<div style="height: 20px"></div>
<!-- 상품 등록 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="row no-gutters">
				<c:forEach items="${list }" var="productVo">
					<c:if test="${productVo.pdt_date != 1}">
						<div class="col-md-4">
							<a href="shop/datail?=${productVo.pdt_num }"> <img src="../images/test1.jpg" alt=" "
								class="img-fluid" style="height: 380px; width: 380px;" />
							</a>
							<div>
								<b class="pdt-font-name">
									<a href="shop/datail?=${productVo.pdt_num }">
									${productVo.pdt_name }</a></b>
							</div>
							<div>
								<b class="ptd-font-price"><fmt:formatNumber
										value="${productVo.pdt_price }" type="number" /></b>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-2"></div>
		<!-- 페이지 -->
		<div style="height: 50px"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<nav>
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#">Previous</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">2</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">3</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">4</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">5</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>
</div>
	
	
<%@ include file="../include/footer.jsp" %>