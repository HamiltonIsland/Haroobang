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
						<h3>Register</h3>
						<form class="row login_form" action="#" method="post" novalidate="novalidate"style="margin : 0 auto">
                            <div class="col-md-12 form-group p_star">
                                <input type="email" class="form-control" name="email" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'">
                            </div>  
                             <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'">
                            </div>  
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" name="phone" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'">
                            </div>  
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" name="nickname" placeholder="Nick-Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nick-Name'">
                            </div>                         
                            <div class="col-md-12 form-group p_star"> 
                                <select class="country_select" name = "gender">
                                    <option value="Female">Female</option>
                                    <option value="male">male</option>
                                </select>
                            </div>
                                                          
                            <div class="col-md-12 form-group p_star">
                                <input type="date" class="form-control" name="birthDate" placeholder="Birth" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Birth'">
                            </div>                            
                            <div class="col-md-12 form-group">                                 
                                <textarea class="form-control" name="profile" rows="1" placeholder="Profile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"></textarea>
                            </div>
                            <div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">등록하기</button>
								
								<br><a href="#">Forgot Password?</a>
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
		//주소
	    function getAddressInfo(){
	        var width=500;
	        var height = 600;
	        daum.postcode.load(function(){
	        	new daum.Postcode({
	        		oncomplete: function(data){
	        			$("#address").val(data.address);
	        			$("#addr").val(data.buildingName);
	        		}
	        	}).open({
	        		left:(window.screen.width/2)-(width/2),
	        		top:(window.screen.height/2)-(height/2)
	        	})
	        })
	    }
	    $("#address").on("click",function(e){
	    	getAddressInfo(); 
	    })
	})
</script>
	<jsp:include page="../include/footer.jsp"/>


	<jsp:include page="../include/js.jsp"/>
	
</body>

</html>