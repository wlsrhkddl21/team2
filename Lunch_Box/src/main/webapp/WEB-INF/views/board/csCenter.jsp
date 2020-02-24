<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- <link rel="stylesheet" type="text/css" href="http://www.homeal.net/_data/wing_homeal_temp.css"> -->
<link rel="stylesheet" href="/css/homeal.css">
<script type="text/javascript" src="http://www.homeal.net/wm_engine_SW/_engine/common/truelife.js?v=11"></script>
<script type="text/javascript" src="http://www.homeal.net/wm_engine_SW/_engine/common/auto_scroll.js"></script>
<script src="http://www.homeal.net/_skin/homeal/img/../jquery.cycle.all.js"></script>
<style>
 .csCenter_info { 
 	padding: 35px; 
 	border: 5px solid #ededed;
 	margin-top: 20px;
}
a {
  color: #000000;
  text-decoration: none;
  background-color: transparent;
  -webkit-text-decoration-skip: objects;
  cursor : pointer;
} 
</style>
<script>
$(document).ready(function(){
	$(".not_title").click(function(e){
		e.preventDefault();
		var not_num = $(this).attr("data-bno");
		$("input[name=not_num]").val(not_num);
		$("#frmRead").attr("action", "/board/ntRead");
		$("#frmRead").submit();
	});
	
	$("#faqTag").click(function(){
		$("#faq97").toggle();
	});
	
	$(".pdt_name").click(function(e) {
		e.preventDefault();
		// 		console.log("클릭됨");
		var pdt_num = $(this).attr("data-num");
		// 		location.href = "/admin/content";
		location.href = "/admin/content?pdt_num=" + pdt_num;
	});

		function thumbnail() {
			$(".pdtImg").each(
					function() {
						var fileName = $(this).attr("data-img");
//							console.log("fileName:" + fileName);
						var slice = fileName.lastIndexOf("/")
						var path = fileName.substring(0, slice + 1);
						var real = fileName.substring(slice + 1);
						var thumbnail = path + "s_" + real;
							console.log(thumbnail);
						$(this).attr(
								"src",
								"/review/displayFile?fileName="
										+ thumbnail);
					});
		}
		thumbnail();
});
</script>
<div class="container-fluid">
	<form id="frmRead" action="/board/notice" method="get">
		<input type="hidden" name="not_num"/>
		<input type="hidden" name="page" 
			value="${pagingDto.page }"/>
		<input type="hidden" name="perPage"
			value="${pagingDto.perPage }"/>
	</form>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div style="height: 20px;"></div>
			<h3 class="title-w3ls text-center text-bl mb-5">고객센터</h3>
			<div class="customer_info">
				<h3>런치박스 고객센터</h3>
				<strong>080-123-1234</strong>
				<span>평일 09시 ~ 17시, 점심 12시 ~ 13시(토/일  공휴일 휴무)</span>
			</div>
			<div class="row">
				<div class="col-md-2">
					<div style="height: 20px;"></div>
					<%@ include file="../include/csMenu.jsp"%>
				</div>
				<div class="col-md-10">
					<div class="row">
							<div class="csCenter_info text-center">
							<div id="customer">
    <div class="board_group box_left"> <!-- 작업 완료 후 'box_left' 클래스명 추가 -->
        <div class="title">
            <h4>공지사항</h4>
            <a href="/board/notice" class="more">더보기+</a>
        </div>
        
<table class="tbl_board">
	<caption class="hidden">공지사항</caption>
	<colgroup>
		<col>
		<col style="width:22%;">
	</colgroup>
	<thead>
		<tr>
			<th scope="col">제목</th>
			<th scope="col">날짜</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${hotList }" var="boardVo">
			<tr>
				<td><a data-bno="${boardVo.not_num}" class="not_title"> ${boardVo.not_title } </a></td>
				<td class=date><fmt:formatDate value="${boardVo.not_regdate }" 
						pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
		
		<c:forEach items="${listPage }" var="boardVo">
			<c:if test="${boardVo.not_hot == 0 }">
			<tr>
				<td><a data-bno="${boardVo.not_num}" class="not_title"> ${boardVo.not_title } </a></td>
				<td class=date><fmt:formatDate value="${boardVo.not_regdate }" 
						pattern="yyyy-MM-dd"/></td>
			</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>
    </div>
    <div class="board_group box_right">
        <div class="title">
            <h4>고객후기</h4>
            <a href="/review/reviewBoard" class="more">더보기+</a>
        </div>
        <!-- 개발 영역 (작업 완료 후 상단 div 클래스명 추가 필수) -->
        <table class="tbl_board prd div">
            <caption class="hidden">상품후기</caption>
            <colgroup>
                <col style="width:90px;">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">상품</th>
                <th scope="col">제목</th>
            </tr>
            </thead>
            <tbody>
            		<c:forEach items="${reviewList}" var="reviewVo">
							<tr>
								<c:if test="${not empty reviewVo.rev_image}">
									<td class="img" style="padding-top: 3px;">
										<img alt="상품이미지" class="pdtImg" style="height:50px;"
										data-img="${reviewVo.rev_image}"></td>
								</c:if>
								<td class="left"><a class="pdt_name" href="#"
									data-num="${reviewVo.rev_num}">${reviewVo.rev_title}</a></td>
							</tr>
					</c:forEach>
				</tbody>
        </table>
        <!-- //개발 영역 (작업 완료 후 상단 div 클래스명 추가 필수) -->
    </div>
    <div class="clear"></div>
    <div class="board_group">
        <div class="title">
            <h4>자주하는 질문</h4>
            <a href="/board/?db=basic_2" class="more">더보기+</a>
        </div>
        
