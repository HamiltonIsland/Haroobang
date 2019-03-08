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
<title>Karma Shop</title>

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
					<h1>숙소 등록</h1>
					<nav class="d-flex align-items-center">
						<a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="category.html">Contact</a>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<!-- End Banner Area -->

	<!--================Contact Area =================-->
	<section class="contact_area section_gap_bottom">
		<div class="container">
			<div id="map" class="mapBox"></div>
			<div class="row">
				<div class="col-lg-3">
					<div class="contact_info">
						<div class="info_item">
							<i class="lnr lnr-home"></i>
							<h6>${login.address }</h6>
							<p>Santa monica bullevard</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-phone-handset"></i>
							<h6>
								<a href="#">${login.phone }</a>
							</h6>
							<p>Mon to Fri 9am to 6 pm</p>
						</div>
						<div class="info_item">
							<i class="lnr lnr-envelope"></i>
							<h6>
								<a href="#">${login.email }</a>
							</h6>
							<p>Send us your query anytime!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-9">
					<form class="row contact_form" action="roomRegister.action"
						method="post" enctype="multipart/form-data">
						<div class="col-md-6">
							<input type="hidden" name="memberNo" value="${login.memberNo}">
							<input type="hidden" id="order_start_lon" name="longitude">
							<input type="hidden" id="order_start_lat" name="latitude">
							<div class="form-group">
								<input type="text" class="form-control" id="roomName"
									name="roomName" placeholder="숙소 이름"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '숙소 이름'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="price"
									placeholder="가격" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '가격'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="maximum"
									placeholder="최대인원" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '최대인원'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="주소" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '주소'">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="file" multiple="multiple"
									class="form-control-file border" name="file" placeholder="숙소사진"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '숙소사진'">
							</div>

							<div class="form-group">
								
									<textarea id="test"class="form-control" name="roomProfile"
										placeholder="Enter Message" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Message'"></textarea>
								
							</div>
						</div>
						<div class="col-md-12 text-right">
							<button type="submit" value="submit"
								class="genric-btn primary radius">숙소 등록</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>
	<!--================Contact Area =================-->

	<jsp:include page="../include/footer.jsp" />

	<!--================Contact Success and Error message Area =================-->
	<div id="success" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<h2>Thank you</h2>
					<p>Your message is successfully sent...</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Modals error -->

	<div id="error" class="modal modal-message fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<i class="fa fa-close"></i>
					</button>
					<h2>Sorry !</h2>
					<p>Something went wrong</p>
				</div>
			</div>
		</div>
	</div>
	<!--================End Contact Success and Error message Area =================-->



	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98c601126ea50820acff69a288897c63&libraries=services"></script>
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
	    	getMap();
	    })
	    $("#test").on("click",function(e){
	    	getMap();
	    })
	    
	    
	    
	    //지도
	    var container = document.getElementById('map');

	        var options = {
	            center: new daum.maps.LatLng(33.450701, 126.570667),
	            level: 3
	        };
	        
	        var map = new daum.maps.Map(container, options);
	        
	    function getMap(){ 
	    	
	        var geocoder = new daum.maps.services.Geocoder();
	        
	        var address_start = $("#address").val();
	        
	        geocoder.addressSearch(address_start,function(result,status){
	        	if(status ===daum.maps.services.Status.OK){
	        		
	        		var coords = new daum.maps.LatLng(result[0].y,result[0].x);
	        			$("#order_start_lat").val(result[0].y);
	        			$("#order_start_lon").val(result[0].x);
	        		
	        			var marker = new daum.maps.Marker({
	        				map:map,
	        				position:coords
	        			})
	        			var roomName = $("#roomName").val()
	        			var infowindow = new daum.maps.InfoWindow({
	        				content:"<div style=width:150px;text-align:center;padding:6px 0;>"+roomName+"</div>"
	        			});
	        			infowindow.open(map,marker);
	        			
	        			map.setCenter(coords);
	        		
	        	}
	        }) 
	    }
	})
</script>
















	<jsp:include page="../include/js.jsp" />

</body>

</html>