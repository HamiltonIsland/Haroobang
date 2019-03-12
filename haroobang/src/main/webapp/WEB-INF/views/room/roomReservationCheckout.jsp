<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	
/* 	if("${result}"=="fail"){
		alert("선택하신 날짜에는 예약이 불가합니다. 이전페이지로 이동합니다.")
		 window.history.back();
	} */
	
	$('#pay').click(function(e){
		if($("#agreement").checked = true){
			$("#form").submit()
		}else{
			alert("결제정보 동의에 체크해 주세요")
		}
	
	})
	
})

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
			<div class="returning_customer">
				<div class="billing_details">
					<div class="row">
						<div class="col-lg-8">
							<h3>숙소 예약 상세</h3>
							<!-- <a href="#">예약가능 날짜 확인a tag 사용 가능</a> -->
							<form class="row contact_form" action="payment.action" id="form" method="post"
								novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<select class="country_select" name="startDate">
										<option value="${checkinDate}">${checkinDate}</option>
									</select>
								</div>
								
								<div class="col-md-12 form-group p_star">
									<select class="country_select" name="nights">
										<option value=${nights }>${nights} 박</option>
										<option value=1>1 박</option>
										<option value=2>2 박</option>
										<option value=3>3 박</option>
										<option value=4>4 박</option>
										<option value=5>5 박</option>
										<option value=6>6 박</option>
										<option value=7>7 박</option>
										<option value=8>8 박</option>
										<option value=8>9 박</option>
										<option value=10>10 박</option>
										<option value=11>11 박</option>
										<option value=12>12 박</option>
										<option value=13>13 박</option>
										<option value=14>14 박</option>
										<option value=15>15 박</option>
									</select>
								</div>
								<div class="col-md-12 form-group">
									<textarea class="form-control" name="request" id="message"
										rows="1" placeholder="요청사항을 입력해 주세요"></textarea>
								</div>

								<div class="col-md-12 form-group p_star">
									<input type="text" placeholder="쿠폰 코드를 입력해주세요" name="coupon"> <a
										class="tp_btn" href="#">쿠폰 적용</a>

								</div>
							
						</div>
						<div class="col-lg-4">
							<div class="order_box">
								<h2>Your Order</h2>
								<ul class="list">
									<li><a href="#">Product <span>Total</span></a></li>
									<li><a href="#">&#8361; 50000 /1박 <span class="middle">x
												${nights }</span> <span class="last">&#8361; ${nights*50000 }</span></a></li>
									<li><a href="#">쿠폰 사용 내역<span>등록된 쿠폰이 없습니다</span></a></li>
									<hr>
									
								</ul>
								<ul class="list list_2">
									<li>Total <span style="float:right">&#8361; ${nights*50000 }</span></li>
									<hr>
								</ul>
								<div class="payment_item">
									<div class="radion_btn">
										<input type="radio" id="f-option5" name="payment" value="카드결제" checked="checked">
										<label for="f-option5" id="card">카드 결제</label>
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/cardCompanies.jpg"/></p>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="payment" value="무통장입금"> 
										<label for="f-option6" id="cash">무통장 입금 </label> 
										<!-- <img src="img/product/card.jpg" alt=""> -->
										<div class="check"></div>
									</div>
									<p><img style="height:320px;width:250px" src="/haroobang/resources/img/cashPayment.jpg"/></p>
								</div>
								<div class="creat_account">
									<input type="checkbox" id="f-option4" name="selector" id="agreement">
									<label for="f-option4">위의 결제정보에 동의합니다.</label> <a
										href="#">terms & conditions*</a>
								</div>
								
								<input type="hidden" name ="totalPrice" value="${nights*50000 }">
								<input type="hidden" name ="roomNo" value="${roomNo }">
								<!-- <button type="submit" value="submit" class="primary-btn" style="width:100px" >숙소 등록</button> -->
								</form>
								
								<a class="primary-btn" href="javascript:" id="pay">결제하기</a>
							</div>
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