<table class="tbl_board_faq">
	<caption class="hidden">자주하는 질문</caption>
	<colgroup>
		<col style="width:60px;">
		<col style="width:135px;">
		<col>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">구분</th>
			<th scope="col">분류</th>
			<th scope="col">제목</th>
		</tr>
	</thead>
	<tbody><tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">주문/결제/증빙</td>
			<td class="left subject" id="faqTag"><a href="javascript:faqTgg('97');">[호밀]현금영수증 발급 방법은요?</a></td>
		</tr>
		<tr class="faq_content" id="faq97" style="display:table-row;">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				트루라이프 호밀은 현금영수증 자진발급&nbsp;업체입니다.&nbsp;하여 증빙이 누락되는 부분은 전혀 없습니다. 다만, 결제 전 현금영수증 안내 부분을 꼼꼼히 읽어주시고, 확인해주시기 바라며, 홈페이지&nbsp;결제 시에는&nbsp;현금영수증 체크 부분을 정확히 체크 후 결제해 주시면 됩니다.! * 그 외 유선상으로&nbsp;연락 주실경우에는 현금영수증&nbsp;요청 고객님께서는&nbsp;원하시는 번호를 미리 안내해주시면 빠른 처리가 가능합니다.
			</td>
		</tr>
		<tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">BEST</td>
			<td class="left"><a href="javascript:faqTgg('95');">[호밀] 제품이 배송되지 않았어요!</a></td>
		</tr>
		<tr class="faq_content" id="faq95" style="display:none;">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				호밀 제품이 배송되지 않으셨나요? 만일 배송상 문제나, 제품상 문제로 호밀이 배송되지 않았을 경우에는 즉각 연락 부탁드립니다. 배송일 이후 3일 이후 연락해주시는 부분에 대해서는 확인 및 처리가 어려우므로, 배송은 반드시 확인해주시고, 가급적&nbsp;배송 후&nbsp;3일 이전&nbsp;연락 부탁드립니다.&nbsp;호밀 배송은&nbsp;폭설,&nbsp;폭우에도 정상적으로 진행되오니, 참고해주세요!!
			</td>
		</tr>
		<tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">BEST</td>
			<td class="left"><a href="javascript:faqTgg('94');">[호밀] 배송 가방은 어떻게 처리하나요? 다시 회수하나요?</a></td>
		</tr>
		<tr class="faq_content" id="faq94">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				호밀&nbsp;배송 가방과&nbsp;아이스팩(보냉팩)은 매일 밤 9시 이후로 호밀을 수령하신 자리에 다시 내놓으시면 담당 기사가 새로운 식단을 배송하면서 회수하는 체계로 운영됩니다. 단,&nbsp;배송 가방은3단계에 걸쳐&nbsp;검수-세척-재활용되고있으니&nbsp;배송 가방&nbsp;속에는 아이스팩(보냉팩)만 넣어주셔야 합니다.&nbsp;다 드신&nbsp;호밀 용기는 고객님 계신 지역 재활용 배출일자에 맞춰&nbsp;재활용 폐기 처리해주시면&nbsp;됩니다.
			</td>
		</tr>
		<tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">기타</td>
			<td class="left"><a href="javascript:faqTgg('93');">[호밀] 사용하지 않은 포크나 수저 등은 어떻게 하죠?</a></td>
		</tr>
		<tr class="faq_content" id="faq93">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				매일 넣어드리는 포크와 수저, 빨대를 사용하지 않는 고객님이 계시다면 모아두셨다가 회수용&nbsp;배송 가방&nbsp;속에 넣어 보내주시면 됩니다.
			</td>
		</tr>
		<tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">상품문의</td>
			<td class="left"><a href="javascript:faqTgg('92');">[호밀] 호밀 유통기한은 언제까지 인가요?</a></td>
		</tr>
		<tr class="faq_content" id="faq92">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				호밀 전체 식단의 경우 유통기한은 36시간을 가져가고 있으며, 냉장보관을 원칙으로 안내드리고 있습니다. 자세한 유통기한은 제품 각 라벨지에 표기되어있으니, 관련 사항은 반드시 라벨지를 확인 후&nbsp;섭취해주시기&nbsp;부탁드립니다.&nbsp;(꾸러미 식단의&nbsp;경우 라벨지 없이, 유통기한은 따로&nbsp;표기됩니다.)
			</td>
		</tr>
		<tr class="faq_subject">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_q.png" alt="Question"></td>
			<td class="left">멤버십/포인트</td>
			<td class="left"><a href="javascript:faqTgg('88');">[호밀]멤버십 적용은 어떻게 되나요?</a></td>
		</tr>
		<tr class="faq_content" id="faq88">
			<td class="type"><img src="http://www.homeal.net/_skin/homeal/img/bg/faq_a.png" alt="Answer"></td>
			<td colspan="2" class="left">
				호밀을 꾸준히 이용해주시는 고객님들에 한해 장기이용고객멤버십 혜택을 적용해 드리고 있습니다.
장기이용고객멤버십 혜택의 경우 결제 금액에 따라 누적금액으로 확인하여 적용되며,
금액대별 등급 및 관련 내용은 홈페이지 오른쪽 링크 멤버십 서비스 탭에서 확인해주시면 됩니다.
장기이용멤버십 혜택의 자세한 사항은 공지사항을 참고해주세요.^^
(트루라이프 자체 서비스로 혜택은 변경되거나, 수정될 수 있습니다.)
			</td>
		</tr>
	</tbody>
</table>
    </div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</div>
				<div class="col-md-2" style="height: 200px;"></div>
			</div>
		</div>
</div>
</div>
</div>
<%@ include file="../include/footer.jsp"%>