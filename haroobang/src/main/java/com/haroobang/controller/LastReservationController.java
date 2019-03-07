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
import com.haroobang.vo.RoomVO;


@Controller
@RequestMapping("/last-reservation")
public class LastReservationController {
	@Autowired
	@Qualifier("lastReservationService")
	private LastReservationService lastReservationService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/lastReservationList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, Model model) {
		
		List<RoomVO> myrooms = lastReservationService.findMyLastReservation(memberNo);
		
		model.addAttribute("myrooms", myrooms);
		
		return "mypage/last-reservation-list";
	}
	
	/*//숙소 등록하기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	public String roomRegisterInsert(RoomVO vo,HttpSession session) {
		if(session.getAttribute("login")==null) {
			return "redirect:/account/login.action";
		}
		roomRegisterService.roomRegisterService(vo);
		return "redirect:/home.action";
	}*/
	
	
	
}
