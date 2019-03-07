<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
#messageSection {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 100vh;
	font-family: "proxima-nova", "Source Sans Pro", sans-serif;
	font-size: 1em;
	letter-spacing: 0.1px;
	color: #32465a;
	text-rendering: optimizeLegibility;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.004);
	-webkit-font-smoothing: antialiased;
}
</style>

</head>

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
	<br>
	
	<div class="messageSection">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div id="frame">
						<div id="sidepanel">
							<div id="profile">
								<div class="wrap">
									<img id="profile-img"
										src="/haroobang/resources/upload/${login.savedFileName}"
										class="online" alt="" />
									<p>${login.name }</p>
									
									<div id="status-options">
										<ul>
											<li id="status-online" class="active"><span
												class="status-circle"></span>
												<p>Online</p></li>
											<li id="status-away"><span class="status-circle"></span>
												<p>Away</p></li>
											<li id="status-busy"><span class="status-circle"></span>
												<p>Busy</p></li>
											<li id="status-offline"><span class="status-circle"></span>
												<p>Offline</p></li>
										</ul>
									</div>
									
								</div>
							</div>
							
							<div id="contacts">
							
								<ul>
									<c:forEach var="messageRoomList" items="${messageRoomList}">
									<c:forEach var="list" items="${messageRoomList.memberList}">
									<li class="contact" data-messageRoomNo="${messageRoomList.messageRoomNo }"data-name="${list.name}" data-picture="${list.savedFileName}"> 
									<!-- <li class="contact active"> -->
										<div class="wrap">
											<span class="contact-status online"></span> <img
												src="/haroobang/resources/upload/${list.savedFileName}" alt="" />
											<div class="meta">
												<p class="name">${list.name}</p>
												<p class="preview">Wrong. You take the gun, or you pull
													out a bigger one. Or, you call their bluff. Or, you do any
													one of a hundred and forty six other things.</p>
											</div> 
										</div>
									</li>
									</c:forEach>
									</c:forEach>
								</ul>
							</div>

						</div> 
						<div class="content">
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#contacts").on("click",".contact",function(e){
				var roomNo = $(this).attr("data-messageRoomNo");
				var name = $(this).attr("data-name");
				var picture = $(this).attr("data-picture");
				$(".content").load("messageRoomBox.action?",{"roomNo":roomNo,"name":name,"picture":picture});
			});
			
		});
	</script>

	<!--================End Product Description Area =================-->
	<br>
	<jsp:include page="../include/footer.jsp" />
	<jsp:include page="../include/js.jsp" />

</body>

</html>