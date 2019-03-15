package com.haroobang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroobang.service.ReservationService;
import com.haroobang.ui.ThePager;
import com.haroobang.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")//커밋...
public class ReservationListController {
	
	@Autowired
	@Qualifier("ReservationService")
	private ReservationService reservationService; 
	
	@RequestMapping(value="/reservationList.action", method=RequestMethod.GET)
	public String roomList(@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model) {
		
		int pageSize = 8;	//한 페이지에 표시되는 데이터 개수
		int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
		int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
		int pagerSize = 10;	//한 번에 표시되는 페이지 번호 개수
		String linkUrl = "reservationList.action"; //페이지 번호를 눌렀을 때 이동할 경로
		
		//List<ReservationVO> reservations = reservationService.findAllReservations();
		List<ReservationVO> reservations = reservationService.findAllReservationsByPage(from, to);
		int reserCount = reservationService.findReserCount();
		
		ThePager pager = new ThePager(reserCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("reservations", reservations);
		model.addAttribute("pager", pager);
		model.addAttribute("pageno", pageNo);
		
		return "reservation/reservationList";
	}
}
//샹