package com.haroobang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/reservation")//커밋...
public class ReservationListController {
	@RequestMapping(value="/reservationList.action", method=RequestMethod.GET)
	public String roomList(Model model) {
		
		return "reservation/reservationList";
	}
}
