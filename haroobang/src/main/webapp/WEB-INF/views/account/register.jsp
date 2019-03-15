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
						<h3>Register</h3>
						<form class="row login_form" action="register.action" enctype="multipart/form-data"method="post" novalidate="novalidate"style="margin : 0 auto">
                            <div class="col-md-12 form-group p_star">
                                <input type="email" class="form-control"id="email" name="email" placeholder="E-mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="password" class="form-control" id="password"name="password" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control"id="name" name="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'">
                            </div>  
                             <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'">
                            </div>  
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control"id="phone" name="phone" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'">
                            </div>  
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control"id="nickname" name="nickname" placeholder="Nick-Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Nick-Name'">
                            </div>  
                            <div class="col-md-12 form-group p_star">
                                <input type="file" class="form-control"id="file" name="file" placeholder="file" onfocus="this.placeholder = ''" onblur="this.placeholder = 'file'">
                            </div>                        
                            <div class="col-md-12 form-group p_star"> 
                                <select class="country_select" id="gender" name = "gender">
                                    <option value="Female">Female</option>
                                    <option value="male">male</option>
                                </select>
                            </div>
                                                          
                            <div class="col-md-12 form-group p_star">
                                <input type="date" class="form-control"id="birthDate" name="birthDate" placeholder="Birth" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Birth'">
                            </div>                            
                            <div class="col-md-12 form-group">                                 
                                <textarea class="form-control" id="profile"name="profile" rows="3" placeholder="Profile" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Message'"></textarea>
                            </div>
                            <div class="col-md-12 form-group"> 
								<button type="button" id="submit" value="submit" class="primary-btn">등록하기</button>								
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
	     	
	        //이름입력
	        var name = $("#name").val();
	        name = $.trim(name);
	       
	        if(name==""){
	        	alert("이름을 입력하세요");
	        	return;
	        }else{
	        	formData.append("name", name);	
	        }
	        
	      	//주소 입력
	        var address = $("#address").val();
	       
	        if(address==""){
	        	alert("주소를 입력하세요");
	        	return;
	        }else{
	        	formData.append("address", address);	
	        }
	        
	     	//password입력
	        var phone = $("#phone").val();
	        phone = $.trim(phone);
	        var phoneRule =  /^\d{3}-\d{3,4}-\d{4}$/;
  
	        if(phone==""){
	        	alert("전화번호를 입력하세요");
	        	return;
	        }else if(!phoneRule.test(phone)){
	        	alert("전화번호 형식을 확인하세요\n\n Ex : 010-0000-0000");
	        	return;        	
	        }else{
	        	formData.append("phone", phone);	
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
	        
	     	//profile입력
	        var profile = $("#profile").val();  
	        if(profile==""){
	        	profile = "안녕하세요"+name+"입니다.";  
	        	formData.append("profile", profile);
	        }else{
	        	formData.append("profile", profile);	
	        }
	        
	      	//nickname입력
	        var nickname = $("#nickname").val();  
	        if(nickname==""){
	        	nickname = name;
	        	formData.append("nickname", nickname);
	        }else{
	        	formData.append("nickname", nickname);	
	        } 
	        
	
	       
	        formData.append("file", $("#file")[0].files[0]);	
	           
	         
	        formData.append("gender", $("#gender").val())	        
	        
	        
	        
	        $.ajax({
	            url: 'register.action',
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