package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.RoomDetailService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/room/")
public class RoomDetailController {
	
	@Autowired
	@Qualifier("roomDetailService")
	private RoomDetailService roomDetailService;
	

	@RequestMapping(value="roomDetail.action", method=RequestMethod.GET)
	public String roomDetail(Model model) {
		int roomNo = 36;
		RoomVO room = roomDetailService.findRoomDetail(roomNo);
		
		int memberNo = room.getMemberNo();
		AccountVO member = roomDetailService.findMember(memberNo);
		
		model.addAttribute("room",room);
		model.addAttribute("member", member);
		
		
		return "room/roomDetail";
	}
	
	@RequestMapping(value="addLike.action",method=RequestMethod.GET)
	@ResponseBody
	public String addLike(int roomNo,HttpSession session) {
		
		System.out.println(session.getAttribute("login"));
		if(session.getAttribute("login")==null) {
			return "/account/login.action";
		}else {
		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		String result = roomDetailService.addLike(roomNo, memberNo);
		
		return result;
		}
	}
	
	@RequestMapping(value = "reservationCheckout.action", method = RequestMethod.GET)
	public String roomReservationCheckout(String checkinDate, int nights,Model model,HttpSession session,int roomNo) {
	
		if(session.getAttribute("login") == null) {
			return "redirect:/account/login.action";
		}
		
		model.addAttribute("roomNo",roomNo);
		model.addAttribute("checkinDate",checkinDate);
		model.addAttribute("nights",nights);
		

		return "room/roomReservationCheckout";
	}
	
	@RequestMapping(value="calender.action", method=RequestMethod.GET)
	public String calender() {
		
		return "room/calender";
	}
	
	@RequestMapping(value="payment.action" , method=RequestMethod.POST)
	public String payment(ReservationVO reservationVo,HttpSession session, Model model) {
		
		
		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		
		String startDate = reservationVo.getStartDate();
		String yearMonth = startDate.substring(0,8);
		int calEndDate = Integer.parseInt(startDate.substring(9))+reservationVo.getNights();
		String endDate = yearMonth+ Integer.toString(calEndDate);
		reservationVo.setEndDate(endDate);
		reservationVo.setMemberNo(memberNo);
		
		RoomVO room = roomDetailService.findRoomDetail(reservationVo.getRoomNo());
		roomDetailService.addRoomReservation(reservationVo);
		
		model.addAttribute("reservation",reservationVo);
		model.addAttribute("roomDetail",room);
		
		
		return "room/paymentConfirmation";
	}
}
