<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>후기등록</title>
<!--
			CSS
			============================================= -->
<jsp:include page="../include/css.jsp" />
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  
	  var rating = $('.starR.on').length;		//별점 숫자를 저장
	  $('#rate').val(rating);
	  return false;
	});
	
	$('#submit').click(function(){
		//alert($('#rate').val());
		if($('#rate').val()){
			$('#contactForm').submit();
		} else {
			alert('별점을 등록해주세요!');
		}
		
	});
	
})
</script>

<style type="text/css">
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}
</style>

</head>

<body>

	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>후기등록</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Single Product Area =================-->

	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">

			<div class="tab-content" id="myTabContent">

				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">

						<div class="col-lg">
							<div class="review_box">
								<h4>후기 등록</h4>
								<form class="row contact_form" action="/haroobang/mypage/commentRegister.action"
									method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
									<div class="form-group">
									<p>별점</p>
									<div class="starRev">
  										<span class="starR on">별1</span>
  										<span class="starR">별2</span>
  										<span class="starR">별3</span>
  										<span class="starR">별4</span>
  										<span class="starR">별5</span>
  									</div>
  									<input type="hidden" id="rate" name="rates">
									</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<p>닉네임</p>
											<input type="text" readonly="readonly" class="form-control" value="${ login.nickname }"
												id="nickName" name="nickName">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											
											<input type="hidden" readonly="readonly" class="form-control" value="${ reservationNo }"
												id="reservationNo" name="reservationNo">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											
											<input type="hidden" readonly="readonly" class="form-control" value="${ roomNo }"
												id="roomNo" name="roomNo">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											
											<input type="hidden" readonly="readonly" class="form-control" value="${login.memberNo }"
												id="memberNo" name="memberNo">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<p>내용</p>
											<textarea class="form-control" name="content" id="content"
												rows="1" placeholder="Review"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<a href="javascript:" class="primary-btn" id="submit">Submit
											Now</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->

	<!-- Start related-product Area -->

	<!-- End related-product Area -->

	<!-- start footer Area -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />


</body>

</html>