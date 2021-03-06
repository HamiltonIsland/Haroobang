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
<link href="/team-project3/resources/assets/css/font-awesome.css" rel="stylesheet">
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
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->
		
	 <section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3" style="background: white">
					<%-- <div class="login_box_img"style="height:100%; border-radius: 700px;background: white"> 
						<img id ="LoadImg" class="img-fluid" style="height:100%; border-radius: 700px;" src="/haroobang/resources/upload/${members.savedFileName }" alt="">						
					</div>  --%>
				</div>
				<div class="col-lg-6"> 
					<div class="login_form_inner"style="height:600px;" >
					<img id ="LoadImg" class="img-fluid" style="height:100px; border-radius: 700px;" src="/haroobang/resources/upload/${members.savedFileName }" alt="">
						<form class="row login_form">
							<input type="hidden" name="memberNo" value="${members.memberNo }">
							<div class="col-md-12 form-group" style="text-align : left; margin-top:50px">
								 <i class="icon-thumbs-up"> </i>
								<strong>이름</strong> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ${members.name }
								</div>
								
							<div class="col-md-12 form-group" style="text-align : left">
							<i class="icon-envelope-alt"></i>
								<strong>이메일</strong> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp; ${members.email }
							</div>
							<div class="col-md-12 form-group" style="text-align : left">
							<i class="icon-map-marker"></i>
								<strong>가입일</strong> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; ${members.regDate }
							</div>
							<div class="col-md-12 form-group" style="text-align : left">
							<i class="icon-phone"></i>
								<strong>번호 </strong> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; ${members.phone }
							</div>
							<div class="button-group-area mt-40" style="margin:auto; margin-top:50px;">
								 <a href="/haroobang/member/memberlist.action?" class="genric-btn primary circle arrow">목록보기</a>
							</div>	
						</form>
					</div>
				</div>
		
			</div>
		</div>
	</section> 
	<!--================End Login Box Area =================-->

	<section class="related-product-area section_gap">		
	</section>
	
	<jsp:include page="../include/footer.jsp" />


	<jsp:include page="../include/js.jsp" />

</body>

</html>