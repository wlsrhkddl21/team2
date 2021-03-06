<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	// 	수정 버튼
	$("#btnModify").click(function() {
		$("#not_title").prop("readonly", false);
		$("#not_content").prop("readonly", false);
		$("#not_title").css("border","1px solid");
		$("#not_content").css("border","1px solid");
		$(this).hide(100);
		$("button[type=submit]").show(100);
		$("#btnCancel").show(100);
		$("#btnHot").show(100);
		if("${boardVo.not_hot}" == 1) {
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
	// 수정취소 버튼
	$("#btnCancel").click(function(){
		$("#not_title").prop("readonly", true);
		$("#not_content").prop("readonly", true);
		$("#not_title").css("border","none");
		$("#not_content").css("border","none");
		$("button[type=submit]").hide(100);
		$("#btnHotCancel").hide(100);
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
	// 댓글 작성완료 버튼
	$("#btn_ntReply").click(function(){
		var ntbno = "${boardVo.not_num}";
		var ntrcontent = $("#ntRcontent").val();
		var ntrwriter = $("#ntRwriter").val();
		var sendData = {
				"ntbno" : ntbno,
				"ntrcontent" : ntrcontent,
				"ntrwriter" : ntrwriter
		};
		console.log(sendData);
		var url = "/replies/register";
		
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
	
	
	// 댓글 목록 불러오기
	function replyList() {
		$("#replyList").empty();
		var url = "/replies/all/${boardVo.not_num}";
		$.getJSON(url, function(rData) {
			console.log("rdata:" + rData);
			var strHtml = "";
			if(rData == "" || rData == null) {
				strHtml += "<tr>";
				strHtml += "<td colspan='5'> 댓글이 없습니다. </td>";
			} else if (rData != ""){
				$(rData).each(function(){
					strHtml += "<tr>";
//	 				strHtml += "<td>" + this.ntrno +"</td>";
					strHtml += "<td>" + this.ntrcontent + "</td>";
					strHtml += "<td>" + this.ntrwriter + "</td>";
					strHtml += "<td>" + dateString(this.ntrdate) + "</td>";
					if("${mem_id}" == this.ntrwriter || "${mem_id}" == "admin") {
						strHtml += "<td><button type='button' class='btn btn-outline-dark btnReplyUpdate'";
						strHtml += " data-rno='" + this.ntrno + "'";
						strHtml += " data-reply_text='" + this.ntrcontent + "'";
						strHtml += " data-replyer='" + this.ntrwriter + "'>수정</button></td>";
						strHtml += "<td><button type='button' class='btn btn-outline-danger btnReplyDelete'";
						strHtml += " data-rno='" + this.ntrno + "'";
						strHtml += " data-bno='" + this.ntbno + "'>삭제</button></td>";	
					} else {
						strHtml += "<td></td><td></td>";	
					}
					strHtml += "</tr>";
				});
			}
			$("#replyList").append(strHtml); // <tbody>의 자식 엘리먼트로 html을 추가
			$("#ntRcontent").val("");
		});
	}
	// 댓글 수정 버튼
	$("#replyList").on("click", ".btnReplyUpdate", function() {
		console.log("댓글 수정 버튼");
		var ntrno = $(this).attr("data-rno");
		var ntrcontent = $(this).attr("data-reply_text");
		var ntrwriter = $(this).attr("data-replyer");
		$("#modal_rno").val(ntrno);
		$("#modal_reply_text").val(ntrcontent);
		$("#modal_replyer").val(ntrwriter);
		$("#modal-a").trigger("click");
		$("#myModal").modal("show"); 
	});

	// 댓글 삭제 버튼
$("#replyList").on("click", ".btnReplyDelete", function() {
		console.log("댓글 삭제 버튼");
	if (confirm("댓글을 삭제하시겠습니까?")) {
		var ntrno = $(this).attr("data-rno");
		var url = "/replies/delete/" + ntrno ;
		
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
	}		
	});
		} // $.ajax()
	});
	
	// 댓글 모달창 완료 버튼
	$("#btnModalReply").click(function(){
		console.log("댓글완료");
		var ntrno = $("#modal_rno").val();
		var ntrcontent = $("#modal_reply_text").val();
		var ntrwriter = $("#modal_replyer").val();
		
		var sendData = {
				"ntrno" : ntrno,
				"ntrcontent" : ntrcontent,
				"ntrwriter" : ntrwriter
		}
		var url = "/replies/update";
		
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
			<br>
			<form id="myform" role="form" method="post" 
				action="/board/ntUpdate">
			<input type="hidden" name="not_num" value="${boardVo.not_num}"/>
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
				<input type="text" id="not_title" 
						name="not_title" value="${boardVo.not_title}" style="border:none" 
						readonly/></td>
				<th scope="row">조회수</th>
				<td>${boardVo.not_viewcount}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td class="form-group">
				<input type="text" id="not_writer" 
						name="not_writer" value="${boardVo.not_writer}" style="border:none"
						readonly/></td>
				<th scope="row">작성일</th>
				<td>${boardVo.not_regdate}</td>
			</tr>
			<tr>
				<th scope="row" colspan="5" class="form-group" >
				<textarea rows="10" id="not_content" 
						name="not_content" style="border:none" readonly>${boardVo.not_content}</textarea>
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
					<button type="button" class="btn btn-outline-dark" id="btnHot"
						style="display:none;">중요공지등록</button>
					<button type="button" class="btn btn-outline-dark" id="btnHotSuccess"
						style="display:none;">중요공지등록완료</button>
					<button type="button" class="btn btn-outline-danger" id="btnHotCancel"
						style="display:none;">중요공지등록삭제</button>
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
			<!-- 댓글 작성 -->
			<div style="height: 20px"></div>
	<c:if test="${mem_id != null && mem_id != ''}">
	<div class="row">
		<div class="col-md-12">
			<div class="form-group">
				<label for="ntRcontent">댓글내용</label>
				<input type="text" id="ntRcontent"
					class="form-control"/>
			</div>
			<div class="form-group" style="display:none;">
				<label for="ntRwriter">작성자</label>
				<input type="text" id="ntRwriter" value="${mem_id }"
					class="form-control" readonly/>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-outline-dark"
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
