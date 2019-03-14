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

import com.haroobang.service.MyRoomService;
import com.haroobang.vo.ReservationVO;

@Controller
@RequestMapping("/mypage")
public class MyRoomController {

	@Autowired
	@Qualifier("myRoomService")
	private MyRoomService myRoomService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/myRoomReservation.action", method = RequestMethod.GET)
	public String myRoomReservation(@RequestParam("memberno")int memberNo, Model model, HttpSession session) {
		
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			List<ReservationVO> myrooms = myRoomService.findMyRoomReservation(memberNo);
			
			model.addAttribute("myrooms", myrooms);
			
			return "mypage/myRoomReservation";
		}
		
	}
	
}
