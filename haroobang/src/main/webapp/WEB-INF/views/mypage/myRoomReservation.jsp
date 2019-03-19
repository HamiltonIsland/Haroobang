<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Loom List</title>
<!-- 썅 -->
<!-- CSS ============================================= -->
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">

<style type="text/css">
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #000000;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}


.overlay {
	transition: .5s ease;
	opacity: 1;
	position: absolute;
	top: 15%;
	left: 85%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
	z-index: 1;
	font-size: 40px
}

.span3 .overlay2 {
	transition: .5s ease;
	position: absolute;
	opacity: 0;
	top: 15%;
	left: 85%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
	font-size: 40px
}


</style>
</head>

<body id="category">

	<!-- Start Header Area -->
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>내 숙소 리스트 </h1>
				</div>
			</div>
		</div>
	</section>
	
	<!-- End Banner Area -->
	
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">My page</div>
					<ul class="main-categories">
						<li class="main-nav-list"><a href="/haroobang/mypage/likeList.action?memberno=${ login.memberNo }"> <span
								class="lnr lnr-arrow-right"></span>내가 찜한 숙소
						</a></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span
								class="lnr lnr-arrow-right"></span>내 예약 목록</a>
							<ul class="collapse" id="homeClean" data-toggle="collapse"
								aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a
									href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }"
									>현재 예약 목록</a></li>
								<li class="main-nav-list child"><a
									href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }">이전
										예약 목록</a></li>
							</ul></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#officeProduct" aria-expanded="true"
							aria-controls="officeProduct"><span
								class="lnr lnr-arrow-right"></span>내 숙소 관리</a>
							<ul class="collapse show" id="officeProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="officeProduct">
								<li class="main-nav-list child"><a href="/haroobang/mypage/waitingList.action?memberno=${ login.memberNo }">승인 대기중 /
										등록된 숙소</a></li>
								<li class="main-nav-list child"><a  style="color: #ffc107;" href="/haroobang/mypage/myRoomReservation.action?memberno=${ login.memberNo }">내 숙소 예약 목록</a></li>
							</ul></li>

						<li class="main-nav-list"><a
							href="/haroobang/mypage/commentList.action?memberno=${ login.memberNo }">
								<span class="lnr lnr-arrow-right"></span>내 후기 관리
						</a></li>

						<li class="main-nav-list"><a
							href="/haroobang/account/profile.action"> <span
								class="lnr lnr-arrow-right"></span>내 정보 수정
						</a></li>

					</ul>
				</div>

			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					
					<div class="sorting mr-auto">
						<div class="bottom_button">
							<div class="button-group-area mt-40">
								<a href="javascript:;" class="genric-btn primary circle" id="refund">체크인승인</a>
							</div>
						</div>
					</div>
					<div class="pagination">
				<%-- 	${ pager } --%>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="cart_area" style="padding-top: 10px">
					<div class="container">
						<div class="cart_inner">
							<!-- single product -->
							<div class="table-responsive" style="text-align: center">
							<c:choose>
							<c:when test="${not empty myreservations}">
							<table class="table">
									<thead>
										<tr>
											<th scope="col">숙소정보</th>
											<th scope="col">결제수단</th>
											<th scope="col">숙박기간</th>
											<th scope="col">결제일시</th>
											<th scope="col">총결제</th>
											<th scope="col">체크인승인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="myreservations" items="${myreservations}">
											<tr class="search"> 
												<td>
													<div class="media">
														<div class="d-flex">
															<input type="checkbox" class="checkrefund" data-reservationNo="${myreservations.reservationNo}"> 
															<a href="/haroobang/mypage/myRoomReservationDetail.action?reservationNo=${myreservations.reservationNo}">
																<c:choose>
																	<c:when test="${not empty myreservations.roomAttachList}">
																				<img style="width: 100px; height: 100px"
																					src="/haroobang/resources/upload/${myreservations.roomAttachList[0].savedFileName }"
																					alt=""
																					onerror="this.src = '/haroobang/resources/upload/default.jpg'">
																	</c:when>
																	<c:otherwise>
																		<img style="width: 100px; height: 100px"
																			src="/haroobang/resources/img/product/p1.jpg" alt="">
																	</c:otherwise>
																</c:choose>
															</a>
														</div>
													</div>
												</td>

												<td>
													<h5>${myreservations.payment}</h5>
												</td>

												<td>
													<h5>${myreservations.startDate}~ ${myreservations.endDate}</h5>
												</td>

												<td>
													<h5>${myreservations.regDate}</h5>
												</td>

												<td>
													<h5>${myreservations.totalPrice}원</h5>
												</td>
												<td>
				                                    <c:if test='${myreservations.checkin == true}'>
				                       					<h5 style="color: blue;">체크인승인완료</h5>
				                       				</c:if>
				                       				<c:if test='${myreservations.checkin == false}'>
				                       					<h5 style="color: red;">체크인미승인</h5>
				                       				</c:if>
				                                </td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
								<hr>
							</div>
							</c:when>
							<c:otherwise>
							<h3 style="color: gray;margin-top: 10%">예약된 내역이 없습니다.</h3>
							</c:otherwise>
							</c:choose>
								
						</div>
					</div>
				</section>
				<!-- End Best Seller -->

			</div>
		</div>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<!-- start footer Area -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End footer Area -->

	<jsp:include page="/WEB-INF/views/include/js.jsp" />
  	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  	<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  	
  	<script type="text/javascript">

	
	</script>

</body>

</html>