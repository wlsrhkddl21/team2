<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	// 	수정 버튼
	$("#btnModify").click(function() {
		$("#qna_title").prop("readonly", false);
		$("#qna_content").prop("readonly", false);
		$("#qna_title").css("border","1px solid");
		$("#qna_content").css("border","1px solid");
		$(this).hide(100);
		$("button[type=submit]").show(100);
		$("#btnCancel").show(100);
	});
	// 목록 버튼
	$("#btnListAll").click(function(){
		location.href = "/board/qna";
	});
	// 답변작성 버튼
	$("#btnAnswer").click(function() {
		console.log("클릭됨");
		$("#frmList").attr("action", "/board/qnaAnswer");
		$("input[name=qna_num]").remove();
		$("#frmList").submit();
	});
	// 삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			$("#frmList").attr("action", "/board/qnaDelete").submit();	
		}
	});
	// 수정취소 버튼
	$("#btnCancel").click(function(){
		$("#qna_title").prop("readonly", true);
		$("#qna_content").prop("readonly", true);
		$("#qna_title").css("border","none");
		$("#qna_content").css("border","none");
		$("button[type=submit]").hide(100);
		$(this).hide(100);
		$("#btnModify").show(100);
		$("#btnHot").hide(100);
	});
	
	// 댓글 작성완료 버튼
	$("#btn_qnaReply").click(function(){
		var qrbno = "${qnaVo.qna_num}";
		var qrcontent = $("#qrContent").val();
		var qrwriter = $("#qrWriter").val();
		var sendData = {
				"qrbno" : qrbno,
				"qrcontent" : qrcontent,
				"qrwriter" : qrwriter
		};
		console.log(sendData);
		var url = "/replies/qnaRegister";
		
		$.ajax({
			"type" : "post",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			"dataType" :"text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				console.log(rData);
				replyList();
			}
		});
	});
	// 댓글 모달창 완료 버튼
	$("#btnModalReply").click(function(){
		console.log("댓글완료");
		var qrnum = $("#modal_rno").val();
		var qrcontent = $("#modal_reply_text").val();
		var qrwriter = $("#modal_replyer").val();
		
		var sendData = {
				"qrnum" : qrnum,
				"qrcontent" : qrcontent,
				"qrwriter" : qrwriter
		}
		var url = "/replies/qnaUpdate";
		
		$.ajax({
			"type" : "put",
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "put"
			},
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				console.log(rData);
				replyList();
				$("#btnModalClose").trigger("click");
			}
		});		
	});
	
	// 댓글 목록 불러오기
	function replyList() {
		$("#replyList").empty();
		var url = "/replies/qnaAll/${qnaVo.qna_num}";
		$.getJSON(url, function(rData) {
			console.log(rData);
			var strHtml = "";
			$(rData).each(function(){
				strHtml += "<tr>";
				strHtml += "<td>" + this.qrcontent + "</td>";
				strHtml += "<td>" + this.qrwriter + "</td>";
				strHtml += "<td>" + dateString(this.qrdate) + "</td>";
				if("${mem_id}" == this.qrwriter || "${mem_id}" == "admin") {
					strHtml += "<td><button type='button' class='btn btn-outline-dark btnReplyUpdate'";
					strHtml += " data-rno='" + this.qrnum + "'";
					strHtml += " data-reply_text='" + this.qrcontent + "'";
					strHtml += " data-replyer='" + this.qrwriter + "'>수정</button></td>";
					strHtml += "<td><button type='button' class='btn btn-outline-danger btnReplyDelete'";
					strHtml += " data-rno='" + this.qrnum + "'";
					strHtml += " data-bno='" + this.qrbno + "'>삭제</button></td>";	
				} else {
					strHtml += "<td></td><td></td>";
				}
				strHtml += "</tr>";
			});
			$("#replyList").append(strHtml); // <tbody>의 자식 엘리먼트로 html을 추가
		});
	}
	// 댓글 수정 버튼
	$("#replyList").on("click", ".btnReplyUpdate", function() {
		console.log("댓글 수정 버튼");
		var qrnum = $(this).attr("data-rno");
		var qrcontent = $(this).attr("data-reply_text");
		var qrwriter = $(this).attr("data-replyer");
		$("#modal_rno").val(qrnum);
		$("#modal_reply_text").val(qrcontent);
		$("#modal_replyer").val(qrwriter);
		$("#modal-a").trigger("click");
		$("#myModal").modal("show"); 
	});
	// 댓글 삭제 버튼
	$("#replyList").on("click", ".btnReplyDelete", function() {
			console.log("댓글 삭제 버튼");
			var qrnum = $(this).attr("data-rno");
			var url = "/replies/qnaDelete/" + qrnum;
			
			$.ajax({
				"type" : "delete",
				"url" : url,
				"headers" : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "delete"
				},
				"success" : function(rData) {
					console.log(rData);
					replyList();
					if (confirm("댓글을 삭제하시겠습니까?")) {
						$("#btnModalClose").trigger("click");
					}		
				}
			}); // $.ajax()
		});
	
	replyList(); // 기능 실행
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
							<button type="button" class="btn btn-outline-dark"
								id="btnModalReply">
								수정완료
							</button> 
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal"
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

	<form id="frmList" action="/board/notice" method="get">
		<input type="hidden" name="qna_num" 
			value="${qnaVo.qna_num}" />
		<input type="hidden" name="qna_title" 
			value="${qnaVo.qna_title}" />
		<input type="hidden" name="qna_ref" 
			value="${qnaVo.qna_ref}" />
		<input type="hidden" name="qna_success" 
			value="${qnaVo.qna_writer}" />
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
				action="/board/qnaUpdate">
			<input type="hidden" name="qna_num" value="${qnaVo.qna_num}"/>
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
				<input type="text" id="qna_title" 
						name="qna_title" value="${qnaVo.qna_title}" style="border:none" 
						readonly/></td>
				<th scope="row">답변여부</th>
				<td>
					<c:choose>
						<c:when test="${qnaVo.qna_success == 'n'}">
							미답변
						</c:when>
						<c:otherwise>
							답변완료
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td class="form-group">
				<input type="text" id="qna_writer" 
						name="qna_writer" value="${qnaVo.qna_writer}" style="border:none"
						readonly/></td>
				<th scope="row">작성일</th>
				<td>${qnaVo.qna_regdate}</td>
			</tr>
			<tr>
				<th scope="row" colspan="5" class="form-group" >
				<textarea rows="10" id="qna_content" 
						name="qna_content" style="border:none" readonly>${qnaVo.qna_content}</textarea>
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
						<c:choose>
							<c:when test="${mem_id == 'admin' }">
								<button type="button" class="btn btn-outline-dark"
										id="btnAnswer">답변하기</button>
								<button type="button" class="btn btn-outline-dark"
										id="btnModify">수정</button>
								<button type="button" class="btn btn-outline-danger"
										id="btnDelete">삭제</button>		
							</c:when>
							<c:when test="${mem_id == qnaVo.qna_writer }">
								<button type="button" class="btn btn-outline-dark"
										id="btnModify">수정</button>
							<button type="button" class="btn btn-outline-danger"
										id="btnDelete">삭제</button>
							</c:when>
						</c:choose>
				</div>
			<!-- 댓글 작성 -->
	<c:if test="${mem_id != null && mem_id != ''}">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="qrContent">댓글내용</label>
				<input type="text" id="qrContent"
					class="form-control"/>
			</div>
			<div class="form-group" style="display:none;">
				<label for="qrWriter">작성자</label>
				<input type="text" id="qrWriter" value="${mem_id }"
					class="form-control" readonly/>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-outline-dark"
					id="btn_qnaReply">작성완료</button>
			</div>
		</div>
	</div>
	</c:if>
	<!-- // 댓글 작성 -->
	
	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead style="text-align:center;">
					<tr>
<!-- 						<th>번호</th> -->
						<th>댓글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="replyList" style="text-align:center;">
					
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
