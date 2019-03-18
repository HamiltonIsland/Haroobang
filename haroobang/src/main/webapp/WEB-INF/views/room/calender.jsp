<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset='utf-8' />
<link href='/haroobang/resources/calenderCss/fullcalendar.min.css' rel='stylesheet' />
<link href='/haroobang/resources/calenderCss/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/haroobang/resources/calenderCss/lib/moment.min.js'></script>
<script src='/haroobang/resources/calenderCss/fullcalendar.min.js'></script>

<style>

 /*  body {
    margin: 10px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 7px;
  }
*/
  #calendar {
  font-size: 7px;
  defaultView: 'month'
  
  
   /*  max-width: 200px;
    height: 200px; */
   /*  margin: 0 auto; */
   
  }
  
  .fc-day-number {
  data-goto:false;
  } 

</style>


  <div id='calendar'></div>
  <br>
   <c:choose>
    <c:when test="${login.userType == 'admin' }">
     <a class="primary-btn" href="javascript:" id="roomDelete" style="width:100%;text-align: center;">목록에서 지우기</a>
    </c:when>
    <c:otherwise>
    <c:if test="${room.approval==1 and login.memberNo!=room.memberNo }">
   	<h5 style="color: gray;text-align: center">예약을 원하시는 날짜를 드래그해 주세요</h5>    
     <a class="primary-btn" href="javascript:" id="roomReservation" style="width:100%;text-align: center;">예약하기</a>
     </c:if>
    </c:otherwise>
    </c:choose>
<!-- <a class="icon_btn" href="javascript:" id="like" style="display: inline;"><i class="lnr lnr lnr-heart"></i></a> --> 


  
  <script>
	
  //debugger;
	var startDate1 = "";
	var endDate1 = "";
  
    $('#calendar').fullCalendar({
    	defaultView: 'month',
        events: 'https://fullcalendar.io/demo-events.json',
      defaultDate: Date(),
      navLinks: false, // can click day/week names to navigate views
      businessHours: false, // display business hours
      editable: false,
      events: [
    	        <c:choose>
    	         <c:when test = "${dateList.get(0)=='none'}">
    	         {
       	          start: Date(),
       	          /* end: '2019-03-15', */
       	          overlap: false,
       	          rendering: 'background',
       	          color: '#cedfe0',
       	       
       	        },
    	         </c:when>
    
    	         <c:otherwise>
    	          <c:forEach var="dateList" items="${dateList}">
    	          {
           	          start: '${dateList}',
           	          /* end: '2019-03-15', */
           	          overlap: false,
           	          rendering: 'background',
           	          color: '#cedfe0',
           	       
           	        },
    	          </c:forEach>
    	         </c:otherwise>
    	      </c:choose>
      ],
      selectable:true,
      select: function(startDate, endDate) {
      
        	  /* alert(startDate.format() + ' to ' + endDate.format()); */
        	  startDate1 = "";
			  endDate1 = "";
        	  $.ajax({
  				url:"/haroobang/room/checkDate.action",
  				data:{"checkinDate":startDate.format(),"endDate":endDate.format(),"roomNo":${roomNo}},
  				method:"get",
  				success:function(data,status,xhr){
  					if(data == "fail"){
  						alert("선택하신 날짜에는 예약 할 수 없습니다. 날짜를 다시 선택 해 주세요");
  						$("#roomReservation").click(function () {return false;});
  					}else if(data == "exist"){
  						alert("선택하신 날짜는 1박이 예약되지않습니다./선택하신날짜사이에 이미 예약된날짜가 있습니다.")
  						$("#roomReservation").click(function () {return false;});
  					}else if(data == "redirect:/account/login.action"){
  						alert("로그인이 필요합니다.")
  						location.href = "/haroobang/account/login.action"
  					}
  					else {
  						startDate1 = startDate.format();
  						endDate1 = endDate.format()
  					}
  				}
  			});
        }

    });
    
    	$("#roomReservation").click(function(e){
    		if(startDate1.length<1){
    			alert("날짜를 선택해 주세요")
    		}else{
    			location.href = "/haroobang/room/reservationCheckout.action?checkinDate="+startDate1+"&endDate="+endDate1+"&roomNo="+${roomNo};
    		}
    		

    	});
    	
    	$("#roomDelete").click(function(e){
    		
    		var c = confirm("삭제하시겠습니까?");
    		
    		if(c == true){
    			location.href = "/haroobang/room/roomDelete.action?roomNo="+${roomNo}
    		}else{	}
    	});
  
    	
    	
   

</script>










