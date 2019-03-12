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

    <!--
            CSS
            ============================================= -->
    <jsp:include page="/WEB-INF/views/include/css.jsp" />
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
                    <nav class="d-flex align-items-center">
                        <a href="index.html">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="category.html">Cart</a>
                    </nav>
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
                        	<tr class="search">
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
                                        
											<c:set var="spacebar" value=" " />
		                
                                            <p class="searchh">${fn:replace(reservation.roomVO.roomName, spacebar, "<br>") }</p>
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
                                    <h5>$${reservation.totalPrice}</h5>
                                </td>
                                <td>
                                    <div class="button-group-area mt-40">
                                    	<a href="#" class="genric-btn primary circle">환불</a>
										<a href="javascript:;" class="genric-btn danger circle">삭제</a>
									</div>
                                </td>
                            </tr>
                        </c:forEach>
                            <!-- <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/cart.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/cart.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="media">
                                        <div class="d-flex">
                                            <img src="img/cart.jpg" alt="">
                                        </div>
                                        <div class="media-body">
                                            <p>Minimalistic shop for multipurpose use</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>$360.00</h5>
                                </td>
                                <td>
                                    <div class="product_count">
                                        <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
                                            class="input-text qty">
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                            class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                        <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                            class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                    </div>
                                </td>
                                <td>
                                    <h5>$720.00</h5>
                                </td>
                            </tr>
                            <tr class="bottom_button">
                                <td>
                                    <a class="gray_btn" href="#">Update Cart</a>
                                </td>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <div class="cupon_text d-flex align-items-center">
                                        <input type="text" placeholder="Coupon Code">
                                        <a class="primary-btn" href="#">Apply</a>
                                        <a class="gray_btn" href="#">Close Coupon</a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>Subtotal</h5>
                                </td>
                                <td>
                                    <h5>$2160.00</h5>
                                </td>
                            </tr> -->
                            <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
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
   	});
   </script>
</body>

</html>