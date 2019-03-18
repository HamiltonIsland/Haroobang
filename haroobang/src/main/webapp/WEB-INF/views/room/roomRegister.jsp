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
<title>숙소 등록</title>

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
				</div>
			</div>
		</div>
	</section>

	<!-- End Banner Area -->

	<!--================Contact Area =================-->
	<section class="contact_area section_gap_bottom">
		<div class="container">
			<div class="row">
				<div id="map" class="mapBox" style="width: 50%"></div>
				<div class="col-lg-6"
					style="margin-top: 80px; margin-bottom: 100px;">
					<form class="row contact_form" action="roomRegister.action"
						method="post" enctype="multipart/form-data">
						<div class="col-md-12">
							<input type="hidden" id="memberNo" name="memberNo"
								value="${login.memberNo}"> <input type="hidden"
								id="order_start_lon" name="longitude"> <input
								type="hidden" id="order_start_lat" name="latitude">
							<div class="form-group">
								<input type="text" class="form-control" id="roomName"
									name="roomName" placeholder="숙소 이름"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '숙소 이름'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="주소" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '주소'">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="가격" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '가격'">
							</div>

							<div class="input-group-icon mt-10">
								<div class="icon" style="font-size: 10px">최대</div>
								<div class="form-select" id="default-select">
									<select id="maximum" name="maximum">
										<option value=" 1">1명</option>
										<option value="2">2명</option>
										<option value="3">3명</option>
										<option value="4">4명</option>
										<option value="5">5명</option>
										<option value="6">6명</option>
									</select>
								</div>
							</div>
							<!-- <div class="form-group">
								<input type="text" class="form-control" id="maximum"name="maximum"
									placeholder="최대인원" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '최대인원'">
							</div> -->

						</div>

						<div class="col-md-12" style="margin-top: 10px">
							<div class="form-group">
								<input type="file" id="file" multiple="multiple"
									accept=".jpg,.jpeg,.png,.bnp" class="form-control-file border"
									name="file" placeholder="숙소사진" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '숙소사진'">
							</div>

							<div class="form-group">

								<textarea id="test" class="form-control" name="roomProfile"
									placeholder="Enter Message" onfocus="this.placeholder = ''"
									onblur="this.placeholder = 'Enter Message'"></textarea>

							</div>
							<div class="col-md-12" style="width: 100%">
								<button type="button" id="submitbtn" value="submit"
									class="genric-btn primary radius" style="width: 100%">숙소
									등록</button>
							</div>
						</div>

					</form>


				</div>
			</div>

		</div>
	</section>
	<!--================Contact Area =================-->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#submitbtn").on("click",function(e){
	        var formData = new FormData();
	        
	      	//숙소이름 입력
	        var roomName= $("#roomName").val();
	       
	        if(roomName==""){
	        	alert("숙소 이름을 입력하세요");
	        	return;
	        }else{
	        	formData.append("roomName", roomName);	
	        }
	        
	     	//주소 입력
	        var address = $("#address").val();
	       
	        if(address==""){
	        	alert("주소를 입력하세요");
	        	return;
	        }else{
	        	formData.append("address", address);	
	        }
	        	     	
	      	//가격입력
	        var price = $("#price").val();
	        price = $.trim(price);
	       
	        if(price==""){
	        	alert("가격을 입력하세요");
	        	return;
	        }else if(isNaN(price)){
	        	alert("가격 형식을 확인하세요\n\n Ex : 120000");
	        	return;	        		
	        }else{
	        	formData.append("price", price);
	        }	        
	      	//숙소이름 입력
	        var file= document.getElementById('file').files[0];
	       
	        if(typeof file == "undefined"){
	        	alert("사진을 첨부하세요");
	        	return;
	        }else{
	        	var ins = document.getElementById('file').files.length;
	            for (var x = 0; x < ins; x++) {
	                formData.append("file", document.getElementById('file').files[x]);
	            }
	        }
	        
	        formData.append("memberNo", $("#memberNo").val())
	        formData.append("longitude", $("#order_start_lon").val())
	        formData.append("latitude", $("#order_start_lat").val())
	        
	        formData.append("roomProfile", $("#test").val())
	        formData.append("maximum", $("#maximum").val())
	        formData.append("memberNo", $("#memberNo").val())
	        
	        
	        
	        $.ajax({
	            url: 'roomRegister.action',
	            processData: false,
	            contentType: false,
	            data: formData,
	            type: 'POST',
	            success: function(data,status,xhr){
	            	location.href="roomRegisterConfig.action?roomNo="+data;
	            },
	            error:function(xhr,status,err){
	            	alert("입력사항을 확인해주세요.")
	            }
	           });
	
			})
	
		});
	</script>


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
	    $("#price").on("click",function(e){
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