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

    <a class="primary-btn" href="javascript:" id="roomReservation" style="width:100%;text-align: center;">예약하기</a>
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
        	  
        	  $.ajax({
  				url:"/haroobang/room/checkDate.action",
  				data:{"checkinDate":startDate.format(),"endDate":endDate.format(),"roomNo":${roomNo}},
  				method:"get",
  				success:function(data,status,xhr){
  					if(data == "fail"){
  						alert("선택하신 날짜에는 예약 할 수 없습니다. 날짜를 다시 선택 해 주세요");
  					}else if(data == "redirect:/account/login.action"){
  						location.href = "/haroobang/account/login.action"
  					}
  					else {
  						startDate1 = startDate.format();
  						endDate1 = endDate.format()
  						/* alert(startDate.substring(8,10)-endDate.substring(8,10)); */
  						//location.href = "/haroobang/room/reservationCheckout.action?checkinDate=" + checkinDate+"&nights="+nights+"&roomNo="+${room.roomNo}
  					}
  				}
  			});
        }

    });
    
 
    	$("#roomReservation").click(function(e){
    		location.href = "/haroobang/room/reservationCheckout.action?checkinDate="+startDate1+"&endDate="+endDate1+"&roomNo=35";
    		/* location.href = "/haroobang/room/reservationCheckout.action?checkinDate=" + startDate+"&endDate="+ endDate+"&roomNo=35" */
    		
    	});
  
    	
    	
   

</script>










