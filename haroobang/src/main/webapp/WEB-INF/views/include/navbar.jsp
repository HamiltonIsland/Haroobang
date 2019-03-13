<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header_area sticky-header">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light main_box">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="/haroobang/home.action"><img
					style="height: 80px; width: 350px"
					src="/haroobang/resources/img/main5.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="/haroobang/home.action">Home</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Room</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link"
									href="/haroobang/room/roomList.action">Room List</a></li>

								<!-- <li class="nav-item"><a class="nav-link" href="/haroobang/checkout.action">Product Checkout</a></li> -->
								<!-- <li class="nav-item"><a class="nav-link" href="/haroobang/cart.action">Shopping Cart</a></li> -->
								<!-- <li class="nav-item"><a class="nav-link" href="/haroobang/confirmation.action">Confirmation</a></li> -->
							</ul></li>
						<!-- <li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							 aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/haroobang/member/memberlist.action">memberList</a></li>
							</ul>
						</li> -->
						<!-- 
						
						<li class="nav-item submenu dropdown active">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
							 aria-expanded="false">Pages</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="/haroobang/account/login.action">Login</a></li>
								<li class="nav-item active"><a class="nav-link" href="tracking.action">Tracking</a></li>
								<li class="nav-item"><a class="nav-link" href="elements.action">Elements</a></li>
							</ul>
						</li> -->

						<c:choose>
							<c:when test="${not empty login}">
								<c:if test='${ not empty login and login.userType eq "admin" }'>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/reservation/reservationList.action">RESERVATION</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/member/memberlist.action">memberList</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/room/reviewReport.action">reviewreportlist</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/account/logout.action">Log-Out</a></li>
								</c:if>
								<c:if test='${ not empty login and login.userType eq "user" }'>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/room/roomRegister.action">roomRegister</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }">MyPage</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/haroobang/account/logout.action">Log-Out</a></li>
								</c:if>
							</c:when>

							<c:otherwise>
								<li class="nav-item"><a class="nav-link"
									href="/haroobang/account/login.action">Log-In</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/haroobang/account/register.action">Register</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<c:if test="${not empty login }">
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a
								href="/haroobang/message/messageRoom.action"><span
									class="lnr lnr-bubble" ></span><span class="badge badge-pill badge-danger" style="height:15px;margin:0 auto;line-height: 10px;color:white">${messageCount}</span></a></li>
							<li class="nav-item"><a
								href="/haroobang/account/profile.action"><span>								
								<img src="/haroobang/resources/upload/${login.savedFileName }" class="rounded-circle" style="height: 30px;width:30px" alt="">
								</span></a></li>
							
						</ul>
					</c:if>
					<!-- <ul class="nav navbar-nav navbar-right">
						<li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
						<li class="nav-item">
							<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
						</li>
					</ul> -->
				</div>
			</div>
		</nav>
	</div>


	<!-- 	<div class="search_input" id="search_input_box">
		<div class="container">
			<form class="d-flex justify-content-between">
				<input type="text" class="form-control" id="search_input" placeholder="Search Here">
				<button type="submit" class="btn"></button>
				<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
			</form>
		</div>
	</div> -->
</header>

