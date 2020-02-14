<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
#fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dashed blue;
	background-color: yellow;
	margin: auto;
}
#buttonDiv {
	clear :both;
}
#uploadedList > div {
	float : left;
	margin : 20px;	
}
</style>
<script>
$(function(){
	$("#btnList").click(function(){
		$("#frmList").attr("action", "/board/notice");
		$("#frmList").submit();
	});
	
	$("#fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	$("#fileDrop").on("drop", function(e){
		e.preventDefault();
		var file = e.originalEvent.dataTransfer.files[0];
// 		console.log(file);
		var formData = new FormData(); // <form>
		formData.append("file", file);	// <input name="file"/>
		var url = "/upload/uploadAjax"; // uploadController
		
		//<form enctype="multipart/form-data"
		// -> 기본값 : application/x-www-form-urlencoded
		// processData
		$.ajax({
			"type" : "post",
			"url" : url,
			"processData" : false,
			"contentType" : false,
			"data" : formData,
			"success" : function(fullName){
				console.log(fullName); // 2020/1/20/495e7877-8144-4da7-92f5-a3efdadce1b6_수국.jpg
				// 파일명 얻기
				var underScoreIndex = fullName.indexOf("_");
				var fileName = fullName.substring(underScoreIndex + 1); // 수국.jpg
				// 썸네일 이미지의 이름 얻기
				var thumbnailName = getThumbnailName(fullName);
				console.log("thumbnailName:" + thumbnailName);
				var isImage = checkImage(thumbnailName);
				var html = "<div data-filename='"+ fullName +"'>";
				if(isImage == true){
					html +=  
						"<img class='img-thumbnail' src='/upload/displayFile?fileName=" + thumbnailName + "'/><br>"
				} else {
					html += 
						"<img class='img-thumbnail' src='/resources/images/file_image.png'/><br>"
				}
					html += "<span>"+ fileName +"</span>" +
							"<a href='" + fullName + "' class='attach-del'><span class='pull-right'>x</span></a>" +
				 		  "</div>";
				$("#uploadedList").append(html);
			}
		}); // $.ajax
	});// $("#fileDrop").on("drop",
	
	// submit버튼
	$("#btnSubmit").click(function(){
// 		var upDiv = $("#uploadedList > div");
// 		upDiv.each(function(index){
// 			var fileName = $(this).attr("data-filename");
// 			console.log("fileName:" + fileName);
// 			var hiddenInput = "<input type='hidden' name='files["+index+"]'"+
// 							  "value='" + fileName + "'/>";
// 			$("#registerForm").prepend(hiddenInput);
// 		});
		$("#registerForm").submit();  //폼전송
	});
	
	// 첨부파일 삭제 링크
	$("#uploadedList").on("click", ".attach-del", function(e){
		var that = $(this);
		e.preventDefault();
		var fullName = that.attr("href");
		console.log("fullName:" + fullName);
		var url = "/upload/deleteFile";
		var sendData = {"fileName" : fullName};
		$.get(url, sendData, function(rData){
			console.log(rData);
			if (rData == "success"){
				that.parent().remove();
			}
		});
		
	});
});
</script>
<div class="container-fluid">
${pagingDto }
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<div style="height: 20px"></div>
		<h3 class="title-w3ls text-center text-bl mb-5">공지사항 작성</h3>
	<form id="frmList" action="/board/notice">
		<input type="hidden" name="page" value="${pagingDto.page }"/>
		<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
	</form>
	<div class="row">
		<div class="col-md-12 main_grid_contact">
			<!--  action 을 생략하면 현재경로 : /board/register -->
			<form role="form" method="post" id="registerForm" style="padding:30px">
				<input type="hidden" name="page" value="${pagingDto.page }"/>
				<input type="hidden" name="perPage" value="${pagingDto.perPage }"/>
				<div class="form-group">
					<label for="not_title">Title</label>
					<input type="text" class="form-control" id="not_title" 
						name="not_title"/>
				</div>
				<div class="form-group">
					<label for="not_conetent">Content</label>
					<textarea class="form-control" rows="5" id="not_content" 
						name="not_content"></textarea>
				</div>
				<div class="form-group">
					<label for="not_writer">writer</label>
					<input type="text" class="form-control" id="not_writer" 
						name="not_writer" />
				</div>
				<div class="form-group" id="buttonDiv">
				<button type="button" class="btn btn-primary" id="btnSubmit">
					Submit
				</button>
				<button type="button" class="btn btn-primary" id="btnList">
					List All
				</button>
				</div>
			</form>
		</div>
	</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>