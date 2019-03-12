
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
<title>이전예약정보</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(function(){
	
})
			

</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />

	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>이전예약보기</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Cart Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive" style="text-align: center">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">숙소정보</th>
								<th scope="col">몇박</th>
								<th scope="col">총금액</th>
								<th scope="col">결제수단</th>
								<th scope="col">결제일시</th>
								<th scope="col">입실날짜</th>
                                <th scope="col">퇴실날짜</th>
								<th scope="col">결제고객</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<a
												href="/haroobang/room/roomDetail.action?roomNo=${roomno}"><img
												style="height: 100px; width: 100px"
												src="/haroobang/resources/img/cashPayment.jpg" alt=""></a>
										</div>
										<div class="media-body" style="text-align: left">
											<a href="/haroobang/room/roomDetail.action?roomNo=${roomno}">
												<p>${reservationdetail.roomVO.roomName }</p>
											</a>
										</div>
									</div>
								</td>
								<td>
									<h5>${reservationdetail.nights }박</h5>
								</td>
								<td>
									<h5>&#8361; ${reservationdetail.totalPrice }</h5>
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
					<%--  
                    <thead>
                            <tr>
                                <th scope="col">결제일시</th>
                                <th scope="col">입실날짜</th>
                                <th scope="col">퇴실날짜</th>
                                <th scope="col">결제고객</th>
                                
                            </tr>
                         </thead>
                         <tbody>
                            <tr >
                                <td >
                                    <h5>${reservationdetail.regDate }</h5>
                                </td>
                                
                                <td>
                                    <h5>${reservationdetail.startDate }</h5>
                                </td>
                                
                                <td>
                                    <h5>${reservationdetail.endDate }</h5>
                                </td>
                                
                                	<td>
                                    	<h5>${reservationdetail.name }</h5>
                                	</td>
                                	
                            </tr>
                          </tbody> --%>
					<a class="gray_btn" href="/haroobang/mypage/commentRegister.action">후기등록</a>
				</div>

			</div>

		</div>

	</section>

	<!--================End Product Description Area =================-->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>

</html>