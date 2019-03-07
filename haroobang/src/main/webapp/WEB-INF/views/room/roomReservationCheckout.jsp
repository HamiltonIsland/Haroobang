<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>

<!-- Site Title -->
<title>Checkout</title>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/include/css.jsp" />
<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
<jsp:include page="/WEB-INF/views/include/js.jsp" />
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
							<h3>숙소 예약 상세${nights}${checkinDate}</h3>
							<!-- <a href="#">예약가능 날짜 확인a tag 사용 가능</a> -->
							<form class="row contact_form" action="#" method="post"
								novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<select class="country_select">
										<option value="1">체크인 날짜</option>
										<option value="2">Country</option>
										<option value="4">Country</option>
									</select>
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="date" placeholder="chekinDate"/>
								</div>
								<div class="col-md-12 form-group p_star">
									<select class="country_select">
										<option value="1">몇박</option>
										<option value="2">1</option>
										<option value="3">2</option>
										<option value="3">3</option>
										<option value="3">4</option>
										<option value="3">5</option>
										<option value="3">6</option>
										<option value="3">7</option>
										<option value="3">8</option>
										<option value="3">9</option>
										<option value="3">10</option>
										<option value="3">11</option>
										<option value="3">12</option>
										<option value="3">13</option>
										<option value="3">14</option>
										<option value="3">15</option>
											
									
									</select>
								</div>
								<div class="col-md-12 form-group">
									<textarea class="form-control" name="message" id="message"
										rows="1" placeholder="요청사항을 입력해 주세요"></textarea>
								</div>

								<div class="col-md-12 form-group p_star">
									<input type="text" placeholder="쿠폰 코드를 입력해주세요"> <a
										class="tp_btn" href="#">쿠폰 적용</a>

								</div>
							</form>
						</div>
						<div class="col-lg-4">
							<div class="order_box">
								<h2>Your Order</h2>
								<ul class="list">
									<li><a href="#">Product <span>Total</span></a></li>
									<li><a href="#">Fresh Blackberry <span class="middle">x
												02</span> <span class="last">$720.00</span></a></li>
									
								</ul>
								<ul class="list list_2">
									<li><a href="#">Subtotal <span>$2160.00</span></a></li>
								
									<li><a href="#">Total <span>$2210.00</span></a></li>
								</ul>
								<div class="payment_item">
									<div class="radion_btn">
										<input type="radio" id="f-option5" name="selector"> <label
											for="f-option5">Check payments</label>
										<div class="check"></div>
									</div>
									<p>Please send a check to Store Name, Store Street, Store
										Town, Store State / County, Store Postcode.</p>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="selector"> <label
											for="f-option6">Paypal </label> <img
											src="img/product/card.jpg" alt="">
										<div class="check"></div>
									</div>
									<p>Pay via PayPal; you can pay with your credit card if you
										don’t have a PayPal account.</p>
								</div>
								<div class="creat_account">
									<input type="checkbox" id="f-option4" name="selector">
									<label for="f-option4">I’ve read and accept the </label> <a
										href="#">terms & conditions*</a>
								</div>
								<a class="primary-btn" href="#">Proceed to Paypal</a>
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