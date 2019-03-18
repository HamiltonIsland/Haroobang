<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>

<!-- Site Title -->
<title>Checkout</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<meta name="author" content="CodePixar">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>roomDetail</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(function(){
	
	$('#pay').click(function(e){
		
		if($("#agreement").is(":checked")){
			if($("#point").val().length == 0){
				$("#point").val(0);
			}
			$("#form").submit()
		}else{
			alert("결제정보 동의에 체크해 주세요")
		}
	});
	
	$("#point").on("keyup paste keypress change", function(e) {
		
	 if ((e.which < 48 || e.which > 57)) {
             event.preventDefault();
         }
		
	var usePoint = $(this).val();
	
	$('#minusPoint').text(usePoint);
	$('#totalPrice').text(${nights*roomDetail.price }-usePoint);
	 
	if(usePoint>${login.point}){
	   alert("사용가능한 포인트를 초과하였습니다.")
	    $(this).val("");
	    $('#minusPoint').text("");
	    $("#totalPrice").text(${nights*roomDetail.price });
	    }
	});
	
	$("#goback").click(function(e){
		history.back();
	});

	
});


</script>

</head>

<body>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Checkout</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Checkout Area =================-->
<section class="checkout_area section_gap">
        <div class="container">
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <h3>숙소 예약 정보</h3>
                        <form class="row contact_form" action="payment.action" id="form" method="post" novalidate="novalidate">
                           
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="예약일정 : ${checkinDate}~${endDate }" style="border: white" readonly>
                            </div>
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control"placeholder="총 숙박일수 :  ${nights }박" style="border: white" readonly>
                            </div>
                           
                            <div class="col-md-12 form-group p_star">
                                <select class="country_select" name="people">
                                    <option value="1">인원수를 선택해 주세요</option>
                                     <c:forEach var="i" begin="1" end="${roomDetail.maximum }">
								  		<option value="${i }">${i }명</option>
								 	</c:forEach>
                                </select>
                            </div>
                            
                         
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" name="coupon" placeholder="쿠폰코드를 입력해 주세요">
                            </div>
                            
                            <div class="col-md-12 form-group">
                                <input type="text" class="form-control" maxlength="5" id="point" name="usedPoint" placeholder="사용할 포인트를 입력해주세요 /사용가능포인트:${login.point}점">
                            </div>
                         
                            <div class="col-md-12 form-group">
                                <div class="creat_account">
                                    <h3>요청사항</h3>
                                </div>
                                <textarea class="form-control" name="request" id="message" rows="1" placeholder="요청사항/문의사항을 입력해 주세요."></textarea>
                            </div>
                            <input type="hidden" name ="beforePrice" value="${nights*roomDetail.price }">
								<input type="hidden" name ="roomNo" value="${roomDetail.roomNo }">
								<input type="hidden" name ="startDate" value="${checkinDate }">
								<input type="hidden" name ="endDate" value="${endDate }">
								<input type="hidden" name = "nights" value="${nights }">
								
								<a class="primary-btn" href="javascript:" id="goback">이전단계로 가기</a>
                    </div>
                    
                    
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Your Order</h2>
                            <ul class="list">
                                <li><a>Product <span>Total</span></a></li>
                                <li><a>${roomDetail.price }원/박 <span class="middle">x ${nights }</span> <span class="last">${nights * roomDetail.price}원</span></a></li>
                                 <li><a>포인트 사용 <span class="last" id="minusPoint"></span></a></li>
                                
                            </ul>
                            <hr>
                            <ul class="list list_2">
                                <li><a href="#">Total <span id="totalPrice">${nights * roomDetail.price}원</span></a></li>
                            </ul>
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="payment" value="카드결제" checked="checked">
                                    <label for="f-option5">카드결제</label>
                                    <div class="check"></div>
                                </div>
                                <p><img style="height:150px;width:250px" src="/haroobang/resources/img/cardCompanies.jpg"/></p>
                            </div>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="payment" value="무통장입금">
                                    <label for="f-option6">무통장 입금</label>
                                    <img src="img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p><img style="height:150px;width:250px" src="/haroobang/resources/img/banklist.png"/></p>
                            </div>
                            <div class="creat_account">
                                <input type="checkbox" id="agreement">
                                <label for="f-option4">위의 결제 정보에 동의하며 주의사항을 숙지했습니다. </label>
                                <a href="#">terms & conditions*</a>
                            </div>
                            </form>
                            <a class="primary-btn" href="javascript:" id="pay">결제하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	<!--================End Checkout Area =================-->
	
	
	<jsp:include page="../include/footer.jsp" />
</body>

</html>