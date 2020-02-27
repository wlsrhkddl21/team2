<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<script>
$(document).ready(function() {
	// 	수정 버튼
// 	$("#btnModify").click(function() {
// 		$("#not_title").prop("readonly", false);
// 		$("#not_content").prop("readonly", false);
// 		$("#not_title").css("border","1px solid");
// 		$("#not_content").css("border","1px solid");
// 		$(this).hide(100);
// 		$("button[type=submit]").show(100);
// 		$("#btnCancel").show(100);
// 		$("#btnHot").show(100);
// 		if("${boardVo.not_hot}" == 1) {
// 			console.log("중요공지임");
// 			$("#btnHot").hide(100);
// 			$("#btnHotCancel").show(100);
// 		}
// 	});
	
	// 목록 버튼
	$("#btnListAll").click(function(){
		location.href = "/review/reviewBoard";
	});
	// 삭제 버튼
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")) {
			$("#frmList").attr("action", "/review/reviewDelete").submit();	
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
	
	// 댓글 작성완료 버튼
	$("#btn_reply").click(function(){
		var rep_bno = "${reviewVo.rev_num}";
		var rep_content = $("#repContent").val();
		var rep_writer = "${mem_id}";
		var sendData = {
				"rep_bno" : rep_bno,
				"rep_content" : rep_content,
				"rep_writer" : rep_writer
		};
		console.log(sendData);
		var url = "/reviewReply/insertReply";
		
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
				$("#repContent").val("");
			}
			
		});
	});
	
	
	// 댓글 목록 불러오기
	function replyList() {
		$("#replyList").empty();
		var url = "/reviewReply/list/${reviewVo.rev_num}";
		$.getJSON(url, function(rData) {
			console.log(rData);
			var strHtml = "";
			$(rData).each(function(){
				strHtml += "<tr>";
				strHtml += "<td>" + this.rep_num +"</td>";
				strHtml += "<td>" + this.rep_content + "</td>";
				strHtml += "<td>" + this.rep_writer + "</td>";
				strHtml += "<td>" + dateString(this.rep_date) + "";
				if("${mem_id}" == this.rep_writer) {
					strHtml += "&nbsp;&nbsp;&nbsp;<button type='button' class='btn-xs btn btn-outline-dark btnReplyUpdate'";
					strHtml += " data-rno='" + this.rep_num + "'";
					strHtml += " data-reply_text='" + this.rep_content + "'";
					strHtml += " data-replyer='" + this.rep_writer + "'>수정</button>";
					strHtml += " <button type='button' class='btn-xs btn btn-outline-danger btnReplyDelete'";
					strHtml += " data-rno='" + this.rep_num + "'";
					strHtml += " data-bno='" + this.rep_bno + "'>삭제</button></td>";	
				}
				strHtml += "</tr>";
			});
			$("#replyList").append(strHtml); // <tbody>의 자식 엘리먼트로 html을 추가
		});
	}
	
	// 댓글 삭제 버튼
	$("#replyList").on("click", ".btnReplyDelete", function() {
		console.log("댓글 삭제 버튼");
		var rep_num = $(this).attr("data-rno");
		var url = "/reviewReply/delete/" + rep_num ;
		
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
	
	//댓글 수정 버튼
	$("#replyList").on("click", ".btnReplyUpdate", function() {
		console.log("댓글 수정 버튼");
		var rep_num = $(this).attr("data-rno");
		var rep_content = $(this).attr("data-reply_text");
		var rep_writer = $(this).attr("data-replyer");
		$("#modal_rno").val(rep_num);
		$("#modal_reply_text").val(rep_content);
		$("#modal_replyer").val(rep_writer);
		$("#modal-a").trigger("click");
		$("#myModal").modal("show"); 
	});
	// 댓글 모달창 완료 버튼
	$("#btnModalReply").click(function(){
		console.log("댓글완료");
		var rep_num = $("#modal_rno").val();
		var rep_content = $("#modal_reply_text").val();
		var rep_writer = $("#modal_replyer").val();
		
 		var sendData = {
				"rep_num" : rep_num,
 				"rep_content" : rep_content,
 				"rep_writer" : rep_writer
 		}
 		var url = "/reviewReply/update";
		
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
	function image() {
		console.log("실행됨");
		$(".revImage").each( function() {
			var fileName = $(this).attr("data-img");
//			console.log("fileName:" + fileName);
//			console.log(thumbnail);
			$(this).attr("src", "/review/displayFile?fileName="+ fileName);
		});
	};
	image();
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


	<form id="frmList" action="/review/reviewBoard" method="get">
		<input type="hidden" name="rev_num" 
			value="${reviewVo.rev_num}" />
		<input type="hidden" name="page" 
			value="${pagingDto.page}"/>
		<input type="hidden" name="perPage" 
			value="${pagingDto.perPage}"/>
	</form>

	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-10 main_grid_contact" >
			<br>
			<form id="myform" role="form" method="get" 
				action="/review/reviewContent" enctype="multipart/form-data">
			<input type="hidden" name="rev_num" value="${reviewVo.rev_num}"/>
			<input type="hidden" name="page" value="${pagingDto.page}"/>
			<input type="hidden" name="perPage" value="${pagingDto.perPage}"/>
			<table class="table" >
		<colgroup>
			<col style="width:10%;">
			<col style="width:50%;">
			<col style="width:10%;">
			<col style="width:40%;">
		</colgroup>
		<tbody >
			<tr>
				<th scope="row">제목</th>
				<td class="form-group">
				<input type="text" id="rev_title" 
						name="rev_title" value="${reviewVo.rev_title}" style="border:none" 
						readonly/></td>
				<th scope="row">조회수</th>
				<td>${reviewVo.rev_viewcount}</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td class="form-group">
				<input type="text" id="rev_writer" 
						name="rev_writer" value="${reviewVo.rev_writer}" style="border:none"
						readonly/></td>
				<th scope="row">작성일</th>
				<td>${reviewVo.rev_regdate}</td>
			</tr>
			<tr>
				<th scope="row" colspan="4" class="form-group" style="text-align:center; width:380px;">						
					<c:if test="${not empty reviewVo.rev_image}">
						<img class="revImage" alt="도시락" data-img="${reviewVo.rev_image}" style="">
					</c:if>			
				</th>
			</tr>
			<tr>	
				<th scope="row" colspan="5" class="form-group" >		
					<textarea rows="3" id="rev_content" 
						name="rev_content" style="border:none" readonly>${reviewVo.rev_content}</textarea>
				</th>
			</tr>	
			
			
		</tbody>
	</table>
			
			<hr>
			
			
			</form>
				<div style="clear:both;">
				<c:if test="${ mem_id == 'admin' || mem_id == reviewVo.rev_writer }">
					
					<button type="button" class="btn btn-outline-danger"
						id="btnDelete">삭제</button>				
				</c:if>
					<button type="button" class="btn btn-outline-dark"
						id="btnListAll">목록</button>
				</div>
			<!-- 댓글 작성 -->
	<c:if test="${mem_id != null && mem_id != ''}">
	<div class="row">
		<div class="col-md-12">
<!-- 			<div class="form-group"> -->
<!-- 				<label for="repWriter">작성자</label> -->
<%-- 				<input type="text" id="repWriter" value="${mem_id}" --%>
<!-- 					class="form-control" readonly/> -->
<!-- 			</div> -->
			<div class="form-group">
				<label for="repContent">댓글내용</label>
				<input type="text" id="repContent"
					class="form-control"/>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-outline-dark"
					id="btn_reply">작성완료</button>
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
<%-- 					<c:if test="${mem_id == reviewVo.rev_writer}"> --%>
<!-- 						<th>수정</th> -->
<!-- 						<th>삭제</th> -->
<%-- 					</c:if> --%>
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
