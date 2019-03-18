<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	<title>LastReservation</title>    
	<style type="text/css">
   .txt_line { width:200px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
   </style>
	<!--
            CSS
            ============================================= -->
   
	<jsp:include page="../include/css.jsp"/>
	<jsp:include page="../include/js.jsp"/>
</head>

<body id="category">
	<%-- <div class="modal fade" id="myModal" role="dialog"
		style="top: 30%; z-index: -100;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #00ba8b;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="color: white;">이전예약보기</h3>
				</div>
				<div class="container">
					<div class="cart_inner">
						<div class="table-responsive" style="text-align: center">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">숙소정보</th>
										<th scope="col">몇박</th>
										<th scope="col">총결제금액</th>
										<th scope="col">결제수단</th>
										<th scope="col">결제일시</th>
										<th scope="col">체크인</th>
										<th scope="col">체크아웃</th>
										<th scope="col">결제고객</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<div class="media">
												<div class="d-flex">
													<a
														href="/haroobang/room/roomDetail.action?roomNo=${roomno}">
														<c:choose>
															<c:when
																test="${not empty reservationdetail.roomAttachList}">
																<c:forEach var="attach"
																	items="${reservationdetail.roomAttachList}">
																	<img style="height: 100px; width: 100px"
																		src="/haroobang/resources/upload/${attach.savedFileName}"
																		alt=""
																		onerror="this.src = '/haroobang/resources/upload/default.jpg'">
																</c:forEach>
															</c:when>
															<c:otherwise>
																<img style="width: 100px; height: 100px"
																	src="/haroobang/resources/img/product/p1.jpg" alt="">
															</c:otherwise>
														</c:choose>
													</a>
												</div>
												<div class="media-body" style="text-align: left">
													<a
														href="/haroobang/room/roomDetail.action?roomNo=${roomno}">
														<p>${reservationdetail.roomVO.roomName }</p>
													</a>
												</div>
											</div>
										</td>
										<td>
											<h5>${reservationdetail.nights }박</h5>
										</td>
										<td>
											<h5>${reservationdetail.totalPrice }원</h5>
										</td>
										<td>
											<h5>${reservationdetail.payment}</h5>
										</td>
										<td>
											<h5>${reservationdetail.regDate }</h5>
										</td>

										<td>
											<h5>${reservationdetail.startDate }</h5>
										</td>

										<td>
											<h5>${reservationdetail.endDate }</h5>
										</td>

										<td>
											<h5>${reservationdetail.accountVO.name }</h5>
										</td>
									</tr>
								</tbody>

							</table>
							<a class="gray_btn"
								href="/haroobang/mypage/commentRegister.action?roomno=${ roomno }&reservationno=${ reservationdetail.reservationNo }">후기등록</a>
						</div>

					</div>

				</div>
				<!-- /content -->
			</div>
		</div>
	</div> --%>
	<!-- Start Header Area -->
	<jsp:include page="../include/navbar.jsp"/>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>이전 예약 목록</h1>
					
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">My page</div>
					<ul class="main-categories">
						<li class="main-nav-list"><a href="/haroobang/mypage/likeList.action?memberno=${ login.memberNo }">
							<span class="lnr lnr-arrow-right"></span>내가 찜한 숙소</a>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span
								 class="lnr lnr-arrow-right"></span>내 예약 목록</a>
							<ul class="collapse show" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
								<li class="main-nav-list child"><a href="/haroobang/mypage/currentReservationList.action?memberno=${ login.memberNo }" >현재 예약 목록</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/lastReservationList.action?memberno=${ login.memberNo }" style="color: #ffc107;">이전 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a data-toggle="collapse" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span
								 class="lnr lnr-arrow-right"></span>내 숙소 관리</a>
							<ul class="collapse" id="officeProduct" data-toggle="collapse" aria-expanded="false" aria-controls="officeProduct">
								<li class="main-nav-list child"><a href="/haroobang/mypage/waitingList.action?memberno=${login.memberNo }">승인 대기중 / 등록된 숙소</a></li>
								<li class="main-nav-list child"><a href="/haroobang/mypage/myRoomReservation.action?memberno=${ login.memberNo }">내 숙소 예약 목록</a></li>
							</ul>
						</li>
						
						<li class="main-nav-list"><a href="/haroobang/mypage/commentList.action?memberno=${ login.memberNo }">
							<span class="lnr lnr-arrow-right"></span>내 후기 관리</a>
						</li>
						
						<li class="main-nav-list"><a href="/haroobang/account/profile.action">
							<span class="lnr lnr-arrow-right"></span>내 정보 수정</a>
						</li>
						
					</ul>
				</div>
				
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
						<select>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
							<option value="1">Default sorting</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
							<option value="1">Show 12</option>
						</select>
					</div>
					<div class="pagination">
						${ pager }
					</div>
				</div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="cart_area" style="padding-top:10px">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive" style="text-align: center">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">숙소정보</th>
								<th scope="col">체크인</th>
								<th scope="col">체크아웃</th>
								<th scope="col">총결제금액</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="myroom" items="${ myrooms }">
							<tr>
								<td>
									<div class="media">
                                        <div>
                                <a href="/haroobang/mypage/lastReservationDetail.action?roomno=${ myroom.roomNo }&startdate=${ myroom.startDate }">
                                <c:choose>
									<c:when test="${not empty myroom.roomAttachList}">
										<c:forEach var="attach" items="${myroom.roomAttachList}">
                                			<img style="height: 100px; width: 100px"
												src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
												onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</c:when>
									<c:otherwise>
										<img style="width: 100px; height: 100px" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose>
								</a>
                                        </div>
                                        
                                        <div class="media-body">
                                            <a href="/haroobang/mypage/lastReservationDetail.action?roomno=${ myroom.roomNo }&startdate=${ myroom.startDate }" id="show-detail-modal">${myroom.roomVO.roomName}</a>
                                            <%-- /haroobang/mypage/lastReservationDetail.action?roomno=${ myroom.roomNo }&startdate=${ myroom.startDate } --%>
                                        </div>
                                        
                                    </div>
								</td>
								<td>
									<h5>${ myroom.startDate }</h5>
								</td>
								<td>
									<h5>${ myroom.endDate }</h5>
								</td>
								<td>
                                    <h5>${ myroom.totalPrice } 원</h5>
                                </td>
								
							</tr>
						</c:forEach>
						</tbody>

					</table>
				</div>

			</div>

		</div>

	</section>
				
				<!-- End Best Seller -->
				
			</div>
		</div>
	</div>

	<br><br><br><br><br><br><br><br>

	<!-- start footer Area -->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<!-- End footer Area -->
	
	
</body>
<!-- <script type="text/javascript">
	window.addEventListener('load', function(event) {
		$('#show-detail-modal').on('click', function(event) {
			var register_modal = $('#myModal');
			register_modal.css({
				'z-index' : '1050'
			});
			register_modal.modal('show');
			
			$.ajax({
				"url": "lastReservationDetail.action",
				"type": "GET",
				"data": {"roomno" : roomNo,
						 "startdate" : startDate },
				"processData" : false,
	            "contentType" : false,
				"success": function(formData, status, xhr) {
					if(formData === "success") {
						alert('센터 정보를 수정했습니다.');
					} else {
						alert('센터 정보 수정 실패');
					}
						
					location.href="/team-project3/home.action";
					location.reload(true);
				},
				"error": function(xhr, status, err) {
					alert('센터 정보 수정 실패');
					location.reload(true);
				}
			});
		});

	});
	$(function() {
		$('#centermodify').on('click', function(event) {
			//event.preventDefault(); //이벤트를 발생시킨 객체의 기본 동작 수행 차단
			//event.stopPropagation(); //상위 객체로의 이벤트 전달 차단
			
			//var data = $('#memberupdateform').serializeArray(); // [{boardno:'xxx'}, {writer:'yyy'}, ]
			var formData = new FormData($('#centermodifyform')[0]);
			
			$.ajax({
				"url": "setting.action",
				"type": "POST",
				"data": formData,
				"enctype": 'multipart/form-data',
				"processData" : false,
	            "contentType" : false,
				"success": function(formData, status, xhr) {
					if(formData === "success") {
						alert('센터 정보를 수정했습니다.');
					} else {
						alert('센터 정보 수정 실패');
					}
						
					location.href="/team-project3/home.action";
					location.reload(true);
				},
				"error": function(xhr, status, err) {
					alert('센터 정보 수정 실패');
					location.reload(true);
				}
			});
		}); 
	})
</script> -->

</html>