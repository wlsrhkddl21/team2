<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	
});
	
</script>

		<a id="modal-a" href="#myModal" role="button" class="btn" data-toggle="modal"
			 	style="display:none;">Launch demo modal</a>
			
			 <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
								id="modal_replyer" readonly/>
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
<div class="container-fluid">
<!-- 댓글 수정 모달 창 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div style="height: 20px"></div>
		<div class="row">
		<div class="col-md-12">
			 
		</div>
	</div>


<!-- 	<form id="frmList" action="/board/notice" method="get"> -->
<!-- 		<input type="hidden" name="not_num"  -->
<%-- 			value="${boardVo.not_num}" /> --%>
<!-- 		<input type="hidden" name="page"  -->
<%-- 			value="${pagingDto.page}"/> --%>
<!-- 		<input type="hidden" name="perPage"  -->
<%-- 			value="${pagingDto.perPage}"/> --%>
<!-- 	</form> -->

	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-10 main_grid_contact" >
			<br>
			<form id="myform" role="form" method="post" 
				action="/review/reviewContent">
			<input type="hidden" name="not_num" value="${reviewVo.rev_num}"/>
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
				<input type="text" id="rev_title" 
						name="rev_title" value="${reviewVo.rev_title}" style="border:none" 
						readonly/></td>
<!-- 				<th scope="row">조회수</th> -->
<%-- 				<td>${reviewVo.not_viewcount}</td> --%>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td class="form-group">
				<input type="text" id="rev_writer" 
						name="rev_writer" value="${mem_id}" style="border:none"
						readonly/></td>
				<th scope="row">작성일</th>
				<td>${reviewVo.rev_regdate}</td>
			</tr>
			<tr>
				<th scope="row" colspan="5" class="form-group" >
				<textarea rows="10" id="not_content" 
						name="not_content" style="border:none" readonly>${reviewVo.rev_content}</textarea>
				</th>
			</tr>
		</tbody>
	</table>
			
			<hr>
			
			
			</form>
<!-- 				<div style="clear:both;"> -->
<%-- 				<c:if test="${mem_id == 'admin'}"> --%>
<!-- 					<button type="button" class="btn btn-warning" -->
<!-- 						id="btnModify">수정</button> -->
<!-- 					<button type="button" class="btn btn-danger" -->
<!-- 						id="btnDelete">삭제</button>				 -->
<%-- 				</c:if> --%>
<!-- 					<button type="button" class="btn btn-primary" -->
<!-- 						id="btnListAll">목록</button> -->
<!-- 				</div> -->
			<!-- 댓글 작성 -->
	<c:if test="${mem_id != null && mem_id != ''}">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="ntRcontent">댓글내용</label>
				<input type="text" id="ntRcontent"
					class="form-control"/>
			</div>
			<div class="form-group">
				<label for="ntRwriter">작성자</label>
				<input type="text" id="ntRwriter" value="${mem_id }"
					class="form-control" readonly/>
			</div>
			<div class="form-group">
				<button type="button" class="btn-xs btn-success"
					id="btn_ntReply">작성완료</button>
			</div>
		</div>
	</div>
	</c:if>
	<!-- // 댓글 작성 -->
	
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
					<c:if test="${mem_id == boardVo.not_writer}">
						<th>수정</th>
						<th>삭제</th>
					</c:if>
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
