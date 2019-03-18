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
	<style type="text/css">
   .txt_line { width:200px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
   </style>
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
						<li class="main-nav-list"><a href="/haroobang/mypage/likeList.action?memberno=${ login.memberNo }">
							<span class="lnr lnr-arrow-right"></span>내가 찜한 숙소</a>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span
								 class="lnr lnr-arrow-right"></span>내 예약 목록</a>
							<ul class="collapse show" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }" >현재 예약 목록</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }" style="color: #ffc107;">이전 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span
								 class="lnr lnr-arrow-right"></span>내 숙소 관리</a>
							<ul class="collapse" id="officeProduct" data-toggle="collapse" aria-expanded="false" aria-controls="officeProduct">
								<li class="main-nav-list child"><a href="/haroobang/mypage/waitingList.action?memberno=${login.memberNo }">승인 대기중 / 등록된 숙소</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/myRoomReservation.action?memberno=${ login.memberNo }">내 숙소 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a href="/haroobang/mypage/commentList.action?memberno=${ login.memberNo }">
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
						${ pager }
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
								<th scope="col">체크인</th>
								<th scope="col">체크아웃</th>
								<th scope="col">총결제금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="myroom" items="${ myrooms }">
							<tr>
								<td>
									<div class="media">
                                        <div>
                                <a href="/haroobang/mypage/lastReservationDetail.action?roomno=${ myroom.roomNo }&startdate=${ myroom.startDate }">
                                <c:choose>
									<c:when test="${not empty myroom.roomAttachList}">
										<c:forEach var="attach" items="${myroom.roomAttachList}">
                                			<img style="height: 100px; width: 100px"
												src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
												onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<img style="width: 100px; height: 100px" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose>
								</a>
                                        </div>
                                        
                                        <div class="media-body">
                                            <a href="/haroobang/mypage/lastReservationDetail.action?roomno=${ myroom.roomNo }&startdate=${ myroom.startDate }" class="txt_line">${myroom.roomVO.roomName}</a>
                                        </div>
                                        
                                    </div>
								</td>
								<td>
									<h5>${ myroom.startDate }</h5>
								</td>
								<td>
									<h5>${ myroom.endDate }</h5>
								</td>
								<td>
                                    <h5>${ myroom.totalPrice } 원</h5>
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