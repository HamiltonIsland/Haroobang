<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="/haroobang/resources/img/fav.png">
<meta name="author" content="CodePixar">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>roomDetail</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98c601126ea50820acff69a288897c63&libraries=services"></script>
		
</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>숙소 상세 설명</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel"  style="height:450px;width:500px;box-shadow: 10px 10px 5px #aaaaaa">
					<c:forEach var="roomattach" items="${room.roomAttachList }">
						<div class="single-prd-item">
							<img class="img-fluid"
							src="/haroobang/resources/upload/${roomattach.savedFileName}" alt="">
						</div>
					</c:forEach>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div>
						<h2>${room.roomName}</h2>
						<h4>${room.price} 원&nbsp;
						<a class="icon_btn" href="javascript:" id="like" style="display: inline;">
						 	<c:choose>
						<c:when test="${like == 'true' }">
						<i class="fa fa-heart" id="liked" style="font-size:35px;color:red;float:right;margin-right:25%;display:block"></i>
						<i class="fa fa-heart-o" id="notLiked" style="font-size:35px;color:red;float:right;margin-right:25%;display:none"></i></h4>
						</c:when>
						<c:otherwise>
						<i class="fa fa-heart" id="liked" style="font-size:35px;color:red;float:right;margin-right:25%;display:none"></i>
						<i class="fa fa-heart-o" id="notLiked" style="font-size:35px;color:red;float:right;margin-right:25%;display:block"></i></h4>
						</c:otherwise>
						</c:choose>
						 </a>
						<hr>
					
						<div id="calendarBox" style="height:350px;width:350px;">
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">숙소 위치</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">숙소 정보</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">숙소 후기</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div id="map" style="width:100%;height:350px;"></div>
					<hr>
					<p> 주소 : ${room.address }</p>
					
				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div class="table-responsive">
						<div class="review_item">
							<div class="media">
								<div class="d-flex">
								<c:choose>
								<c:when test="${login ==null }">
								<a href="/haroobang/account/login.action" id="idCheck">
								</c:when>
								<c:otherwise>

								<a href="/haroobang/message/messageRoom.action?memberNo=${member.memberNo}">

								</c:otherwise>
								</c:choose>
								<img src="/haroobang/resources/upload/${room.memberSavedFileName }" class="rounded-circle" style="height: 70px;width:70px" alt="">
								</a>
								</div>

								<div class="media-body">
								<div style=" display: inline-block;">
								
									<h3>&nbsp;${member.nickname}님 &nbsp;&nbsp;&nbsp;<a style="font-size: 14px" href="/haroobang/message/messageRoom.action?memberNo=${member.memberNo}"><i class="icon-envelope-alt"></i>문의하기</a></h3>
								</div>
								<hr>
								<p> 최대인원 : ${room.maximum } 명 </p>	
								<p> 숙소안내 : </p>
								<p style="white-space: pre">${room.roomProfile}</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>${room.averageRates }점</h4>
										<h6>(${room.roomCommentList.size() } Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on ${room.roomCommentList.size() } Reviews</h3>
										<ul class="list">
										<c:forEach var="i" begin="1" end="5" >
										<li>	
											${i}점
											<c:forEach var="y" begin="1" end="${i}">
											<a href="#"><i class="fa fa-star"></i></a>
										
											</c:forEach>
												<c:forEach var="z" begin="1" end="${5-i}">
											<i class="fa fa-star"></i>	
											</c:forEach>
										&nbsp;&nbsp;${i}
										</li>
										</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item" style="width: 1050px">
								<c:choose>
								<c:when test="${room.roomCommentList.size()>0 }">
								<hr>
								<c:forEach var="comment" items="${room.roomCommentList }">
								<div class="media">
										<div class="d-flex">
										<hr>
										<hr><hr><hr>
										<c:choose>
										<c:when test="${empty comment.member.savedFileName }">
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/default.jpg"/>
										</c:when>
										<c:otherwise>
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/${comment.member.savedFileName }">
										</c:otherwise>
										</c:choose>
											
										</div>
										<div class="media-body">
											<h4>${comment.nickName }</h4>
											
											<c:forEach var="y" begin="1" end="${comment.rates}">
											<i class="fa fa-star"></i>
											</c:forEach>
											<%-- <c:forEach var="z" begin="1" end="${5 - comment.rates}">
											<i class="fa fa-star"></i>	
											</c:forEach> --%>
										</div>
										
									</div>
									<c:choose>
									<c:when test="${comment.restricted == false }">
									<div style="display: inline;width: 500px">
									<p style="white-space: pre">${comment.content }</p>
										<a class="reply_btn" href="javascript:" id="report" commentNo="${comment.commentNo }" style="color:gray;font-size: 10px;">신고하기</a>
										<hr>
									</div>
									</c:when>
									<c:when test="${comment.restricted == true }">
									<div style="display: inline;width: 500px">
									<p style="white-space: pre">관리자의 요청에의에 후기가 삭제되었습니다.</p>
										<%-- <a class="reply_btn" href="javascript:" id="report" commentNo="${comment.commentNo }" style="color:gray;font-size: 10px;">신고하기</a> --%>
										<hr>
									</div>
									</c:when>
									</c:choose>
								
									
									
									<br>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<hr>
								<div class="review_item">
									<p>&nbsp;&nbsp;&nbsp;등록된 후기가 없습니다.</p>
								</div>
								</c:otherwise>
								</c:choose>
						
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<a class="primary-btn" href="javascript:" id="back" style="width:100%;text-align: center;">뒤로가기</a>
		</div>
	</section>
	<!--================End Product Description Area =================-->
	
	<!-- modal section -->
	<%-- <div class ="bg-modal">
		<div class="modal-content">
		<span id="closeBtn">&times;</span>
			<table class="table" style="text-align: center;margin-top: 4%">
						<thead>
							<tr>
								<th scope="col">숙소정보</th>
								<th scope="col">숙소이름</th>
								<th scope="col"></th>
								<th scope="col">체크아웃</th>
							
							</tr>
						</thead>
						<tbody>
					
							<tr>
								<td>
									<div class="media">
                                        <div>
                                <a href="#">
								<img style="width: 100px; height: 100px" src="/haroobang/resources/upload/${roomDetail.roomAttachList[0].savedFileName}" alt="">
								</a>
                                        </div>
                                    </div>
								</td>
								<td>
									<h5>${checkinDate}~${endDate }<br><br></h5>
								</td>
								<td></td>
								<td>
									<h5>총 ${nights }박</h5>
								</td>
								
							</tr>
						</tbody>
					</table>
					
						<div class="col-lg-4" style="margin-left: 7%">
							<div class="order_box" style="width: 900px;">
								<h2>Your Order</h2>
								<ul class="list">
									<li><a href="#">Product <span>Total</span></a></li>
									<li><a href="#">&#8361; ${roomDetail.price } /1박 <span class="middle">x
												${nights }</span> <span class="last">&#8361; ${nights*roomDetail.price }</span></a></li>
									<li><a href="#">쿠폰 사용 내역<span>등록된 쿠폰이 없습니다</span></a></li>
									<hr>
									
								</ul>
								<ul class="list list_2">
									<li>Total <span style="float:right">&#8361; ${nights * roomDetail.price}</span></li>
									<hr>
								</ul>
								<div>
								<div class="payment_item">
									<div class="radion_btn">
										<input type="radio" id="f-option5" name="payment" value="카드결제" checked="checked">
										<label for="f-option5" id="card">카드 결제</label>
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/cardCompanies.jpg"/></p>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
										<input type="radio" id="f-option6" name="payment" value="무통장입금"> 
										<label for="f-option6" id="cash">무통장 입금 </label> 
										<!-- <img src="img/product/card.jpg" alt=""> -->
										<div class="check"></div>
									</div>
									<p><img style="height:150px;width:250px" src="/haroobang/resources/img/banklist.png"/></p>
								</div>
								</div>
								<div class="creat_account">
									<input type="checkbox" id="f-option4" name="selector" id="agreement">
									<label for="f-option4">위의 결제정보에 동의합니다.</label> <a href="#">terms & conditions*</a>
								</div>
								</form>
								<!-- <a class="primary-btn" href="javascript:" id="pay" style="">결제하기</a> -->
								</div>
								<br>
								<a class="primary-btn" href="javascript:" id="pay" style="width: 900px;text-align: center;">결제하기</a>
								<br><br>
								</div>
		</div>
	</div> --%>
<!-- 	
	<style>
	.bg-modal {
	width:100%;
	height:100%;
	background-color: rgba(0,0,0,0.7);
	position: absolute;
	top:0;
	display: flex;
	justify-content: center;
	/* align-items: center; */
	display: none;
	}
	.modal-content {
	margin-top:10%;
	width:80%;
	height:80%;
	background-color:white;
	opacity:1;
	z-index: +1;
	overflow-y: auto;
	}
	#closeBtn{
	margin-left:97%;
	margin-top:1%;
	font-size: 30px;
	position: sticky;
	cursor: pointer;
	}
	#closeBtn:hover {
	background: black;
	width: 20px;
	border-radius:100px;
}
	</style> -->
	<!-- emd Modal -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />
	
	<script type="text/javascript">
