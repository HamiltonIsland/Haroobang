<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<meta name="author" content="CodePixar">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>roomDetail</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	
	 $('#calendarBox').load("/haroobang/room/calender.action")
	
	$("#like").click(function(e){
		var roomNo = 6
			$.ajax({
				url :"addLike.action" ,
				data: {"roomNo":roomNo},
				method:"GET",
				success:function(data,status,xhr){
					if(data == "success"){
						alert("즐겨찾기에 등록되었습니다")	
					}else if(data =="fail"){
						alert("이미 등록되었습니다.")
					}else{
						alert("로그인 페이지로 이동합니다.")
						location.href = "/haroobang/account/login.action"
					}
				}
			})
	})
	
	$("#roomReservation").click(function(e){
		var checkinDate = $("#checkinDate").val();
		var nights = $("#sst").val();
		if(checkinDate.length == 0 || nights.length == 0){
			alert("날짜를 선택해 주세요")
		}else {
			location.href = "/haroobang/room/reservationCheckout.action?checkinDate=" + checkinDate+"&nights="+nights	
		}
	
	})
	
})
			

</script>



</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>숙소 상세 설명</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
					<c:forEach var="roomattach" items="${room.roomAttachList }">
						<div class="single-prd-item">
							<img class="img-fluid" 
							src="/haroobang/resources/upload/${roomattach.savedFileName}" alt="">
						</div>
					</c:forEach>
						
						
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${room.roomName}</h3>
						<h2>${room.price}&nbsp;원</h2>
						<div id="calendarBox" style="height:250px;width:350px;">
						<div id='calendar'></div>
						</div>
						<br>
						<!-- <div class="product_count">
						<label for="qty">Checkin</label> 
						<input type="date" style="width:300px" id="checkinDate"/>
						</div> -->
						<br>
						<div class="product_count">
						<label for="qty">Checkin</label> 
						<input type="date" style="width:150px" id="checkinDate"/>
							<label for="qty">Days&nbsp;&nbsp;</label> 
							<input type="text" name="qty"
								id="sst" maxlength="12" value="1" title="Quantity:"
								class="input-text qty">
								
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>
							<button
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>
						</div>
						<!-- <a href="/haroobang/room/calender.action">날짜확인</a> -->
						<div class="card_area d-flex align-items-center">
							<a class="primary-btn" href="javascript:" id="roomReservation">숙소 예약하기</a>
							<c:if test="${login.userType == 'admin'}">
								<a class="primary-btn" href="javascript:" id="roomDelete">숙소 삭제</a>
							</c:if>
							<a class="icon_btn" href="javascript:" id="like"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">숙소 설명</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">판매자 정보</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">숙소 후기</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>${room.roomProfile}</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
									<a href="/haroobang/message/messageRoom.action?roomNo=${room.roomNo}"><img src="/haroobang/resources/upload/default.jpg" class="rounded-circle" style="height: 60px;width:60px" alt=""></a>
								</div>

								<div class="media-body">
									<h4>${member.nickname}님에게 메세지 보내기</h4>
									<p>${member.profile}</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i><i
													class="fa fa-star"></i><i class="fa fa-star"></i> 01
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/haroobang/resources/img/product/review-1.png"
												alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<!-- 별점표시부분 -->
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/haroobang/resources/img/product/review-2.png"
												alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="/haroobang/resources/img/product/review-3.png"
												alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>

</html>