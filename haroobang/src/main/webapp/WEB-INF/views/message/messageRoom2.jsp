<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Karma Shop</title>
<!--
			CSS
			============================================= -->
<jsp:include page="../include/css.jsp" />
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#messageSection").on("click","#submit",function(e){
			
			e.preventDefault();
			e.stopPropagation();
			
			var data = $("#messageform").serialize()
			
			$.ajax({
				data:data,
				method:"post",
				url:"writeMessage.action",
				success:function(data,status,xhr){
					$("#messageSection").load(data)
				}
				
			}) 			
			
		})
		
	});

</script>


<body>

	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Message</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">message</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!--================Product Description Area =================-->
<div id="messageSection">
	<div class="container">
		<div class="tab-content" id="myTabContent">
			<div class="row">
				<div class="col-lg-6">
					<div class="comment_list" style="padding: 10px">
						<div class="review_item"
							style="padding: 10px; background-color: yellow">
							<div class="media" style="padding: 10px">
								<div class="d-flex">
									<img src="/haroobang/resources/img/product/review-1.png" alt="">
								</div>
								<div class="media-body">
									<h4>Blake Ruiz</h4>
									<h5>12th Feb, 2018 at 05:56 pm</h5>
								</div>
							</div>
							<p style="padding: 10px">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
								nostrud exercitation ullamco laboris nisi ut aliquip ex ea
								commodo</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container"> 
		<div class="tab-content" id="myTabContent">
			<div class="row">
				<div class="col-lg-6">
					<div class="comment_list" style="padding: 10px">
						<div class="review_item"
							style="padding: 10px; background-color: black">
							<div class="media" style="padding: 10px">
								<div class="d-flex">
									<img src="/haroobang/resources/img/product/review-1.png" alt="">
								</div>
								<div class="media-body">
									<h4>Blake Ruiz</h4>
									<h5>12th Feb, 2018 at 05:56 pm</h5>
								</div>
							</div>
							<p style="padding: 10px">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
								nostrud exercitation ullamco laboris nisi ut aliquip ex ea
								commodo</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="container" style="padding: 10px; background-color: black">
		<div class="row">
			<div class="col-lg-4  col-md-6 col-sm-6" style="margin: 0 auto">
				<div class="single-footer-widget">
					<div class="" id="mc_embed_signup">
						<form id="messageform" class="form-inline">
						<input type="hidden" id="memberNo" name="memberNo" value=${login.memberNo }>
						<input type="hidden" id="messageRoomNo" name="messageRoomNo" value="${messageRoomNo}">

							<div class="d-flex flex-row">
								<input type="text" class="form-control" id="content"name="content"
									placeholder="message......" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'message...... '" >
								
								<button class="click-btn btn-default" id="submit">
									<i class="fa fa-long-arrow-left" aria-hidden="true"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!--================End Product Description Area =================-->


	<jsp:include page="../include/js.jsp" />

</body>

</html>