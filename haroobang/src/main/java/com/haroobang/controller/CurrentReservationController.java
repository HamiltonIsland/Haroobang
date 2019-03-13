package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroobang.service.CurrentReservationService;
import com.haroobang.service.LastReservationService;
import com.haroobang.service.RoomRegisterService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;


@Controller
@RequestMapping("/mypage")
public class CurrentReservationController {
	@Autowired
	@Qualifier("CurrentReservationService")
	private CurrentReservationService currentReservationService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/currentReservationList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, Model model, HttpSession session) {
		
			return "mypage/currentReservation";
		
	}
	
	/*//예약 디테일로 가기
	@RequestMapping(value = "/lastReservationDetail.action", method = RequestMethod.GET)
	public String lastReservationdetail(@RequestParam("roomno")int roomNo, String startdate, Model model, HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			AccountVO member = (AccountVO) session.getAttribute("login");
			int memberNo = member.getMemberNo();
			
			ReservationVO reservationdetail = lastReservationService.findRoomByRoomNo(roomNo,memberNo, startdate);
			if (reservationdetail == null) {
				return "redirect:last-reservation-list.action";
			}

			model.addAttribute("reservationdetail", reservationdetail);
			model.addAttribute("roomno", roomNo);

			return "mypage/last-reservation-detail";
		}
		
	}*/
	
	
	
}
