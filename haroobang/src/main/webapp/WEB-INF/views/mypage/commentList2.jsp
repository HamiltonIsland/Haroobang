<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	<title>LastReservation</title>    

	<!--
            CSS
            ============================================= -->
	<jsp:include page="../include/css.jsp"/>
</head>

<body id="category">

	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp"/>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>이전 예약 목록</h1>
					
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
						<li class="main-nav-list"><a href="#">
							<span class="lnr lnr-arrow-right"></span>내가 찜한 숙소</a>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span
								 class="lnr lnr-arrow-right"></span>내 예약 목록</a>
							<ul class="collapse" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }">현재 예약 목록</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }">이전 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span
								 class="lnr lnr-arrow-right"></span>내 숙소 관리</a>
							<ul class="collapse" id="officeProduct" data-toggle="collapse" aria-expanded="false" aria-controls="officeProduct">
								<li class="main-nav-list child"><a href="#">승인 대기중 / 등록된 숙소</a></li>
								<li class="main-nav-list child"><a href="#">내 숙소 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a href="/haroobang/mypage/commentList.action?memberno=${ login.memberNo }"  style="color: #ffc107;">
							<span class="lnr lnr-arrow-right"></span>내 후기 관리</a>
						</li>
						
						<li class="main-nav-list"><a href="/haroobang/account/profile.action">
							<span class="lnr lnr-arrow-right"></span>내 정보 수정</a>
						</li>
						
					</ul>
				</div>
				
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
						<a href="#" class="active">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
						<a href="#">6</a>
						<a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="cart_area" style="padding-top:10px">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive" style="text-align: center">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">숙소정보</th>
								<th scope="col" style="width:64px;">별점</th>
								<th scope="col">내용</th>
								<th scope="col">등록날짜</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="mycomment" items="${ mycomments }">
							<tr>
								<td>
									<div >
										<a href="/haroobang/room/roomDetail.action?roomNo=${mycomment.roomNo}">
											<img style="height: 100px; width: 100px" src="/haroobang/resources/img/cashPayment.jpg" alt="">
										</a>
										<a href="/haroobang/room/roomDetail.action?roomNo=${mycomment.roomNo}">
											<p>${mycomment.roomNo }</p>
										</a>
									</div>
								</td>
								<td>
									<h5>${mycomment.rates } 점</h5>
								</td>
								<td>
									<h5>${mycomment.content }</h5>
								</td>
								<td>
                                    <h5>${mycomment.regDate}</h5>
                                </td>
								
							</tr>
						</c:forEach>
						</tbody>

					</table>
				</div>

			</div>

		</div>

	</section>
				<!-- End Best Seller -->
				
			</div>
		</div>
	</div>

	
	<br><br><br><br><br><br><br><br>

	<!-- start footer Area -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- End footer Area -->
	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>