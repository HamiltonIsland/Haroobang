<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Font Icon -->
<link rel="stylesheet" href="/haroobang/resources/booking/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/haroobang/resources/booking/vendor/jquery-ui/jquery-ui.min.css">

<!-- Main css -->
<link rel="stylesheet" href="/haroobang/resources/booking/css/style.css">





<form id="booking-form" class="booking-form" method="get" action="/haroobang/room/searchRoomList.action">
    <div class="form-group">
        <div class="form-destination">
            <label for="destination">Destination</label>
            <input type="text" id="destination" name="address" placeholder="EX.제주시" />
        </div>
        <div class="form-date-from form-icon">
            <label for="date_from">From</label>
            <input type="text" id="date_from" name="checkIn" class="date_from" placeholder="체크인" />
            <!-- <span class="icon"><i class="zmdi zmdi-calendar-alt"></i></span> -->
        </div>
        <div class="form-date-to form-icon">
            <label for="date_to">To</label>
            <input type="text" id="date_to" name="checkOut" class="date_to" placeholder="체크아웃" />
            <!-- <span class="icon"><i class="zmdi zmdi-calendar-alt"></i></span> -->
        </div>
        <div class="form-quantity">
            <label for="quantity">Quantity</label>
            <span class="modify-qty plus" onClick="Tang()"><i class="zmdi zmdi-chevron-up"></i></span>
            <input type="number" name="maximum" id="quantity" value="0" min="0" class="nput-text qty text">
            <span class="modify-qty minus" onClick="Giam()"><i class="zmdi zmdi-chevron-down"></i></span>
        </div>
        <div class="form-submit">
            <input type="submit" id="submitbtn" class="submit" value="Book now" />
        </div>
    </div>
</form>


<script src="/haroobang/resources/booking/vendor/jquery/jquery.min.js"></script>
<script src="/haroobang/resources/booking/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="/haroobang/resources/booking/js/main.js"></script>