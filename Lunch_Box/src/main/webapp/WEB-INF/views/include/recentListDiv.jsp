<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
		margin-bottom: 10px;
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
	.cartList:hover {
		opacity: .8;
    	text-decoration: none;
    	transition: 0.5s all;
   		-webkit-transition: 0.5s all;
    	-moz-transition: 0.5s all;
    	-o-transition : 0.5s all;
    	-ms-transition : 0.5s all;
    	color: #0056b3;
	}
	.countSpan {
		color: #7ebf27 !important;
		font-size: inherit;
	}
	.scroll {
		color:#a4a4a4;
		font-size: 11px;
		height : 45px;
	}
	.scroll a{
		float: left;
		width: 50%;
		height: 30px;
		-webkit-box-sizing:border-box;
		line-height: 1;
		vertical-align: top;
		cursor: pointer;
		height: 45px;
	}
	.arr {
		display: block;
		width: 10px;
		height: 7px;
		margin: 9px auto 7px;
	}
	.scrollUp .arr{
		background: url(http://www.homeal.net/_skin/homeal/img/common/arr_scroll_up.gif) no-repeat center top;
	}
	.scrollDown .arr{
		background: url(http://www.homeal.net/_skin/homeal/img/common/arr_scroll_down.gif) no-repeat center top;
	}
	.scrollDown {
		border-left: 1px solid #e6e5e5;
	}
</style>
<script>
$(function() {
	$(".cartList").click(function() {
		location.href="/cart/list";
	});
	$(window).scroll(function() {
		var length = 120;
		var dataLong = $("#long").attr("data-long");
		if (dataLong == "long") {
			length = -120;
		}
		var footHeight = $(".footer").outerHeight(true);
		var mainHeight = $(".main-top").outerHeight(true);
		var bodyHeight = $("body").outerHeight(true)-600;
		var recentList = $(".recentList").outerHeight(true);
		var v = bodyHeight-footHeight-mainHeight;
		var position = $(window).scrollTop();
		if (position < mainHeight) {
			position = mainHeight;
		}
		if (position > v ) {
			position = v;
		} 
		

		$(".recentList").stop();
		$(".recentList").animate({"top":position-mainHeight+length});
	});  
	$(".btn_scroll_bottom").click(function(){
		$('html, body').scrollTop( $(document).height() );
	});
});
</script>
<div class="recentList margin_self">
				<div class="box">
				<p class="title">최근 본 상품</p>
					<div>
					<ul class="list">
						<c:forEach items="${veiwList}" var="veiw">
						<li><a href="/shop/detail/${veiw.pdt_num}"><img src="/admin/displayFile?fileName=${veiw.pdt_image}" width="150" height="100" border="10" style="cursor: pointer;"></a></li>
						</c:forEach>
					</ul>
					</div>
					<p class="cartList">장바구니 (<span class="countSpan">${cartCount}</span>)</p>
					<p class="cartList">마이페이지</p>
				</div>
				<div class="box scroll">
					<a class="scrollUp btn_scroll_top" onclick="window.scrollTo(0,0);"><span class="arr"></span>상단으로</a>
					<a class="scrollDown btn_scroll_bottom"><span class="arr"></span>하단으로</a>
				</div>
</div>