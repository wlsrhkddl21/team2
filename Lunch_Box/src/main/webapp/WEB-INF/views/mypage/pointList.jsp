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
						<div class="mypage_info text-center" style="width: 931.84px;">												
							<h4 class="text-center" style="margin-bottom: 15px;">포인트 내역</h4>											
							<c:choose>											
								<c:when test="${empty list}">										
									<div>포인트 내역이 없습니다.</div>									
								</c:when>										
								<c:otherwise>										
									<table class="table">									
										<tr>								
											<th>날짜</th>							
											<th>포인트</th>							
											<th>내용</th>							
										</tr>								
										<c:forEach items="${list }" var="pointVo">								
											<tr>							
												<td>${pointVo.point_date }</td>						
												<td>${pointVo.point }</td>						
												<td><c:choose>						
														<c:when test="${pointVo.point_type eq'buy' }">				
														일반 도시락 구매				
													</c:when>					
														<c:otherwise>				
														나만의 도시락 구매				
													</c:otherwise>					
													</c:choose> (<c:choose>					
														<c:when test="${pointVo.point>0 }">				
																적립		
															</c:when>			
														<c:otherwise>				
																사용		
															</c:otherwise>			
													</c:choose>)</td>					
											</tr>							
										</c:forEach>								
									</table>									
								</c:otherwise>										
							</c:choose>											
						</div>												
						<div class="col-md-2"></div>												
					</div>													
				</div>														
				<div class="col-md-2" style="height: 300px;"></div>														
			</div>															
		</div>																
	</div>																	
</div>																		
<%@ include file="../include/footer.jsp"%>																		
																		