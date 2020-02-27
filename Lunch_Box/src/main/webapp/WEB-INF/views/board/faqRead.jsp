<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	// 	수정 버튼
	$("#btnModify").click(function() {
		$("#faq_title").prop("readonly", false);
		$("#faq_content").prop("readonly", false);
		$("#faq_title").css("border","1px solid");
		$("#faq_content").css("border","1px solid");
		$(this).hide(100);
		$("button[type=submit]").show(100);
		$("#btnCancel").show(100);
	});
	// 목록 버튼
	$("#btnListAll").click(function(){
		location.href = "/board/faq";
	});

	// 삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			$("#frmList").attr("action", "/board/faqDelete").submit();	
		}
	});
	// 수정취소 버튼
	$("#btnCancel").click(function(){
		$("#faq_title").prop("readonly", true);
		$("#faq_content").prop("readonly", true);
		$("#faq_title").css("border","none");
		$("#faq_content").css("border","none");
		$("button[type=submit]").hide(100);
		$(this).hide(100);
		$("#btnModify").show(100);
	});

});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div style="height: 20px"></div>
		<div class="row">
		<div class="col-md-12">
			 
		</div>
	</div>

	<form id="frmList" action="/board/faq" method="get">
		<input type="hidden" name="faq_num" 
			value="${faqVo.faq_num}" />
		<input type="hidden" name="faq_title" 
			value="${faqVo.faq_title}" />
		<input type="hidden" name="page" 
			value="${pagingDto.page}"/>
		<input type="hidden" name="perPage" 
			value="${pagingDto.perPage}"/>
	</form>

	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-10 main_grid_contact" >
			<br>
			<form id="myform" role="form" method="post" 
				action="/board/faqUpdate">
			<input type="hidden" name="faq_num" value="${faqVo.faq_num}"/>
			<input type="hidden" name="page" value="${pagingDto.page}"/>
			<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
			<table class="table">
		<colgroup>
			<col style="width:10%;">
			<col style="width:50%;">
			<col style="width:10%;">
			<col style="width:40%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td class="form-group">
				<input type="text" id="faq_title" 
						name="faq_title" value="${faqVo.faq_title}" style="border:none" 
						readonly/></td>
				<th></th>
				<td></td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td class="form-group">
				<input type="text" id="faq_writer" 
						name="faq_writer" value="${faqVo.faq_writer}" style="border:none"
						readonly/></td>
				<th scope="row">작성일</th>
				<td>${faqVo.faq_regdate}</td>
			</tr>
			<tr>
				<th scope="row" colspan="5" class="form-group" >
				<textarea rows="10" id="faq_content" 
						name="faq_content" style="border:none" readonly>${faqVo.faq_content}</textarea>
				</th>
			</tr>
		</tbody>
	</table>
			
			<hr>
			
			<div style="clear:both;">
					<button type="submit" class="btn btn-outline-dark" id="btnSuccess"
						style="display:none;">완료</button>
					<button type="button" class="btn btn-outline-danger" id="btnCancel"
						style="display:none;">수정취소</button>
			</div>
			</form>
				<div style="clear:both;">
					<button type="button" class="btn btn-outline-dark"
						id="btnListAll">목록</button>
				<c:if test="${mem_id == 'admin'}">
					<button type="button" class="btn btn-outline-dark"
						id="btnModify">수정</button>
					<button type="button" class="btn btn-outline-danger"
						id="btnDelete">삭제</button>				
				</c:if>
				</div>
				<div style="height: 30px"></div>
		</div>
		<div class="col-md-1" ></div>
	</div>
	
	<hr/>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	<!-- // 댓글 목록 -->
</div>

<%@ include file="../include/footer.jsp" %>
