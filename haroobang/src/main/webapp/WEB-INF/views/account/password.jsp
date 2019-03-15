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
						<h3>개인정보 확인</h3>
						<form class="row login_form" novalidate="novalidate"style="margin : 0 auto">
                            <div class="col-md-12 form-group p_star">
                                <input type="email" class="form-control" id="email"name="email" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'">
                            </div>                           
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="name"name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'">
                            </div>                                                   
                            <div class="col-md-12 form-group p_star">
                                <input type="date" class="form-control"id="birthDate" name="birthDate" placeholder="Birth" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Birth'">
                            </div> 
                            <div class="col-md-12 form-group">
								<button type="button" id="submit" value="submit" class="primary-btn">확인하기</button>								
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
	        //email입력
	        var email = $("#email").val();
	        email = $.trim(email);	        
	        var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;	       
	        if(email==""){
	        	alert("email을 입력하세요");
	        	return;
	        }else if(!emailRule.test(email)){
	        	alert("email을 올바르게 입력하세요\n\nEx : example@haroobang.com");     
	        	return;        	
	        }else{
	        	formData.append("email", email);	
	        }	        
	     	
	        //이름입력
	        var name = $("#name").val();
	        name = $.trim(name);
	       
	        if(name==""){
	        	alert("이름을 입력하세요");
	        	return;
	        }else{
	        	formData.append("name", name);	
	        }	        
	      		     	
	      	//birthDate입력
	        var birthDate = $("#birthDate").val();
	        birthDate = $.trim(birthDate);
	          
	        if(birthDate==""){
	        	alert("생일을 입력하세요");
	        	return;	              	
	        }else{
	        	formData.append("birthDate", birthDate);	
	        }
	       
	        
	        
	        $.ajax({
	            url: 'password.action',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(data,status,xhr){
	            	if(data==0){
	            		alert("정보가 틀렸습니다.")
	            		location.href="findPassword.action";
	            	}else{
	            	location.href="updatePassword.action?memberNo="+data;
	            	}
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