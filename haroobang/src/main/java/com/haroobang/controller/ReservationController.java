package com.haroobang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/reservation/")
public class ReservationController {
	
	

	@RequestMapping(value="reservationCheckout.action", method=RequestMethod.GET)
	public String roomReservationCheckout(String checkinDate, int nights) {
		
		
		return "reservation/reservationCheckout";
	}
	
}
