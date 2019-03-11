<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='/haroobang/resources/calenderCss/fullcalendar.min.css' rel='stylesheet' />
<link href='/haroobang/resources/calenderCss/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='/haroobang/resources/calenderCss/lib/moment.min.js'></script>
<script src='/haroobang/resources/calenderCss/lib/jquery.min.js'></script>
<script src='/haroobang/resources/calenderCss/fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {
	  
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
    });

  });

</script>
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
    margin: 0 auto;
   
  }
  
  .fc-day-number {
  data-goto:false;
  } 

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>









