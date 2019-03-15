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
                            <input type="hidden" id="memberNo" value="${memberNo }">
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" id="password" placeholder="password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'password'">
                            </div>                           
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" id="password2" placeholder="password확인" onfocus="this.placeholder = ''" onblur="this.placeholder = 'password확인'">
                            </div>
                            <div class="col-md-12 form-group">
								<button type="button" id="submit" class="primary-btn">수정</button>								
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
<script type="text/javascript">
	$(function(){
		
		$("#submit").on("click",function(e){
	        var formData = new FormData();
	        
	        formData.append("memberNo", $("#memberNo").val())
	     	//password입력
	        var password = $("#password").val();
	        password = $.trim(password);
	        var passwordRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
  
	        if(password==""){
	        	alert("password을 입력하세요");
	        	return;
	        }else if(!passwordRule.test(password)){
	        	alert("숫자와 문자 포함 형태의 6~12자리 이내의 암호");
	        	return;        	
	        }else{
	        	formData.append("password", password);	
	        }
	        
	        var password2 = $("#password2").val();
	        password2 = $.trim(password2);
	        
	        if(password2==""){
	        	alert("password를 확인하세요");
	        	return;
	        }else if(password2!=password){
	        	alert("비밀번호가 틀렸습니다.");
	        	return;        	
	        }  
	        
	        $.ajax({
	            url: 'updatePassword.action',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(data,status,xhr){
	            	location.href="login.action";
	            },
	            error:function(xhr,status,err){
	            	alert("입력사항을 확인해주세요.")
	            }
	           });
	
			})

	})
</script>

	<jsp:include page="../include/footer.jsp"/>


	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>