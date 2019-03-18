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

/* .span3:visited .overlay {
	opacity: 0;
} */

/* .membercheck:visited .overlay2{
	opacity: 1;
} */

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
					<h1>Room List</h1>
				</div>
			</div>
		</div>
	</section>
	
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-12 col-lg-11 col-md-10">
			<c:if test='${ not empty login and login.userType eq "admin" }'>
			<!-- Start Filter Bar -->
			<h3 class="text-heading">미승인 목록</h3>
			<!-- <div class="text-right col-lg-4"> -->
				<!-- <aside class="single_sidebar_widget search_widget">
		        	<div class="input-group">
		            	<input type="text" class="form-control" placeholder="Search Posts" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'">
		            	<span class="input-group-btn">
		            	<button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
		               	</span>
		            </div>
		        	<div class="br"></div>
		       </aside> -->
		       
		       <table class="table">
		       <thead>
							<tr class="bottom_button">
								<td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td>
					<div class="input-group">
		            	<input type="text" class="form-control" placeholder="Search by Keyword" id="keyword">
		            	<span class="input-group-btn">
		            	<button type="submit" class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
		               	</span>
		            </div>
								</td>
							</tr>
							</thead>
						</table>
	       <!-- </div> -->
	       
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<!-- <select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select> -->
					</div>
					<div class="sorting mr-auto">
						<!-- <select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select> -->
					</div>
					<div class="pagination">
					${ disPager }
						<!-- <a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a> -->
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list" id="disapprovalRoom"> <!-- id="search" -->
					<div class="row">
						<c:forEach var="disapproval" items="${disapproval}">
						<div class="col-lg-3 col-md-5 disapprovalNo search" data-roomno="${disapproval.roomNo}" >
							<div class="single-product" id="imglist${disapproval.roomNo}">
							<div class="span3" data-memberno="${ login.memberNo }">
							<c:choose>
									<c:when test="${not empty disapproval.roomAttachList}">
										 <div class="main-carousel" data-flickity='{ "autoPlay": true }'>
										<c:forEach var="attach" items="${disapproval.roomAttachList}">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
										</div>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose>
							
							<%-- <c:choose>
									<c:when test="${not empty disapproval.roomAttachList}">
										 <div class="slider">
										<c:forEach var="attach" items="${disapproval.roomAttachList}">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								
								
								<%-- <c:choose>
									<c:when test="${not empty disapproval.roomAttachList}">
									<div class="slideshow-container" id="imglist${disapproval.roomNo}">
										<c:forEach var="attach" items="${disapproval.roomAttachList}">
												<div class="mySlides fade">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
																		onerror="this.src = '/haroobang/resources/upload/default.jpg'">
												</div>	
										</c:forEach>
									</div>
									<br>
											
									<div style="text-align:center">
										<c:forEach var="attach" items="${disapproval.roomAttachList}">
											<span class="dot"></span>
										</c:forEach>  
									</div>
	
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								<!-- <img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt=""> -->
								<a href="/haroobang/room/roomDetail.action?roomNo=${disapproval.roomNo}">
								<div class="product-details">
									<h6 class="searchh">${disapproval.roomName}</h6>
									<div class="price">
										<h6>${disapproval.price}원</h6>
									</div>
									<div class="prd-bottom">
										<!-- <a href="" class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-heart"></span>
											<p class="hover-text">Wishlist</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-sync"></span>
											<p class="hover-text">compare</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a> -->
										
										<div class="button-group-area mt-40">
											<a href="javascript:;" class="genric-btn success circle" id='roomapproval${disapproval.roomNo}'>승인</a>
											<a href="javascript:;" class="genric-btn danger circle" id='deleteapproval${disapproval.roomNo}'>삭제</a>
										</div>
									</div>
								</div>
								</a>
							</div>
							</div>
						</div>
						</c:forEach>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting mr-auto">
						<!-- <select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select> -->
					</div>
					<div class="pagination">
					${ disPager }
						<!-- <a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a> -->
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start related-product Area -->
					<section class="related-product-area section_gap"></section>
					<!-- End related-product Area -->
				</c:if>
				<!-- Start Filter Bar -->
				<c:if test='${ not empty login and login.userType eq "admin" }'>
				<h3 class="text-heading">승인 목록</h3>
				</c:if>
				<table class="table">
		       <thead>
							<tr class="bottom_button">
								<td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td>
									<div class="input-group">
		            	<input type="text" class="form-control" placeholder="Search by Keyword" id="keyword2">
		            	<span class="input-group-btn">
		            	<button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
		               	</span>
		            </div>
								</td>
							</tr>
							</thead>
						</table>
				<!-- <div class="text-right">
					<aside class="single_sidebar_widget search_widget">
			        	<div class="input-group col-lg-4">
			            	<input type="text" class="form-control" placeholder="Search Posts" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Posts'">
			            	<span class="input-group-btn">
			            	<button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
			               	</span>
			            </div>
			        	<div class="br"></div>
			       </aside>
		       </div> -->
		       
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<!-- <select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select> -->
					</div>
					<div class="sorting mr-auto">
						<!-- <select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select> -->
					</div>
					<div class="pagination">
						${ pager }
						<!-- <a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a> -->
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list" id="search">
					<div class="row">
						<c:forEach var="room" items="${rooms}">
						<div class="col-lg-3 col-md-5 roomNos search" data-roomno="${room.roomNo}">
							<div class="single-product" id="imglist${room.roomNo}">
							
							<c:choose>
									<c:when test="${not empty room.roomAttachList}">
										 <div class="span3" data-memberno="${ login.memberNo }">
										 <div class="main-carousel" data-flickity='{ "autoPlay": true }'>
										<c:forEach var="attach" items="${room.roomAttachList}">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
										</div>
										<c:if test='${ empty login or login.userType eq "user" }'>
										<div class="overlay" id="member${room.roomNo}search">
									<label class="checkbox inline"> 
									<%-- <input type="checkbox" class="membercheck" data-roomno="${room.roomNo}">
										회원선택 --%>
										<a href="javascript:;" class="membercheck"> <span
											class="lnr lnr-heart"></span></a>
									</label>
								</div>

								<div class="overlay2" id="member${room.roomNo}search2">
									<!-- <div class=text> -->
										<a href="javascript:;" class="membercheck2">
										 <span class="lnr lnr-heart" style="color: red;"></span></a>
									<!-- </div> -->
								</div>
								</c:if>
									</div>
									</c:when>
									<c:otherwise>
									<div class="span3" data-memberno="${ login.memberNo }">
									<div class="main-carousel" data-flickity='{ "autoPlay": true }'>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</div>
									<c:if test='${ empty login or login.userType eq "user" }'>
									<div class="overlay" id="member${room.roomNo}search">
									<label class="checkbox inline"> 
									<%-- <input type="checkbox" class="membercheck" data-roomno="${room.roomNo}">
										회원선택 --%>
										<a href="javascript:;" class="membercheck"> <span
											class="lnr lnr-heart"></span></a>
									</label>
								</div>

								<div class="overlay2" id="member${room.roomNo}search2">
									<!-- <div class=text> -->
										<a href="javascript:;" class="membercheck2">
										 <span class="lnr lnr-heart" style="color: red;"></span></a>
									<!-- </div> -->
								</div>
								</c:if>
									</div>
									</c:otherwise>
								</c:choose>
							
							<%-- <c:choose>
									<c:when test="${not empty room.roomAttachList}">
										 <div class="slider">
										<c:forEach var="attach" items="${room.roomAttachList}">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								
								
								<%-- <c:choose>
									<c:when test="${not empty room.roomAttachList}">
										<div class="slideshow-container">
										<c:forEach var="attach" items="${room.roomAttachList}">
												<div class="mySlides fade">
												  <img class="img-fluid" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
												</div>	
										</c:forEach>
									</div>
									<br>
											
									<div style="text-align:center">
										<c:forEach var="attach" items="${room.roomAttachList}">
											<span class="dot"></span>
										</c:forEach>  
									</div>
									</c:when>
									<c:otherwise>
										<img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose> --%>
								<!-- <img class="img-fluid" src="/haroobang/resources/img/product/p1.jpg" alt=""> -->
								<a href="/haroobang/room/roomDetail.action?roomNo=${room.roomNo}">
								<div class="product-details">
									<h6 class="searchh">${room.roomName}</h6>
									<div class="price">
										<h6>${room.price}원</h6>
									</div>
									<div class="prd-bottom">
										<!-- <a href="" class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-heart"></span>
											<p class="hover-text">Wishlist</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-sync"></span>
											<p class="hover-text">compare</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a> -->
										<c:if test='${ not empty login and login.userType eq "admin" }'>
										
										<c:choose>
										<c:when test="${room.counts eq 0}">
											 
											<div class="button-group-area mt-40">
												<a href="javascript:;" class="genric-btn danger circle" id='roomdelete${room.roomNo}'>삭제</a>
											</div>
											
										</c:when>
										<c:otherwise>
											<div class="button-group-area mt-40">
												<%-- <a href="" class="genric-btn danger circle" id='roomdelete${room.roomNo}'>삭제</a> --%>
												<h6>${room.counts}명 사용중입니다.</h6>
											</div>
										</c:otherwise>
									</c:choose>
										
										</c:if>
									</div>
								</div>
							</div>
						</div>
						</a>
						</c:forEach>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting mr-auto">
						<!-- <select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select> -->
					</div>
					<div class="pagination">
					${ pager }
						<!-- <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a> 
						
						<a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> 
						<a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a> 
						<a href="#">6</a> <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a> -->
					</div>
				</div>
				<!-- End Filter Bar -->
			</div>
		</div>
	  </div>
	<!-- Start related-product Area -->
	<section class="related-product-area section_gap">		
	</section>
	<!-- End related-product Area -->

	<!-- start footer Area -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End footer Area -->

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
								<div class="item"
									style="background: url(/haroobang/resources/img/organic-food/q1.jpg);">

								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center">
										<span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span>
									</div>
									<div class="category">
										Category: <span>Household</span>
									</div>
									<div class="available">
										Availibility: <span>In Stock</span>
									</div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled
										radiator with the most modern technology. If you are looking
										for something that can make your interior look awesome, and at
										the same time give you the pleasant warm feeling during the
										winter.</p>
									<a href="#" class="view-full">View full Details <span
										class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">
										Color: <span class="single-pick"></span> <span
											class="single-pick"></span> <span class="single-pick"></span>
										<span class="single-pick"></span> <span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity: <input type="text" class="quantity-amount ml-15"
											value="1" />
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button"
												title="Increase Quantity">
												<span class="lnr lnr-chevron-up"></span>
											</button>
											<button class="decrease arrow" type="button"
												title="Decrease Quantity">
												<span class="lnr lnr-chevron-down"></span>
											</button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to
												Cart</span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-layers"></span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="/WEB-INF/views/include/js.jsp" />
  	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  	<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  	
  	<c:choose>
  		<c:when test="${not empty likeds}">
  		<script type="text/javascript">
		  		$(function(){
		  			
  			<c:forEach var="liked" items="${likeds}">
  			
		  			$('#member' + ${liked.roomNo} + "search").css({'z-index': 0, 'opacity': 0});
					$('#member' + ${liked.roomNo} + "search2").css({'z-index': 1, 'opacity': 1});

		  	</c:forEach>
		  		});
		  	</script>
  		</c:when>
  		<c:otherwise>
  		</c:otherwise>
  	</c:choose>
  	
  	<script type="text/javascript">
		$(function(){
			$("a.membercheck").on('click',function(event){
				//var memberno = ${ login.memberNo };
				var session = $(this).parents('.span3').attr('data-memberno');
				if(session == ""){
					window.location="/haroobang/account/login.action";
				}
				else{
					var memberno = $(this).parents('.span3').attr('data-memberno');
					var roomno = $(this).parents('.roomNos').attr('data-roomno');
					
					$('#member' + roomno + "search").css({'z-index': 0, 'opacity': 0});
					$('#member' + roomno + "search2").css({'z-index': 1, 'opacity': 1});
					
					$.ajax({
						"url": "roomLiked.action",
						"method": "POST",
						"data": { 'memberno' : memberno, 'roomno' : roomno },
						"success": function(data, status, xhr) {
							if (data === "success"){
								alert('찜목록에 추가 되었습니다.');
								//location.reload(true);
							}
							
						},
						"error": function(xhr, status, err) {
							alert('찜목록 실패했다 임마!!');
							//location.reload(true);
						}
					});
				}

			});
			
			$("a.membercheck2").on('click',function(event){
				//var memberno = ${ login.memberNo };
				var session = $(this).parents('.span3').attr('data-memberno');
				if(session == ""){
					window.location="/haroobang/account/login.action";
				}
				else{
					var memberno = $(this).parents('.span3').attr('data-memberno');
					var roomno = $(this).parents('.roomNos').attr('data-roomno');
					
					$('#member' + roomno + "search").css({'z-index': 1, 'opacity': 1});
					$('#member' + roomno + "search2").css({'z-index': 0, 'opacity': 0});
					
					$.ajax({
						"url": "roomUnLiked.action",
						"method": "POST",
						"data": { 'memberno' : memberno, 'roomno' : roomno },
						"success": function(data, status, xhr) {
							if (data === "success"){
								alert('찜을 취소했습니다.');
								//location.reload(true);
							}
							
						},
						"error": function(xhr, status, err) {
							alert('찜 취초 실패다 임마');
							//location.reload(true);
						}
					});
				}
			});
			
			
			$("#keyword").on('keyup', function() {
				var k = $(this).val();
				//$("#search").find(".search").hide();
				$("#disapprovalRoom div[data-roomno]").hide();

				var temp = $("h6.searchh:contains('" + k + "')");
				$(temp).parents(".search").show();
			});
			$("#keyword2").on('keyup', function() {
				var k = $(this).val();
				$("#search").find(".search").hide();

				var temp = $("h6.searchh:contains('" + k + "')");
				$(temp).parents(".search").show();
			});
			
			$("a[id ^=roomapproval]").on('click',function(event){
				
				var formData = $(this).parents('.disapprovalNo').attr('data-roomno');
				
				$.ajax({
					"url": "roomApproval.action",
					"method": "POST",
					"data": { 'formdate' : formData },
					"success": function(data, status, xhr) {
						if (data === "success"){
							alert('숙소가 승인 되었습니다.');
							location.reload(true);
						}
						/* alert('숙소가 승인 되었습니다.'); */
					},
					"error": function(xhr, status, err) {
						alert('숙소 실패');
						location.reload(true);
					}
				});
			});
			
			$("a[id ^=deleteapproval]").on('click',function(event){
				
				var formData = $(this).parents('.disapprovalNo').attr('data-roomno');
				
				$.ajax({
					"url": "deleteapproval.action",
					"method": "POST",
					"data": { 'formdate' : formData },
					"success": function(data, status, xhr) {
						if (data === "success"){
							alert('숙소가 삭제 되었습니다.');
							location.reload(true);
						}
					},
					"error": function(xhr, status, err) {
						alert('숙소 실패다!! 이놈아!!');
						location.reload(true);
					}
				});
			});
			
			 
			$("a[id ^=roomdelete]").on('click',function(event){
				var roomno = $(this).parents('.roomNos').attr('data-roomno');
				
				$.ajax({
					"url": "roomDelete.action",
					"method": "POST",
					"data": { 'roomno' : roomno },
					"success": function(data, status, xhr) {
						if (data === "success"){
							alert('숙소가 삭제 되었습니다.');
							location.reload(true);
						}
						
					},
					"error": function(xhr, status, err) {
						alert('삭제 실패했다 임마!!');
						location.reload(true);
					}
				});
			});
			
			/* $("div[id ^=imglist]").hover(function(event){
			}); */
			//.slideshow-container
			/* var slideIndex = 0;
			showSlides();

			function showSlides() {
			    var i;
			    var slides = document.getElementsByClassName("mySlides");
			    var dots = document.getElementsByClassName("dot");
			    for (i = 0; i < slides.length; i++) {
			       slides[i].style.display = "none";  
			    }
			    slideIndex++;
			    if (slideIndex > slides.length) {slideIndex = 1}    
			    for (i = 0; i < dots.length; i++) {
			        dots[i].className = dots[i].className.replace(" active", "");
			    }
			    slides[slideIndex-1].style.display = "block";  
			    dots[slideIndex-1].className += " active";
			    setTimeout(showSlides, 2000); // Change image every 2 seconds
			} */
			
			/* $('.slider').bxSlider(); */
			$('.main-carousel').flickity({
				  // options
				  cellAlign: 'left',
				  contain: true,
				  pageDots: false,
				});
		});
	</script>

</body>

</html>