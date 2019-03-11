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

import com.haroobang.service.LastReservationService;
import com.haroobang.service.RoomRegisterService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;


@Controller
@RequestMapping("/mypage")
public class CommentController {
	@Autowired
	@Qualifier("lastReservationService")
	private LastReservationService lastReservationService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/lastReservationList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, Model model) {
		
		List<ReservationVO> myrooms = lastReservationService.findMyLastReservation(memberNo);
		
		model.addAttribute("myrooms", myrooms);
		
		return "mypage/last-reservation-list";
	}
	
	//예약 디테일로 가기
	@RequestMapping(value = "/lastReservationDetail.action", method = RequestMethod.GET)
	public String lastReservationdetail(@RequestParam("roomno")int roomNo, Model model) {
		ReservationVO reservationdetail = lastReservationService.findRoomByRoomNo(roomNo);
		if (reservationdetail == null) {
			return "redirect:last-reservation-list.action";
		}

		model.addAttribute("reservationdetail", reservationdetail);
		model.addAttribute("roomno", roomNo);

		return "mypage/last-reservation-detail";
	}
	
	
	
}
