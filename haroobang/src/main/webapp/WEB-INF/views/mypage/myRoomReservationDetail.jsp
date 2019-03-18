<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>예약상세정보</title>

<jsp:include page="../include/css.jsp" />
</head>

<body id="category">

	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>현재 예약 목록</h1>

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
							<ul class="collapse " id="homeClean" data-toggle="collapse"
								aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a
									href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }"
									style="color: #ffc107;">현재 예약 목록</a></li>
								<li class="main-nav-list child"><a
									href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }">이전
										예약 목록</a></li>
							</ul></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#officeProduct" aria-expanded="false"
							aria-controls="officeProduct"><span
								class="lnr lnr-arrow-right"></span>내 숙소 관리</a>
							<ul class="collapse show" id="officeProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="officeProduct">
								<li class="main-nav-list child"><a href="/haroobang/mypage/waitingList.action?memberno=${ login.memberNo }">승인 대기중 /
										등록된 숙소</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/myRoomReservation.action?memberno=${ login.memberNo }"style="color: #ffc107;">내 숙소 예약 목록</a></li>
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
				
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
<section class="checkout_area section_gap" style="padding: 15px">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8" style="padding-left:30px ">
                        <h3>숙소 예약 정보</h3>
                        <form class="row contact_form" action="payment.action" id="form" method="post" novalidate="novalidate">
                           <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="예약일정 : ${reservation.startDate}~${reservation.endDate } ( ${reservation.nights }박 ) / 총 숙박인원:  ${reservation.people }명" style="border: white" readonly>
                            </div>
                           
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="금액 : ${reservation.roomVO.price}원 x ${reservation.nights}박 = ${reservation.roomVO.price *reservation.nights } 원 " style="border: white" readonly>
                            </div>
                            
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="총 결제금액 : ${reservation.roomVO.price *reservation.nights } 원 - 적립금 ${reservation.usedPoint } 점 = ${reservation.roomVO.price *reservation.nights - reservation.usedPoint } 원" readonly>
                            </div>
                            
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>요청사항</h3>
                                </div>
                                <c:choose>
                                <c:when test="${reservation.request.length() == 0 }">
                                <p style="color: #777777"> 요청사항이 없습니다.<p>
                                </c:when>
                                <c:otherwise>
                                <pre style="overflow: auto;color: #777777;height:70px;"> ${reservation.request }</pre>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            <br>
                            <div class="col-md-12 form-group" style="text-align: center;">
                                <a class="primary-btn" style="color: white;" href="/haroobang/mypage/myRoomReservation.action?memberno=${login.memberNo }">목록으로 돌아가기</a>
                            </div>
                    </div>
                    
                    
                    <div class="col-lg-4">
                        <div class="order_box" style="padding: 0;background:white;">
                            <h3>숙소정보</h3>
                           
                            <div class="payment_item">
                                <p>
                                <a href="/haroobang/room/roomDetail.action?roomNo=${reservation.roomNo }">
                                <img style="height:200px;width:250px; box-shadow:-9px 8px 20px rgba(0, 0, 0, 0.5);" src="/haroobang/resources/upload/${reservation.roomVO.roomAttachList[0].savedFileName}"/>
                                </a></p>
                            </div>
                            <h3>예약한 고객 정보</h3>
                            <img src="/haroobang/resources/upload/${reservation.accountVO.savedFileName }" class="rounded-circle" style="height: 70px;width:70px" alt="">
                             &nbsp;&nbsp;${reservation.accountVO.nickname } 님
                             <br>
                             &nbsp;&nbsp;<a style="font-size: 14px" href="/haroobang/message/messageRoom.action?memberNo=${reservation.accountVO.memberNo }"><i class="icon-envelope-alt"></i>채팅하기</a></h3>
                            <br><br>
                            </form>
                            <c:choose>
                            <c:when test="${reservation.checkin == false }">
                            <a class="primary-btn" style="color: white;display: block" id="checkinApproval">체크인 승인</a>
                            <a class="primary-btn" style="color: gray;background: white;border:solid 1px;display: none" id="calcelCheckin">체크인 승인완료/승인취소</a>
                            </c:when>
                            <c:otherwise>
                             <a class="primary-btn" style="color: gray;background: white;border:solid 1px;display: block" id="calcelCheckin">체크인 승인완료/승인취소</a>
                             <a class="primary-btn" style="color: white;display: none" id="checkinApproval">체크인 승인</a>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
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
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- End footer Area -->
	<jsp:include page="../include/js.jsp" />
	
	<script type="text/javascript">
	
	$("#checkinApproval").click(function(e){
		
		$("#calcelCheckin").css('display','block');
		 $("#checkinApproval").css('display','none');

		$.ajax({
			url:"checkinApproval.action",
			data: {"reservationNo":${reservation.reservationNo}},
			method:"GET",
			success:function(data,status,xhr){
				if(data == "success"){
					alert("체크인이 승인되었습니다.")	
				}else if(data =="fail"){
					alert("체크인 승인이 실패하였습니다.")
				}
			}	
			});
	});
	
	$("#calcelCheckin").click(function(e){
		
		$("#checkinApproval").css('display','block');
		 $("#calcelCheckin").css('display','none');

		$.ajax({
			url:"calcelCheckin.action",
			data: {"reservationNo":${reservation.reservationNo}},
			method:"GET",
			success:function(data,status,xhr){
				if(data == "success"){
					alert("체크인이 승인이 취소되었습니다.")	
				}else if(data =="fail"){
					alert("체크인 승인취소가 실패하였습니다.")
				}
			}	
			});
	});
	
	
	</script>

</body>

</html>