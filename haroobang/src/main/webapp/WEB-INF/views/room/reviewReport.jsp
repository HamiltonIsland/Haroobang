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
<title>reviewReport</title>
<jsp:include page="/WEB-INF/views/include/css.jsp" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript">

	
		

</script>



</head>

<body>

	<jsp:include page="/WEB-INF/views/include/navbar.jsp" />
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>후기 신고 리스트</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">

				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">후기 신고 리스트 </a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
			
		

				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
					
							<div class="review_list">
								<div class="review_item" style="width: 1050px">
								
								<hr>
							<c:forEach var="reports" items="${ reports }">
								<div class="media">
										<div class="d-flex">
										<hr>
										<hr><hr><hr>
							<%-- 			<c:choose>
										<c:when test="${empty comment.member.savedFileName }">
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/default.jpg"/>
										</c:when>
										<c:otherwise>
										<img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/${comment.member.savedFileName }">
										</c:otherwise>
										</c:choose>
											 --%>
											 <img style="width:50px;height:50px;border-radius:50px" src="/haroobang/resources/upload/${reports.roomAttach}"/>
										</div>
										<div class="media-body">
										<p style="white-space: pre">${reports.commentVO.nickName }</p>
										<p style="white-space: pre">${reports.regDate }</p>
											<h4>${reports.content }</h4>
											<c:forEach var="y" begin="1" end="${comment.rates}">
											</c:forEach>
									
											<%-- <c:forEach var="z" begin="1" end="${5 - comment.rates}">
											<i class="fa fa-star"></i>	
											</c:forEach> --%>
										</div>
										
									</div>
								
									<div style="display: inline;width: 500px">

										<hr>
									</div>
									
									<br>
								</c:forEach>
						
							
						
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/include/js.jsp" />

</body>

</html>