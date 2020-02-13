<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<head>
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
	<div class="main-top">
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
						<li>
							<!-- First Tier Drop Down -->
							<label for="drop-2" class="toggle toogle-2">Pages <span class="fa fa-angle-down"
									aria-hidden="true"></span>							</label>
							<a href="#">도시락 판매 <span class="fa fa-angle-down" aria-hidden="true"></span></a>
							<input type="checkbox" id="drop-2" />
							<ul>
								<li><a href="/shop/single" class="drop-text">일반 도시락</a></li>
								<li><a href="/shop/my" class="drop-text">나만의 도시락</a></li>
							</ul>
						</li>
						<li><a href="/shop/sub">정기배송</a></li>
						<li><a href="#gallery">리뷰 게시판</a></li>
						<li><a href="#contact">고객센터</a></li>
					</ul>
			  </nav>
			</div>
			<!-- //nav -->
			<!-- dwn -->
			<div class="text-center">
				<a href="/admin/list" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">관리자창 </a>
				<a href="/lb/login" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">로그인 </a>
				<a href="/lb/joinGet" class="login-button-2 text-uppercase text-wh mt-lg-0 mt-2">회원가입 </a>
			</div>
			<!-- //dwn -->
		</div>
	</div>
	<!-- //navigation -->