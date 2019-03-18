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
					src="/haroobang/resources/img/haroobang.JPG" alt=""></a>
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
						<c:choose>
							<c:when test="${not empty login}">

								<c:choose>
									<c:when
										test='${ not empty login and login.userType eq "admin" }'>

										<li class="nav-item submenu dropdown"><a href="#"
											class="nav-link dropdown-toggle" data-toggle="dropdown"
											role="button" aria-haspopup="true" aria-expanded="false">관리자도구</a>
											<ul class="dropdown-menu">
												<li class="nav-item"><a class="nav-link"
													href="/haroobang/room/roomList.action">숙소</a></li>
												<li class="nav-item"><a class="nav-link"
													href="/haroobang/member/memberlist.action">회원</a></li>
												<li class="nav-item"><a class="nav-link"
													href="/haroobang/reservation/reservationList.action">예약 현황</a></li>
												<li class="nav-item"><a class="nav-link"
													href="/haroobang/room/reviewReport.action">신고</a></li>
												<li class="nav-item"><a class="nav-link"
													href="/haroobang/room/statistics.action">통계</a></li>
											</ul></li>

										<li class="nav-item"><a class="nav-link"
											href="/haroobang/account/logout.action">로그아웃</a></li>

									</c:when>
									<c:otherwise>

										<li class="nav-item"><a class="nav-link"
											href="/haroobang/room/roomList.action">숙소 보기</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/haroobang/room/roomRegister.action">내집 등록하기</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/haroobang/mypage/likeList.action?memberno=${ login.memberNo }">마이페이지</a></li>
											<li class="nav-item"><a class="nav-link"
											href="/haroobang/room/statistics.action">통계</a></li>
										<li class="nav-item"><a class="nav-link"
											href="/haroobang/account/logout.action">로그아웃</a></li>
									</c:otherwise>
								</c:choose>


							</c:when>

							<c:otherwise>
								<li class="nav-item"><a class="nav-link"
									href="/haroobang/room/roomList.action">숙소 보기</a></li>

								<li class="nav-item"><a class="nav-link"
									href="/haroobang/account/login.action">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/haroobang/account/register.action">회원 가입</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<c:if test="${not empty login }">
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a
								href="/haroobang/message/messageRoom.action"><span><i style="font-size:20px" class="fa fa-commenting-o" style=""></i></span><c:if test="${messageCount !=0}"><span
									class="badge badge-pill badge-danger"
									style="height: 15px; margin: 0 auto; line-height: 10px; color: white">${messageCount}</span></c:if></a></li>
							<c:if test="${login.userType != 'admin' }">
							<li class="nav-item"><a	href="/haroobang/message/messageRoom.action?memberNo=8">
							<span><i style="font-size:20px" class="fa fa-question-circle-o"></i></span></a></li>
							</c:if>
							<li class="nav-item"><a
								href="/haroobang/account/profile.action"><span> <img
										src="/haroobang/resources/upload/${login.savedFileName }"
										class="rounded-circle" style="height: 30px; width: 30px"
										alt="">
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

