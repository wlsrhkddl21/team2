<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zxx">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/js/myscript.js"></script>
<script>

$(document).ready(function(){
	var msg = "${msg}";
	var memberVo = "${memberVo}";
	if (msg == "success") {	
		var mem_name = "${sessionScope.mem_name}";
		alert("로그인 성공");
	} else if (msg == "fail"){	
		alert("비밀번호가 일치하지 않습니다");	
	}
	$("#btnLogout").click(function(){
		alert("로그아웃 되었습니다");
	});
	
});
</script>
<head>
<c:remove var="msg" scope="session" />
	<title>Lunch Box</title> 
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content="" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!--// Meta tag Keywords -->

	<!-- Custom-Files -->
	<link rel="stylesheet" href="/css/bootstrap.css">
	<!-- Bootstrap-CSS -->
	<link rel="stylesheet" href="/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //Custom-Files -->

	<!-- Web-Fonts -->
	<link
		href="http://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext,vietnamese"
		rel="stylesheet">
	<!-- //Web-Fonts -->
</head>
<body>
	<!-- header -->
	<!-- //top-bar -->

	<!-- header 2 -->
	<!-- navigation -->
	<div class="main-top" style="margin-bottom:20px;">
		<div class="container d-lg-flex justify-content-between align-items-center">
			<!-- logo -->
			<h1 class="logo-style-res float-left">
				<a class="navbar-brand" href="/">
					<img src="/images/logo.png" alt="" class="img-fluid logo-img mt-1">Lunch Box
				</a>
			</h1>
			<!-- //logo -->
			<!-- nav -->
			<div class="nav_w3ls mx-lg-auto">
				<nav>
					<label for="drop" class="toggle">Menu</label>
					<input type="checkbox" id="drop" />
					<ul class="menu mx-lg-auto">
						<li><a href="/shop/single">일반 도시락</a></li>
						<li><a href="/shop/my">나만의 도시락</a></li>
						<li><a href="/review/reviewBoard">리뷰 게시판</a></li>
						<li><a href="/cs/">고객센터</a></li>
					</ul>
			  </nav>
			</div>
			<!-- //nav -->
			<!-- dwn -->
			<div class="text-center" id="divLogin">
			
			<c:choose>
			<c:when test="${empty mem_name }">
				<a href="/lb/login" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">로그인 </a>
				<a href="/lb/joinGet" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">회원가입 </a>
			</c:when>
			
			<c:otherwise>
				<div style="text-align: right;">${mem_name} 님 환영합니다</div>
				<a href="/lb/logout" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2" id="btnLogout">로그아웃</a>
				<a href="/mp/" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">MyPage</a>
				<a href="/cart/list"><img src="/images/cart.png" width="45px"/></a>
			</c:otherwise>
			</c:choose>
			<c:if test="${mem_id=='admin' }">
			
				<a href="/admin/list" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">관리자창 </a>
			</c:if>
			</div>
			<!-- //dwn -->
		</div>
	</div>
	<!-- //navigation -->