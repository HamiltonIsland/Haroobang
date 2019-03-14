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
<title>결제완료 내역</title>
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
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>결제완료 내용</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Cart Area =================-->
    <section class="cart_area">
        <div class="container">
            <div class="cart_inner">
                <div class="table-responsive"  style="text-align: center">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;숙소정보</th>
                                <th scope="col">1박 금액</th>
                                <th scope="col">몇박</th>
                                <th scope="col">총금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr >
                                <td >
                                    <div class="media">
                                        <div class="d-flex">
                                          <a href="roomDetail.action?roomNo=${roomDetail.roomNo}"><img style="height:100px;width:100px" src="/haroobang/resources/img/cashPayment.jpg" alt=""></a>  
                                        </div>
                                        <div class="media-body" style="text-align: left">
                                           <a href="roomDetail.action?roomNo=${roomDetail.roomNo}"> <p>${roomDetail.roomName }</p></a> 
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <h5>&#8361; ${roomDetail.price }</h5>
                                </td>
                                <td>
                                    <h5>${reservation.nights }박</h5>
                                </td>
                                <td>
                                    <h5>&#8361; ${reservation.totalPrice }</h5>
                                </td>
                            </tr>
                
                           
                            <tr class="shipping_area">
                                <td>

                                </td>
                                <td>

                                </td>
                                <td>
                                    <h5>결제정보</h5>
                                </td>
                                <c:choose>
                                	<c:when test="${reservation.payment=='무통장입금' }">
                                	<td>
                                    	<div class="shipping_box">
                                      	<h5>무통장 입금</h5>
                                      	<h5>구트 은행 </h5>
                                      	<h5>0002-****-****-3545 </h5>
                                    	</div>
                                	</td>
                                	</c:when>
                                	<c:when test="${reservation.payment=='카드결제' }">
                                	 <td>
                                    	<div class="shipping_box">
                                      	<h5>카드 결제</h5>
                                      	<h5>visa card </h5>
                                      	<h5>0002-****-****-3545 </h5>
                                    	</div>
                                	</td>
                                	</c:when>
                                </c:choose>
                              
                                
                               
                            </tr>
                            <tr class="bottom_button">
                                <td>
                                    
                                </td>
                                <td>

                                </td>
                                <td>
 
                                </td>
                                <td>
                                   
                                </td>
                            </tr>
                          
                            
                        </tbody>
                    </table>
                      <a class="gray_btn" href="#">마이페이지로 가기</a>
                </div>
               
            </div>
            
        </div>
        
    </section>
	
	<!--================End Product Description Area =================-->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>

</html>