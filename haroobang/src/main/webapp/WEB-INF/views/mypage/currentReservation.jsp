<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<ul class="collapse show" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }" style="color: #ffc107;">현재 예약 목록</a></li>
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
						
						<li class="main-nav-list"><a href="#">
							<span class="lnr lnr-arrow-right"></span>내 후기 관리</a>
						</li>
						
						<li class="main-nav-list"><a href="#">
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
				<table class="table">
		       <thead>
							<tr class="bottom_button">
								<td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td>
								<td>
					<div class="button-group-area mt-40">
                                    	<a href="#" class="genric-btn primary circle">환불</a>
									</div>
								</td>
							</tr>
							</thead>
						</table>
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						<div class="table-responsive">
                    <table class="table" id="search">
                        <thead>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Payment</th>
                                <th scope="col">Stay</th>
                                <!-- <th scope="col">Check IN or OUT</th> -->
                                <th scope="col">Settlement day</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="current" items="${currents}">
                         
                        	<tr class="search">
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                        <input type="checkbox">
                                <a href="/haroobang/room/roomDetail.action?roomNo=${current.roomNo}">
                                <c:choose>
									<c:when test="${not empty current.roomAttachList}">
										 <div class="main-carousel" data-flickity='{ "autoPlay": true }'>
										<c:forEach var="attach" items="${current.roomAttachList}">
												  
												  <img style="width: 50px; height: 50px" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise>
										<img style="width: 50px; height: 50px" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose>
								</a>
                                        </div>
                                        
                                        <div class="media-body">
                                            <p class="searchh" style="overflow: hidden; text-overflow: ellipsis; width: 100px; height: 20px;">${current.roomVO.roomName}</p>
                                        </div>
                                        
                                    </div>
                                </td>
                                
                                <td>
                                    <h5>${current.payment}</h5>
                                </td>
                                
                                <td>
                                    <h5>${current.startDate} ~ ${current.endDate}</h5>
                                </td>
                                
                              <%--   <td>
                                    <h5>
                                    <c:choose>
                                    	<c:when test='${not empty reservation.checkin and reservation.checkin eq true }'>
                                    		<h5 style="color: blue; text-align: center;">Check-IN</h5>
                                    		
                                    		<c:if test='${ reservation.checkin eq 2 }'>
                                    		<h5 style="color: red;">Check-OUT</h5>
                                    		</c:if>
                                    		
                                    	</c:when>
                                    	<c:otherwise>
                                    		<h5 style="color: red; text-align: center;">NOT Arrive</h5>
                                    	</c:otherwise>
                                    </c:choose>
                                    </h5>
                                </td> --%>
                                
                                <td>
                                    <h5>${current.regDate}</h5>
                                </td>
                                
                                <td>
                                    <h5>$${current.totalPrice}</h5>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
						
					</div>
				</section>
				<!-- End Best Seller -->
				
			</div>
		</div>
	</div>

	

	<!-- start footer Area -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- End footer Area -->

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item" style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item" style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span></div>
									<div class="category">Category: <span>Household</span></div>
									<div class="available">Availibility: <span>In Stock</span></div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are
										looking for something that can make your interior look awesome, and at the same time give you the pleasant
										warm feeling during the winter.</p>
									<a href="#" class="view-full">View full Details <span class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">Color:
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
										<span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity:
										<input type="text" class="quantity-amount ml-15" value="1" />
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
											<button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to Cart</span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
										<a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>