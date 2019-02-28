<!-- Font Icon -->
<link rel="stylesheet" href="/haroobang/resources/booking/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="/haroobang/resources/booking/vendor/jquery-ui/jquery-ui.min.css">

<!-- Main css -->
<link rel="stylesheet" href="/haroobang/resources/booking/css/style.css">





<form id="booking-form" class="booking-form" method="POST">
    <div class="form-group">
        <div class="form-destination">
            <label for="destination">Destination</label>
            <input type="text" id="destination" name="destination" placeholder="EG. HAWAII" />
        </div>
        <div class="form-date-from form-icon">
            <label for="date_from">From</label>
            <input type="text" id="date_from" class="date_from" placeholder="Pick a date" />
            <!-- <span class="icon"><i class="zmdi zmdi-calendar-alt"></i></span> -->
        </div>
        <div class="form-date-to form-icon">
            <label for="date_to">To</label>
            <input type="text" id="date_to" class="date_to" placeholder="Pick a date" />
            <!-- <span class="icon"><i class="zmdi zmdi-calendar-alt"></i></span> -->
        </div>
        <div class="form-quantity">
            <label for="quantity">Quantity</label>
            <span class="modify-qty plus" onClick="Tang()"><i class="zmdi zmdi-chevron-up"></i></span>
            <input type="number" name="quantity" id="quantity" value="0" min="0" class="nput-text qty text">
            <span class="modify-qty minus" onClick="Giam()"><i class="zmdi zmdi-chevron-down"></i></span>
        </div>
        <div class="form-submit">
            <input type="submit" id="submit" class="submit" value="Book now" />
        </div>
    </div>
</form>



<script src="/haroobang/resources/booking/vendor/jquery/jquery.min.js"></script>
<script src="/haroobang/resources/booking/vendor/jquery-ui/jquery-ui.min.js"></script>
<script src="/haroobang/resources/booking/js/main.js"></script>