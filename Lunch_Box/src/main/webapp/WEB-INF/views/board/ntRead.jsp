<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function() {
	// 수정 버튼
	$("#btnModify").click(function() {
		$("#not_title").prop("readonly", false);
		$("#not_content").prop("readonly", false);
		$(this).hide(100);
		$("button[type=submit]").show(100);
		$("#btnCancel").show(100);
		$("#btnHot").show(100);
		if(${boardVo.not_hot} == 1) {
			console.log("중요공지임");
			$("#btnHot").hide(100);
			$("#btnHotCancel").show(100);
		}
	});
	// 중요공지삭제버튼
	$("#btnHotCancel").click(function(){
		if(confirm("중요공지를 중단하시겠습니까?")) {
			$("#myform").attr("action", "/board/hotDelete").submit();
		}
	});
	// 목록 버튼
	$("#btnListAll").click(function(){
		location.href = "/board/notice";
	});
	// 삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			$("#frmList").attr("action", "/board/ntDelete").submit();	
		}
	});
	// 작성취소 버튼
	$("#btnCancel").click(function(){
		$("#not_title").prop("readonly", true);
		$("#not_content").prop("readonly", true);
		$("button[type=submit]").hide(100);
		$(this).hide(100);
		$("#btnModify").show(100);
		$("#btnHot").hide(100);
	});
	// 중요공지등록 버튼
	$("#btnHot").click(function() {
		if(confirm("중요공지로 등록하시겠습니까?")) {
			$("#myform").attr("action", "/board/hotUpdate").submit();
		}
	});
});
	
</script>
<div class="container-fluid">
<!-- 댓글 수정 모달 창 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div style="height: 20px"></div>
		<div class="row">
		<div class="col-md-12">
			 <a id="modal-a" href="#modal-container" role="button" class="btn" data-toggle="modal"
			 	style="display:none;">Launch demo modal</a>
			
			 <div class="modal fade" id="modal-container" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								댓글 수정하기
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="hidden" id="modal_rno"/>
							<label for="modal_reply_text">댓글내용</label>
							<input type="text" class="form-control"
								id="modal_reply_text"/>
							<label for="modal_replyer">작성자</label>
							<input type="text" class="form-control"
								id="modal_replyer"/>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btnModalReply">
								수정완료
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal"
								id="btnModalClose">
								닫기
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<form id="frmList" action="/board/notice" method="get">
		<input type="hidden" name="not_num" 
			value="${boardVo.not_num}" />
		<input type="hidden" name="page" 
			value="${pagingDto.page}"/>
		<input type="hidden" name="perPage" 
			value="${pagingDto.perPage}"/>
	</form>

	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-10 main_grid_contact" >
			<form id="myform" role="form" method="post" 
				action="/board/ntUpdate" style="padding:30px;">
			<input type="hidden" name="not_num" value="${boardVo.not_num}"/>
			<input type="hidden" name="page" value="${pagingDto.page}"/>
			<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
				<div class="form-group">
					<label for="title">제목</label>
					<input type="text" class="form-control" id="not_title" 
						name="not_title" value="${boardVo.not_title}"
						readonly/>
				</div>
				<div class="form-group">
					<label for="content">내용</label><br>
					<textarea rows="5" id="not_content" class="form-control"
						name="not_content" readonly>${boardVo.not_content}</textarea>
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input type="text" class="form-control" id="not_writer" 
						name="not_writer" value="${boardVo.not_writer}"
						readonly/>
				</div>
				<hr>
				<div style="clear:both;">
					<button type="submit" class="btn btn-success" id="btnSuccess"
						style="display:none;">완료</button>
					<button type="button" class="btn btn-warning" id="btnCancel"
						style="display:none;">수정취소</button>
					<button type="button" class="btn btn-warning" id="btnHot"
						style="display:none;">중요공지등록</button>
					<button type="button" class="btn btn-warning" id="btnHotSuccess"
						style="display:none;">중요공지등록완료</button>
					<button type="button" class="btn btn-warning" id="btnHotCancel"
						style="display:none;">중요공지등록삭제</button>
					<button type="button" class="btn btn-warning"
						id="btnModify">수정</button>
					<button type="button" class="btn btn-danger"
						id="btnDelete">삭제</button>
					<button type="button" class="btn btn-primary"
						id="btnListAll">목록</button>
				</div>
			</form>
			<!-- 댓글 작성 -->
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="reply_text">댓글내용</label>
				<input type="text" id="reply_text"
					class="form-control"/>
			</div>
			<div class="form-group">
				<label for="replyer">작성자</label>
				<input type="text" id="replyer"
					class="form-control"/>
			</div>
			<div class="form-group">
				<button type="button" class="btn-xs btn-success"
					id="btnReply">작성완료</button>
			</div>
		</div>
	</div>
	<!-- // 댓글 작성 -->
	
	<hr/>
	
	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>댓글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="replyList">
					
				</tbody>
			</table>
		</div>
	</div>
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