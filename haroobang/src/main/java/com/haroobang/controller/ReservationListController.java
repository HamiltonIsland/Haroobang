package com.haroobang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.ReservationService;
import com.haroobang.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")//커밋...
public class ReservationListController {
	
	@Autowired
	@Qualifier("ReservationService")
	private ReservationService reservationService; 
	
	@RequestMapping(value="/reservationList.action", method=RequestMethod.GET)
	public String roomList(Model model) {
		List<ReservationVO> reservations = reservationService.findAllReservations();
		
		model.addAttribute("reservations", reservations);
		
		return "reservation/reservationList";
	}
}
//샹