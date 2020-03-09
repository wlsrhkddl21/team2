<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="../include/mypageStyle.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div style="height: 20px;"></div>
			<h3 class="title-w3ls text-center text-bl mb-5">My page</h3>
			<div class="row">
				<div class="col-md-3">
					<div style="height: 20px;"></div>
					<%@ include file="../include/myMenu.jsp"%>
				</div>
				<div class="col-md-9">
					<div class="row">
						<div class="mypage_info text-center" style="width: 920px;">
							<div>${memberVo.mem_name}님안녕하세요</div>
							<div>보유 포인트: ${memberVo.mem_point }P</div>
						</div>
					</div>
				</div>
				<div class="col-md-2" style="height: 300px;"></div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>