$(function(){
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(${room.latitude}, ${room.longitude}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var markerPosition  = new daum.maps.LatLng(${room.latitude}, ${room.longitude}); 
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	var marker = new daum.maps.Marker({
		map:map,
		position:markerPosition
	})
	
	marker.setMap(map);

	$('#back').click(function(e){
		history.back();
	});
	
	
	$('#calendarBox').load("/haroobang/room/calender.action?roomNo="+${room.roomNo});
	
	
	$('#idCheck').click(function(e){
		alert("로그인페이지로 이동합니다.")
	})
	
	$("#notLiked").click(function(e){
		
		 $("#liked").css('display','block');
		 $("#notLiked").css('display','none');
	
			$.ajax({
				url :"addLike.action" ,
				data: {"roomNo":${room.roomNo}},
				method:"GET",
				success:function(data,status,xhr){
					if(data == "success"){
						alert("찜목록에 추가되었습니다")	
					}else if(data =="fail"){
						alert("이미 등록되었습니다.")
					}else{
						alert("로그인 페이지로 이동합니다.")
						location.href = "/haroobang/account/login.action"
					}
				}
			})
	});
	
	$("#liked").click(function(e){
		
		 $("#notLiked").css('display','block');
		 $("#liked").css('display','none');
		 
		 $.ajax({
			 url:"deleteLike.action",
			 data:{"roomNo":${room.roomNo}},
			 method:"GET",
			 success:function(data,status,xhr){
				 if(data == "success"){
					 alert("찜목록에서 삭제되었습니다.")
				 }else if(data=="fail"){
					 alert("찜목록 삭제실패")
				 }else{
					 alert("로그인 페이지로 이동합니다.")
					 location.href = "/haroobang/account/login.action";
				 }
			 }
		 });
	
	});
	
	
	//$(".reply_btn").['#report'].click(function(e){
	//$('a[id ^=report]').click(function(e){
	$('.reply_btn').click(function(e){
	
		if(${login == null}){
			alert("로그인페이지로 이동합니다.")
			location.href = "/haroobang/account/login.action"
		}else{
			
		
		var content = prompt("신고하는 사유를 적어 주세요\nex)\n1.부적절한 언행 \n2.선정적인 언행 \n3.광고성글");
		var commentNo = $(this).attr('commentNo');
		
		if(content != null){
			while(content == ""){
				alert("내용을 입력해주세요.")
				content = prompt("신고하는 사유를 적어 주세요\nex)\n1.부적절한 언행 \n2.선정적인 언행 \n3.광고성글");
			}
			$.ajax({
				url:"/haroobang/room/commentReport.action",
				data:{"content":content,"commentNo":commentNo},
				method:"get",
				success:function(data,status,xhr){
					if(data == "success"){
					alert("신고 완료되었습니다. 관리자의 확인후 후기가 삭제됩니다.")
					}else{
						alert("이미 신고가 접수되었습니다.")
					}
				}	
			});
		}
		}
	});
});
			

</script>

</body>


</html>