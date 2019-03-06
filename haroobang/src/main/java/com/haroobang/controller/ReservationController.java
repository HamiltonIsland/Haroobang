package com.haroobang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.RoomReservationService;

@Controller
@RequestMapping("/reservation/")
public class ReservationController {
	
	@Autowired
	@Qualifier("RoomReservationService")
	RoomReservationService roomReservationservice;

	@RequestMapping(value = "reservationCheckout.action", method = RequestMethod.GET)
	public String roomReservationCheckout(String checkinDate, int nights,Model model) {
	
		model.addAttribute("checkinDate",checkinDate);
		model.addAttribute("nights",nights);

		return "reservation/reservationCheckout";
	}

}
