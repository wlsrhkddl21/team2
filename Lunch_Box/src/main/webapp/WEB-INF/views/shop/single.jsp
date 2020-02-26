<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<style>
	.margin_self {
		margin-left: 1253px;
	}
</style>
<div style="height: 20px"></div>
<h3 class="title-w3ls text-center text-bl mb-5">일반 도시락</h3>
<div style="height: 20px"></div>
<!-- 상품 등록 -->
<div class="container-fluid" id="long" data-long="long">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<!-- 최근목록 보기 -->
		<%@ include file="../include/recentListDiv.jsp" %>
		<!-- /최근목록 보기 -->
			<div class="row no-gutters">
				<c:forEach items="${list }" var="productVo">
						<div class="col-md-4">
							<a href="/shop/detail/${productVo.pdt_num }"> <img src="/admin/displayFile?fileName=${productVo.pdt_image}" alt="상품이미지"
								class="img-fluid" style="height: 380px; width: 380px;" />
							</a>
							<div>
								<a class= "navbar-brand" style="font-size: 25px;" href="/shop/detail/${productVo.pdt_num }">
									${productVo.pdt_name }</a>
							</div>
							<div style="height: 10px;"></div>
							<div>
								<b style="font-size:18px; color: gray;" ><fmt:formatNumber
										value="${productVo.pdt_price }" type="number" />원</b>
							</div>
								<div style="height: 20px;"></div>
						</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-2">
		</div>
		<!-- 페이지 -->
		<div style="height: 50px"></div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>