<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
	<title>Karma Shop</title>

	<!--
		CSS
		============================================= -->
	<jsp:include page="../include/css.jsp"/>
</head>

<body>

	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp"/>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Login/Register</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">Login/Register</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container"style="text-align:center">
			<div class="row" >				
				<div class="col-lg-6" style="margin:0 auto">
					<div class="login_form_inner">
						<h3>비밀번호 변경</h3>
						<form class="row login_form" action="updatePassword.action" method="post" novalidate="novalidate"style="margin : 0 auto">
                            <input type="hidden" name="memberNo" value="${member.memberNo }">
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" name="password" placeholder="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'password'">
                            </div>                           
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" name="password확인" placeholder="password확인" onfocus="this.placeholder = ''" onblur="this.placeholder = 'password확인'">
                            </div>
                            <div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">수정</button>								
							</div>
                        </form>
							
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

	<jsp:include page="../include/footer.jsp"/>


	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>