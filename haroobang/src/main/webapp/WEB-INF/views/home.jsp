<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>HAROOBANG</title>
<!--
		CSS
		============================================= -->
<jsp:include page="include/css.jsp" />
</head>

<body>
	<!-- Start Header Area -->
	<jsp:include page="include/navbar.jsp" />
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="bcontainer">
						<jsp:include page="include/booking.jsp" />
					</div>
				</div>
			</div>
		</div>

	</section>

	
	<jsp:include page="include/js.jsp" />
</body>
</html>