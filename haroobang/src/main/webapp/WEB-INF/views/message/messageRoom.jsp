<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									<li class="contact" data-memberNo="${list.memberNo }" data-loginMemberNo="${login.memberNo }"> 
									<!-- <li class="contact active"> -->
										<div class="wrap">
											<span class="contact-status"></span> <img
												src="/haroobang/resources/upload/${list.savedFileName}" alt="" />
											<div class="meta">
												<p class="name">${list.name}</p>
												<c:forEach var="lists" items="${messageRoomList.messagesList}"
														varStatus="index">
														<c:if test="${index.last}">
															<p class="preview">
															<c:if test="${lists.messageRoomNo==messageRoomList.messageRoomNo }">
																<c:if test="${lists.memberNo==login.memberNo}"><span>You: </span></c:if>
																${lists.content}
															</c:if>															
															</p>
														</c:if>
												</c:forEach>
											</div> 
										</div>
									</li>
									</c:forEach>
									</c:forEach>
									
								</ul>
							</div>							
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	
		$(function(){	
			$(".messageSection").on("click",".contact",function(e){
				loginMemberNo = $(this).attr("data-loginMemberNo");
				memberNo = $(this).attr("data-memberNo");
				$(".messageSection").load("messageRoomBoxes.action?memberNo="+memberNo+"&loginMemberNo="+loginMemberNo);
				/* location.replace("messageRoomBoxes.action?memberNo="+memberNo+"&loginMemberNo="+loginMemberNo); */
			});		
		});
	</script>
	
	
	<jsp:include page="../include/footer.jsp" />
	<jsp:include page="../include/js.jsp" />
	<script src="/haroobang/resources/js/chat.js"></script>

</body>

</html>