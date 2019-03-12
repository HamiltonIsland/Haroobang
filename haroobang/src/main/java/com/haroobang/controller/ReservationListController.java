package com.haroobang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.ReservationService;

@Controller
@RequestMapping("/reservation")//커밋...
public class ReservationListController {
	
	@Autowired
	@Qualifier("ReservationService")
	private ReservationService reservationService; 
	
	@RequestMapping(value="/reservationList.action", method=RequestMethod.GET)
	public String roomList(Model model) {
		
		return "reservation/reservationList";
	}
}
