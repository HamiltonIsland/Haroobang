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
				<li class="nav-item"><a class="nav-link active" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">이익</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">월별 예약건수</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">통계3</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<div id="chartContainer1" style="text-align:center">	
					</div>
				</div>
				
				<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<div id="chartContainer2" style="text-align:center">	
					</div>
				</div>

				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div id="chartContainer3" style="text-align:center">	
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
   	     { "이름": "check-in Price", "가격":${totalCheckinPrice}},
   	     { "이름": "uncheck-in Price", "가격":${totalPrice}-${totalCheckinPrice}}
   	     
   	];   	
    var myChart1 = new dimple.chart(svg1, data1);
    myChart1.setBounds(20, 20, 460, 360)
    myChart1.addMeasureAxis("p", "가격");
    myChart1.addSeries("이름", dimple.plot.pie);
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
    myChart2.addSeries(null, dimple.plot.bar);
    myChart2.draw();

</script>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>


</html>