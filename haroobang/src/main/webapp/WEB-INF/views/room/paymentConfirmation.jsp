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
<title>결제완료 내역</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	
})
			

</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	
	<section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>결제완료 내용</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->
    <!--================Cart Area =================-->
<section class="checkout_area section_gap">
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
                                <input type="text" class="form-control" maxlength="5" id="point" name="usedPoint" style="border: white" placeholder="사용한 포인트: ${reservation.usedPoint } 점 / 남은 포인트: ${login.point} 점">
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="금액 : ${roomDetail.price}원 x ${reservation.nights}박 = ${roomDetail.price *reservation.nights } 원 " style="border: white" readonly>
                            </div>
                            
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="총 결제금액 : ${roomDetail.price *reservation.nights } 원 - ${reservation.usedPoint } 점 = ${roomDetail.price *reservation.nights - reservation.usedPoint } 원" readonly>
                            </div>
                            
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>요청사항</h3>
                                </div>
                                <c:choose>
                                <c:when test="${reservation.request.length() == 0 }">
                                <p style="color: #777777"> 요청사항이 없습니다. 문의사항은 판매자와의 채팅을 통해 문의하실 수 있습니다.<p>
                                </c:when>
                                <c:otherwise>
                                <pre style="overflow: auto;color: #777777;height:70px;"> ${reservation.request }</pre>
                                </c:otherwise>
                                </c:choose>
                            </div>
                            
                            <br>
                                  <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>결제정보</h3>
                                </div>
                                
                                 <c:choose>
                                	<c:when test="${reservation.payment=='무통장입금' }">
                                      	무통장 입금<br>
                                      	${reservation.totalPrice }원 <br>
                                      	구트 은행 0002-****-****-3545<br><br>
                                      	<hr>
                                	</c:when>
                                	<c:when test="${reservation.payment=='카드결제' }">
                                      	카드 결제<br>
                                      	${reservation.totalPrice }원<br>
                                      	visa card 0002-****-****-3545<br><br>
                                      	<hr>
                                	</c:when>
                                </c:choose>
                            </div>
                          
                    </div>
                    
                    
                    <div class="col-lg-4">
                        <div class="order_box" style="padding: 0;background:white;">
                            <h3>숙소정보</h3>
                           
                            <div class="payment_item">
                                <p>
                                <a href="/haroobang/room/roomDetail.action?roomNo=${reservation.roomNo }">
                                <img style="height:250px;width:300px; box-shadow:-9px 8px 20px rgba(0, 0, 0, 0.5);" src="/haroobang/resources/upload/${roomDetail.roomAttachList[0].savedFileName}"/>
                                </a></p>
                            </div>
                            <h3>판매자 정보</h3>
                            <img src="/haroobang/resources/upload/${roomDetail.memberSavedFileName}" class="rounded-circle" style="height: 70px;width:70px" alt="">
                             &nbsp;&nbsp;${roomDetail.memberNickname } 님
                             <br>
                             &nbsp;&nbsp;<a style="font-size: 14px" href="/haroobang/message/messageRoom.action?memberNo=${roomDetail.memberNo }"><i class="icon-envelope-alt"></i>문의하기</a></h3>
                            <br><br>
                            </form>
                            <a class="primary-btn" href="/haroobang/mypage/currentReservationList.action?memberno=${login.memberNo }">마이페이지로 가기</a>
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