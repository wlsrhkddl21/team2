<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="include/header.jsp" %>
	

	<!-- contact -->
	<section class="contact py-5" id="contact">
		<div class="container">
			<h3 class="title-w3ls text-center text-bl mb-5">로그인</h3>
			<div class="row mx-sm-0 mx-2">
				<!-- map -->
				<div class="col-lg-2 map">
					
				</div>
				<!-- //map -->
				<!-- contact form -->
				<div class="col-lg-8 main_grid_contact">
					<div class="form-w3ls p-md-5 p-4">
						<h4 class="mb-4 sec-title-w3 let-spa text-bl">Send us a message</h4>
						<form action="#" method="post">
							<div class="row">
								<div class="col-sm-6 form-group pr-sm-1">
									<input class="form-control" type="text" name="Name" placeholder="Name" required="">
								</div>
								<div class="col-sm-6 form-group pl-sm-1">
									<input class="form-control" type="email" name="Email" placeholder="Email"
										required="">
								</div>
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="Subject" placeholder="Subject"
									required="">
							</div>
							<div class="form-group">
								<input class="form-control" type="text" name="Phone Number" placeholder="Phone Number"
									required="">
							</div>
							<div class="form-group">
								<textarea name="message" placeholder="Message" required=""></textarea>
							</div>
							<div class="input-group1 text-right">
								<button class="btn" type="submit">Submit</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-2 map">
				</div>
				<!-- //contact form -->
			</div>
		</div>
	</section>
	<!-- //contact -->

	

	
<%@ include file="include/footer.jsp" %>