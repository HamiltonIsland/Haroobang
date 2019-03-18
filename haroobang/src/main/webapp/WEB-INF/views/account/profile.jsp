<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">	
		
		function LoadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				reader.onload = function (e){
					$("#LoadImg").attr("src", e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}	
	
	
</script>

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
	<title>Profile</title>

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
					<h1>개인 정보 수정</h1>

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
					<div class="login_box_img"style="height:100%">
						<img id ="LoadImg" class="img-fluid" style="height:100%" src="/haroobang/resources/upload/${login.savedFileName }" alt="">						
					</div>
				</div>
				<div class="col-lg-6"> 
					<div class="login_form_inner">
						<form class="row login_form" action="/haroobang/account/profile.action" method="post" enctype="multipart/form-data">
							<input type="hidden" name="memberNo" value="${login.memberNo }">
							<input type="hidden" name="password" value="${login.password }">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="email" readonly value="${login.email }">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="name" value="${login.name }" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="phone" value="${login.phone }" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'">
							</div>
							<div class="col-md-12 form-group">
								<input type="file" id="imgAttach" onchange="LoadImg(this);" class="form-control" name="file" value="${login.userFileName}">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="point" value="${login.point } point" readonly>  
							</div>
						
							<div class="col-md-12 form-group">
								<textarea class="form-control" style="resize: none;width:100%" name="profile" rows="3" placeholder="Profile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'">${login.profile }</textarea>
							</div>							
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">수정하기</button>	
								<a href="findPassword.action">비밀번호 수정</a>							
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<jsp:include page="../include/footer.jsp"/>


	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>