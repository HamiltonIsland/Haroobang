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
<title>숙소 등록 확인</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98c601126ea50820acff69a288897c63&libraries=services"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${room.latitude}, ${room.longitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var markerPosition  = new daum.maps.LatLng(${room.latitude}, ${room.longitude}); 
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var marker = new daum.maps.Marker({
		map:map,
		position:markerPosition
	})
	/* // 지도를 클릭한 위치에 표출할 마커입니다
	var marker = new daum.maps.Marker({ 
   	 // 지도 중심좌표에 마커를 생성합니다 
    	position: map.getCenter() 
	}); */ 
	// 지도에 마커를 표시합니다
	marker.setMap(map);
	$('#calendarBox').load("/haroobang/room/calender.action?roomNo="+${room.roomNo})
});
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
					<h1>숙소 등록 확인</h1>
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
						<c:forEach var="picture" items="${room.roomAttachList }">
							<div class="single-prd-item">
								<img class="img-fluid"
									src="/haroobang/resources/upload/${picture.savedFileName }"
									alt="">
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h2>${room.roomName}</h2>
						<h4>&#8361; ${room.price}&nbsp;</h4>
						<hr>
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
						<div class="card_area d-flex align-items-center">
							<a class="genric-btn danger circle"
								href="/haroobang/room/deleteRegister.action?roomNo=${room.roomNo }"
								style="padding: 0px 60px">돌아가기</a> <a
								class="genric-btn primary circle" href="/haroobang/home.action"
								style="padding: 0px 60px; margin-left: 10px">등록하기</a>
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
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">숙소 설명</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">판매자 정보</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">숙소 후기</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div id="map" style="width:100%;height:350px;"></div>
					<hr>
					<p> 주소 : ${room.address }</p>
					<p> 최대인원 : ${room.maximum } 명 </p>
					<hr>
					<p style="white-space: pre">${room.roomProfile}</p>
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
								
								<img src="/haroobang/resources/upload/${login.savedFileName }" class="rounded-circle" style="height: 70px;width:70px" alt="">
								
								</div>

								<div class="media-body">
								<div style=" display: inline-block;">
									<h3>&nbsp;${login.nickname}님 &nbsp;&nbsp;&nbsp;<a style="font-size: 14px" href="#"><i class="icon-envelope-alt"></i>문의하기</a></h3>
								</div>	
								<hr>
									<p>${login.profile}</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>${room.averageRates }점</h4>
										<h6>(${room.roomCommentList.size() } Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on ${room.roomCommentList.size() } Reviews</h3>
										<ul class="list">
										<c:forEach var="i" begin="1" end="5" >
										<li>	
											${i}점
											<c:forEach var="y" begin="1" end="${i}">
											<a href="#"><i class="fa fa-star"></i></a>
										
											</c:forEach>
												<c:forEach var="z" begin="1" end="${5-i}">
											<i class="fa fa-star"></i>	
											</c:forEach>
										&nbsp;&nbsp;${i}
										</li>
										</c:forEach>
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