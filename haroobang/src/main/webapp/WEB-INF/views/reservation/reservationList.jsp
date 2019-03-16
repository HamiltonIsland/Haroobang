<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/fav.png">
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
<!-- 썅 -->
    <!--
            CSS
            ============================================= -->
    <jsp:include page="/WEB-INF/views/include/css.jsp" />
    <style type="text/css">
		.txt_line { width:100px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
	</style>
</head>

<body>

    <!-- Start Header Area -->
	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- End Header Area -->

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shop Category Cart</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
        <h3 class="text-heading">모든 결제 내역</h3>
        <table class="table">
		       <thead>
							<tr class="bottom_button">
								<td></td><td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td></td><td></td><td></td><td></td><td></td>
								<td>
					<div class="input-group">
		            	<input type="text" class="form-control" placeholder="Search by Keyword" id="keyword">
		            	<span class="input-group-btn">
		            	<button type="submit" class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
		               	</span>
		            </div>
								</td>
							</tr>
							</thead>
						</table>
            <div class="cart_inner">
                <div class="table-responsive">
                    <table class="table" id="search">
                        <thead>
                        <%-- <tr><td></td><td></td><td></td><td></td><td></td><td></td>
                            <td>
                            <div class="pagination">
								${ pager }
				               </div>
				               </td>
				               </tr> --%>
                            <tr>
                                <th scope="col">Product</th>
                                <th scope="col">Payment</th>
                                <th scope="col">Stay</th>
                                <th scope="col">Check IN or OUT</th>
                                <th scope="col">Settlement day</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="reservation" items="${reservations}">
                        	<tr class="search" data-reservationNo="${reservation.reservationNo}">
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                <c:choose>
									<c:when test="${not empty reservation.roomAttachList}">
										 <div class="main-carousel" data-flickity='{ "autoPlay": true }'>
										<c:forEach var="attach" items="${reservation.roomAttachList}">
												  <img style="width: 50px; height: 50px" src="/haroobang/resources/upload/${attach.savedFileName}" alt=""
													 onerror="this.src = '/haroobang/resources/upload/default.jpg'">
										</c:forEach>
									</div>
									</c:when>
									<c:otherwise>
										<img style="width: 50px; height: 50px" src="/haroobang/resources/img/product/p1.jpg" alt="">
									</c:otherwise>
								</c:choose>
								
                                        </div>
                                        
                                        <div class="media-body">
                                            <p class="searchh txt_line">${reservation.roomVO.roomName}</p>
                                        </div>
                                        
                                    </div>
                                </td>
                                
                                <td>
                                    <h5>${reservation.payment}</h5>
                                </td>
                                
                                <td>
                                    <h5>${reservation.startDate} ~ ${reservation.endDate}</h5>
                                </td>
                                
                                <td>
                                    <h5>
                                    <c:choose>
                                    	<c:when test='${not empty reservation.checkin and reservation.checkin eq true }'>
                                    		<h5 style="color: blue; text-align: center;">Check-IN</h5>
                                    		
                                    		<%-- <c:if test='${ reservation.checkin eq 2 }'>
                                    		<h5 style="color: red;">Check-OUT</h5>
                                    		</c:if> --%>
                                    		
                                    	</c:when>
                                    	<c:otherwise>
                                    		<h5 style="color: red; text-align: center;">NOT Arrive</h5>
                                    	</c:otherwise>
                                    </c:choose>
                                    </h5>
                                </td>
                                
                                <td>
                                    <h5>${reservation.regDate}</h5>
                                </td>
                                
                                <td>
                                    <h5>${reservation.totalPrice}원</h5>
                                </td>
                                <td>
                                    <div class="button-group-area mt-40">
                                    <c:choose>
                                    	<c:when test='${not empty reservation.checkin and reservation.checkin eq true }'>
											<a href="javascript:;" class="genric-btn danger circle" id='deleteRservation${reservation.reservationNo}'>삭제</a>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:if test='${not empty reservation.refund and reservation.refund eq 1 }'>
                       							<a href="javascript:;" class="genric-btn primary circle" id='refundRservation${reservation.reservationNo}'>환불</a>
                       						</c:if>
                       						<c:if test='${not empty reservation.refund and reservation.refund eq 0 }'>
                       							<h6>환불 신청이 없습니다.</h6>
                       						</c:if>
                                    	</c:otherwise>
                                    </c:choose>
									</div>
                                </td>
                            </tr>
                        </c:forEach>
                            
                            <tr><td></td><td></td><td></td><td></td><td></td><td></td>
                            <td>
                            <div class="pagination">
								${ pager }
				               </div>
				               </td>
				               </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

    <!-- start footer Area -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
    <!-- End footer Area -->


   <jsp:include page="/WEB-INF/views/include/js.jsp" />
   <script type="text/javascript">
   	$(function(){
   		$("#keyword").on('keyup', function() {
			var k = $(this).val();
			$("#search").find(".search").hide();

			var temp = $("p.searchh:contains('" + k + "')");
			$(temp).parents(".search").show();
		});
   		
   		$("a[id ^=deleteRservation]").on('click',function(event){
			
			var reservationNo = $(this).parents('.search').attr('data-reservationNo');
			
			$.ajax({
				"url": "deleteRservation.action",
				"method": "POST",
				"data": { 'reservationNo' : reservationNo },
				"success": function(data, status, xhr) {
					if (data === "success"){
						alert('내역이 삭제 되었습니다.');
						location.reload(true);
					}
				},
				"error": function(xhr, status, err) {
					alert('삭제 실패다!! 얌마!!');
					location.reload(true);
				}
			});
		});
   		
		$("a[id ^=refundRservation]").on('click',function(event){
			
			var reservationNo = $(this).parents('.search').attr('data-reservationNo');
			
			$.ajax({
				"url": "refundRservation.action",
				"method": "POST",
				"data": { 'reservationNo' : reservationNo },
				"success": function(data, status, xhr) {
					if (data === "success"){
						alert('환불 되었습니다.');
						location.reload(true);
					}
				},
				"error": function(xhr, status, err) {
					alert('환불 실패다!! 얌마!!');
					location.reload(true);
				}
			});
		});
   	});
   </script>
</body>

</html>