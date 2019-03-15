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
							<table class="table" style="text-align: center;margin-left: 20%">
						<thead>
							<tr>
								<th scope="col">숙소정보</th>
								<th scope="col">숙소이름</th>
								<th scope="col">체크아웃</th>
							
							</tr>
						</thead>
						<tbody>
					
							<tr>
								<td>
									<h5>${checkinDate}~${endDate }<br><br></h5>
								</td>
								<td>
									<h5>총 ${nights }박</h5>
								</td>
								<td>
								 <select name="cars">
								 <c:forEach var="i" begin="1" end="10">
								  <option value="${i }">${i }명</option>
								 </c:forEach>
  								</select>
								</td>
							
							</tr>
						</tbody>
					</table>
					
						<div class="col-lg-4" style="margin-left: 7%">
							<div class="order_box" style="width: 900px;">
								<h2>Your Order</h2>
								<ul class="list">
									<li><a href="#">Product <span>Total</span></a></li>
									<li><a href="#">&#8361; ${roomDetail.price } /1박 <span class="middle">x
												${nights }</span> <span class="last">&#8361; ${nights*roomDetail.price }</span></a></li>
									<li><a href="#">쿠폰 사용 내역<span>등록된 쿠폰이 없습니다</span></a></li>
									<hr>
									
								</ul>
								<ul class="list list_2">
									<li>Total <span style="float:right">&#8361; ${nights * roomDetail.price}</span></li>
									<hr>
								</ul>
								<div>
								<div class="payment_item" style="display: inline-block;width: 300px">
									<div class="radion_btn">
										<input type="radio" id="f-option5" name="payment" value="카드결제" checked="checked">
										<label for="f-option5" id="card">카드 결제</label>
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/cardCompanies.jpg"/></p>
								</div>
								<div class="payment_item active"style="display: inline-block;">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="payment" value="무통장입금"> 
										<label for="f-option6" id="cash">무통장 입금 </label> 
										<!-- <img src="img/product/card.jpg" alt=""> -->
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/banklist.png"/></p>
								</div>
									<div class="payment_item active"style="display: inline-block;">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="payment" value="모바일결제"> 
										<label for="f-option6" id="mobile">모바일 결제</label> 
										<!-- <img src="img/product/card.jpg" alt=""> -->
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/mobilePay.png"/></p>
								</div>
								</div>
								<div class="creat_account">
									<input type="checkbox" id="f-option4" name="selector" id="agreement">
									<label for="f-option4">위의 결제정보에 동의합니다.</label> <a href="#">terms & conditions*</a>
								</div>
								
								<input type="hidden" name ="totalPrice" value="${nights*roomDetail.price }">
								<input type="hidden" name ="roomNo" value="${roomDetail.roomNo }">
								<input type="hidden" name ="startDate" value="${checkinDate }">
								<input type="hidden" name ="endDate" value="${endDate }">
								<input type="hidden" name = "nights" value="${nights }">
								</form>
								<!-- <a class="primary-btn" href="javascript:" id="pay" style="">결제하기</a> -->
								</div>
								<br>
								<a class="primary-btn" href="javascript:" id="pay" style="width: 900px;text-align: center;">결제하기</a>
								<br><br>
								</div>
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