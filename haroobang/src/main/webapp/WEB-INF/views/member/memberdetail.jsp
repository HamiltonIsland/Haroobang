<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function LoadImg(value) {
		if (value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#LoadImg").attr("src", e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>

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
<title>Profile</title>

<!--
		CSS
		============================================= -->
<jsp:include page="../include/css.jsp" />
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
					<h1>회원 상세</h1>
					<nav class="d-flex align-items-center">
						<a href="/haroobang/home.action">Home<span
							class="lnr lnr-arrow-right"></span></a> <a href="#">Profile</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->

	<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">

				<div class="col-lg-6">
					<div class="stats-box-all-info" style="margin: 10px 0px;">

						<img id="img" src="/team-project3/resources/assets/img/user.png"
							style="width: 64px; height: 64px; border-radius: 70px;" />



						<div class="col-md-12 form-group">
							 <h3 class="form-control">이름 : ${ members.name }</h3>
						</div>
						<div class="col-md-12 form-group">
							<h3 class="form-control">이메일 : ${ members.email }</h3>
						</div>
						<div class="col-md-12 form-group">
							<h3 class="form-control">가입일 : ${ members.regDate }</h3>
						</div>
						<div class="col-md-12 form-group">
							<h3 class="form-control">폰번호 : ${ members.phone }</h3>
						</div>

					</div>
				</div>
			</div>
		</div>

	</section>
	<!--================End Login Box Area =================-->

	<jsp:include page="../include/footer.jsp" />


	<jsp:include page="../include/js.jsp" />

</body>

</html>