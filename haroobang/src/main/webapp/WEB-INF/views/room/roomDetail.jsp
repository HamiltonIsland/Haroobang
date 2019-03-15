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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98c601126ea50820acff69a288897c63&libraries=services"></script>
		
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
					<div class="s_Product_carousel"  style="height:450px;width:500px" >
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
						<h2>${room.roomName}</h2>
						<h4>&#8361; ${room.price}&nbsp;</h4>
						<hr>
						<div id="calendarBox" style="height:350px;width:350px;">
						
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
								<c:choose>
								<c:when test="${login ==null }">
								<a href="/haroobang/account/login.action" id="idCheck">
								</c:when>
								<c:otherwise>

								<a href="/haroobang/message/messageRoom.action?memberNo=${member.memberNo}">

								</c:otherwise>
								</c:choose>
								<img src="/haroobang/resources/upload/${room.memberSavedFileName }" class="rounded-circle" style="height: 70px;width:70px" alt="">
								</a>
								</div>

								<div class="media-body">
								<div style=" display: inline-block;">
									<h3>&nbsp;${member.nickname}님 &nbsp;&nbsp;&nbsp;<a style="font-size: 14px" href="/haroobang/message/messageRoom.action?memberNo=${member.memberNo}"><i class="icon-envelope-alt"></i>문의하기</a></h3>
								</div>	
								<hr>
									<p>${member.profile}</p>
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
								<div class="review_item" style="width: 1050px">
								<c:choose>
								<c:when test="${room.roomCommentList.size()>0 }">
								<hr>
								<c:forEach var="comment" items="${room.roomCommentList }">
								<div class="media">
										<div class="d-flex">
										<hr>
										<hr><hr><hr>
										<c:choose>
										<c:when test="${empty comment.member.savedFileName }">
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/default.jpg"/>
										</c:when>
										<c:otherwise>
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/${comment.member.savedFileName }">
										</c:otherwise>
										</c:choose>
											
										</div>
										<div class="media-body">
											<h4>${comment.nickName }</h4>
											
											<c:forEach var="y" begin="1" end="${comment.rates}">
											<i class="fa fa-star"></i>
											</c:forEach>
											<%-- <c:forEach var="z" begin="1" end="${5 - comment.rates}">
											<i class="fa fa-star"></i>	
											</c:forEach> --%>
										</div>
										
									</div>
									<c:choose>
									<c:when test="${comment.restricted == false }">
									<div style="display: inline;width: 500px">
									<p style="white-space: pre">${comment.content }</p>
										<a class="reply_btn" href="javascript:" id="report" commentNo="${comment.commentNo }" style="color:gray;font-size: 10px;">신고하기</a>
										<hr>
									</div>
									</c:when>
									<c:when test="${comment.restricted == true }">
									<div style="display: inline;width: 500px">
									<p style="white-space: pre">관리자의 요청에의에 후기가 삭제되었습니다.</p>
										<%-- <a class="reply_btn" href="javascript:" id="report" commentNo="${comment.commentNo }" style="color:gray;font-size: 10px;">신고하기</a> --%>
										<hr>
									</div>
									</c:when>
									</c:choose>
								
									
									
									<br>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<hr>
								<div class="review_item">
									<p>&nbsp;&nbsp;&nbsp;등록된 후기가 없습니다.</p>
								</div>
								</c:otherwise>
								</c:choose>
						
									
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


	
	$('#calendarBox').load("/haroobang/room/calender.action?roomNo="+${room.roomNo});
	
	
	$('#idCheck').click(function(e){
		alert("로그인페이지로 이동합니다.")
	})
	
	$("#like").click(function(e){
		
			$.ajax({
				url :"addLike.action" ,
				data: {"roomNo":${room.roomNo}},
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
	
/* 	$("#roomReservation").click(function(e){
		var checkinDate = $("#checkinDate").val();
		var nights = $("#sst").val();
		if(checkinDate.length == 0 || nights.length == 0){
			alert("날짜를 선택해 주세요")
		}else {
			if(${login == null}){
				alert("로그인페이지로 이동합니다.")
				location.href = "/haroobang/account/login.action"
			}else{
			$.ajax({
				url:"/haroobang/room/checkDate.action",
				data:{"checkinDate":checkinDate,"nights":nights,"roomNo":${room.roomNo}},
				method:"get",
				success:function(data,status,xhr){
					if(data == "fail"){
						alert("선택하신 날짜에는 예약 할 수 없습니다. 날짜를 다시 선택 해 주세요");
					}else {
						location.href = "/haroobang/room/reservationCheckout.action?checkinDate=" + checkinDate+"&nights="+nights+"&roomNo="+${room.roomNo}
					}
				}
			});
		}
		}
	}); */
	
	$("#roomDelete").click(function(e){
		
		var c = confirm("삭제하시겠습니까?");
		
		if(c == true){
			location.href = "/haroobang/room/roomDelete.action?roomNo="+${room.roomNo}
		}else{	}
	});
	
	//$(".reply_btn").['#report'].click(function(e){
	//$('a[id ^=report]').click(function(e){
	$('.reply_btn').click(function(e){
	
		if(${login == null}){
			alert("로그인페이지로 이동합니다.")
			location.href = "/haroobang/account/login.action"
		}else{
			
		
		var content = prompt("신고하는 사유를 적어 주세요\nex)\n1.부적절한 언행 \n2.선정적인 언행 \n3.광고성글");
		var commentNo = $(this).attr('commentNo');
		
		if(content != null){
			while(content == ""){
				alert("내용을 입력해주세요.")
				content = prompt("신고하는 사유를 적어 주세요\nex)\n1.부적절한 언행 \n2.선정적인 언행 \n3.광고성글");
			}
			$.ajax({
				url:"/haroobang/room/commentReport.action",
				data:{"content":content,"commentNo":commentNo},
				method:"get",
				success:function(data,status,xhr){
					if(data == "success"){
					alert("신고 완료되었습니다. 관리자의 확인후 후기가 삭제됩니다.")
					}else{
						alert("이미 신고가 접수되었습니다.")
					}
				}	
			});
		}
			
			/* 	alert("이유를 적어주세요");
				content=prompt("신고하는 사유를 적어 주세요\nex)\n1.부적절한 언행 \n2.선정적인 언행 \n3.광고성글");
			 */
		
		}
	});
});
			

</script>

</body>


</html>