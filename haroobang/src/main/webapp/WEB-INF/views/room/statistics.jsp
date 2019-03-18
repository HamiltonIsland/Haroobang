<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>통계자료</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>통계자료</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->


	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">	
				<c:if test = "${login.userType=='admin'}">			
				<li class="nav-item"><a class="nav-link <c:if test="${login.userType=='admin'}"> active</c:if>" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="true">월 매출</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">월별 예약건수</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#member" role="tab" aria-controls="member"
					aria-selected="false">회원 수</a></li>
				</c:if>
				<c:if test="${login.userType=='user'}">
				<li class="nav-item"><a class="nav-link <c:if test="${login.userType=='user'}">active</c:if>" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="false">내 숙소 현황</a></li>
				</c:if>
				
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade <c:if test="${login.userType=='user'}"> show active</c:if>" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div id="chartContainer1" style="text-align:center">	
					</div>
				</div>
				
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div id="chartContainer2" style="text-align:center">	
					</div>
				</div>

				<div class="tab-pane fade <c:if test="${login.userType=='admin'}"> show active</c:if>" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div id="chartContainer3" style="text-align:center">	
					</div> 
				</div>
				<div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab">
					<div id="chartContainer4" style="text-align:center">
					<div class="row"> 
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
		                        <div class="analytics-sparkle-line table-mg-t-pro dk-res-t-pro-30">
		                            <div class="analytics-content"> 
		                                <h5>가입된 회원수</h5>   
		                                <h2><span class="counter">${StatisticsList.memberCount}</span> <span class="tuition-fees">명</span></h2>
		                                <span class="text-inverse"></span> 
		                                <div class="progress m-b-0">
		                                    <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:100%;"> <span class="sr-only">230% Complete</span> </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
		                        <div class="analytics-sparkle-line table-mg-t-pro dk-res-t-pro-30">
		                            <div class="analytics-content"> 
		                                <h5>가입된 회원수</h5>   
		                                <h2><span class="counter">12</span> <span class="tuition-fees">명</span></h2>
		                                <span class="text-inverse"></span> 
		                                <div class="progress m-b-0">
		                                    <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:80%;"> <span class="sr-only">230% Complete</span> </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
		                        <div class="analytics-sparkle-line table-mg-t-pro dk-res-t-pro-30">
		                            <div class="analytics-content"> 
		                                <h5>가입된 회원수</h5>   
		                                <h2><span class="counter">12</span> <span class="tuition-fees">명</span></h2>
		                                <span class="text-inverse"></span> 
		                                <div class="progress m-b-0">
		                                    <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:80%;"> <span class="sr-only">230% Complete</span> </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
		                        <div class="analytics-sparkle-line table-mg-t-pro dk-res-t-pro-30">
		                            <div class="analytics-content"> 
		                                <h5>가입된 회원수</h5>   
		                                <h2><span class="counter">12</span> <span class="tuition-fees">명</span></h2>
		                                <span class="text-inverse"></span> 
		                                <div class="progress m-b-0">
		                                    <div class="progress-bar progress-bar-inverse" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:80%;"> <span class="sr-only">230% Complete</span> </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		            </div>	
					</div>
				</div>
			</div>			
		</div>
	</section>
	<!--================End Product Description Area =================-->
	
<script src="/haroobang/resources/js/d3.v4.3.0.js"></script>
<script src="http://dimplejs.org/dist/dimple.v2.3.0.min.js"></script>
<script type="text/javascript">

	//통계1
    var svg1 = dimple.newSvg("#chartContainer1", 590, 400);    
   	var data1 = [
   	     { "성별": "여자", "예약건수":${StatisticsList.femaleCount}}, 
   	     { "성별": "남자", "예약건수":${StatisticsList.genderCount}-${StatisticsList.femaleCount}}    
   	     
   	];   	
    var myChart1 = new dimple.chart(svg1, data1);
    myChart1.setBounds(20, 20, 460, 360)
    myChart1.addMeasureAxis("p", "예약건수");
    var ring = myChart1.addSeries("성별", dimple.plot.pie);
    ring.innerRadius = "50%";
    myChart1.addLegend(500, 20, 90, 300, "left");
    myChart1.draw();

    
 	//통계2
    var svg2 = dimple.newSvg("#chartContainer2", 590, 400);    
   	var data2 = [];  
   	//for(var i=0;i<${ fn:length(monthCount)};i++){
   	<c:forEach var="monthCounts" items="${monthCount}">
   		data2.push({ "": '${monthCounts.months}',"예약건수":${monthCounts.count} })
   	</c:forEach>
   	//}
   	var myChart2 = new dimple.chart(svg2, data2);
    myChart2.setBounds(60, 30, 510, 305)
    var x = myChart2.addCategoryAxis("x", "");
    x.addOrderRule("Date");
    myChart2.addMeasureAxis("y", "예약건수");
    var s = myChart2.addSeries(null, dimple.plot.line);
    s.interpolation = "cardinal";
    myChart2.draw();
    
  	//통계3
    var svg3 = dimple.newSvg("#chartContainer3", 590, 400);    
   	var data3 = [];  
   	//for(var i=0;i<${ fn:length(monthCount)};i++){
   	<c:forEach var="monthCounts" items="${monthCount}">
   		data3.push({ "": '${monthCounts.months}',"  ":${monthCounts.totalPrice} })
   	</c:forEach>
   	//}
   	var myChart3 = new dimple.chart(svg3, data3);
    myChart3.setBounds(60, 30, 510, 305)
    var x = myChart3.addCategoryAxis("x", "");
    x.addOrderRule("Date");
    myChart3.addMeasureAxis("y", "  ");
    var s = myChart3.addSeries(null, dimple.plot.area);
    s.interpolation = "cardinal";
    myChart3.draw();

</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>


</html>