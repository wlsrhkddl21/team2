<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.margin_self {
		top : 120px;
		margin-left: 1125px;
	}
	.recentList {
		position:absolute;
		background-color: #fff;
		z-index: 1;
		border-top: 5px solid #fd5c63;
	}
	.box {
		width: 200px;
		border: 1px	solid #e6e5e5;
		text-align: -webkit-center;
	}
	.title {
		padding-bottom: 25px;
		font-size: 20px;
		color: #333;
		font-weight: 500;
	}
	.list {
		list-style: none;
	}
	.list li {
		float:inherit;
		padding: 4px 0;
	}
	.cartList {
		background: #fd5c63;
		color: #fff;
		border: 1px	solid #e6e5e5;
		font-weight : bold;
		padding: 10px;
		cursor: pointer;
	}
	.cart_count {
		color : steelblue;
	}
	p:hover {
		opacity: .8;
    	text-decoration: none;
    	transition: 0.5s all;
   		-webkit-transition: 0.5s all;
    	-moz-transition: 0.5s all;
    	-o-transition : 0.5s all;
    	-ms-transition : 0.5s all;
    	color: #0056b3;
	}
	
</style>
<script>
$(function() {
	$(".cartList").click(function() {
		location.href="/cart/list";
	});
});

</script>
<div class="recentList margin_self">
				<div class="box">
				<p class="title">최근 본 상품</p>
					<div>
					<ul class="list">
						<c:forEach items="${veiwList}" var="veiw">
						<li><a><img src="/admin/displayFile?fileName=${veiw.pdt_image}" width="150" height="100" border="10"></a></li>
						</c:forEach>
					</ul>
					</div>
					<p class="cartList">장바구니<span>3</span></p>
					<p class="cartList">마이페이지</p>
				</div>
</div>