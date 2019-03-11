package com.haroobang.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

	@RequestMapping(value = "roomDetail.action", method = RequestMethod.GET)
	public String roomDetail(Model model, int roomNo) {

		RoomVO room = roomDetailService.findRoomDetail(roomNo);

		int memberNo = room.getMemberNo();
		AccountVO member = roomDetailService.findMember(memberNo);

		model.addAttribute("room", room);
		model.addAttribute("member", member);

		return "room/roomDetail";
	}

	@RequestMapping(value = "addLike.action", method = RequestMethod.GET)
	@ResponseBody
	public String addLike(int roomNo, HttpSession session) {

		System.out.println(session.getAttribute("login"));
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			AccountVO member = (AccountVO) session.getAttribute("login");
			int memberNo = member.getMemberNo();
			String result = roomDetailService.addLike(roomNo, memberNo);

			return result;
		}
	}

	@RequestMapping(value = "checkDate.action", method = RequestMethod.GET)
	@ResponseBody
	public String checkDate(String checkinDate, int nights, Model model, HttpSession session,
			int roomNo) {

		if (session.getAttribute("login") == null) {
			return "redirect:/account/login.action";
		}
		
		List<LocalDate> dateList = new ArrayList();
		LocalDate startDate = LocalDate.parse(checkinDate);
		for(int i = 0;i<nights;i++) {
			dateList.add(startDate.plusDays(i));
		}
		
		String result = roomDetailService.findReservedDate(roomNo,dateList);
		
//		model.addAttribute("result",result);
//		model.addAttribute("roomNo", roomNo);
//		model.addAttribute("checkinDate", checkinDate);
//		model.addAttribute("nights", nights);

		return result;
	}
	
	@RequestMapping(value="reservationCheckout.action")
	public String reservationCheckout(String checkinDate, int nights, Model model, HttpSession session,
			int roomNo) {
		
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("checkinDate", checkinDate);
		model.addAttribute("nights", nights);
		
		return "room/roomReservationCheckout";
	}

	@RequestMapping(value = "calender.action", method = RequestMethod.GET)
	public String calender(int roomNo,Model model) {
		
		List<String> dateList = roomDetailService.findDateList(roomNo);
	
		model.addAttribute("dateList",dateList);
		
		return "room/calender";
	}

	@RequestMapping(value = "payment.action", method = RequestMethod.POST)
	public String payment(ReservationVO reservationVo, HttpSession session, Model model) {

		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();

		String StartDate = reservationVo.getStartDate();
		LocalDate startDate = LocalDate.parse(StartDate);
		List<LocalDate> dateList = new ArrayList();
		
		for(int i = 0;i<reservationVo.getNights()+1;i++) {
			dateList.add(startDate.plusDays(i));
		}

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		String endDate = formatter.format(dateList.get(reservationVo.getNights()));
	
		reservationVo.setEndDate(endDate);
		reservationVo.setMemberNo(memberNo);

		RoomVO room = roomDetailService.findRoomDetail(reservationVo.getRoomNo());
		String message =roomDetailService.addRoomReservation(reservationVo,dateList);
		
		if(message =="fail") {
			return "redirect:/account/login.action";
		}
		
		model.addAttribute("reservation", reservationVo);
		model.addAttribute("roomDetail", room);


		return "room/paymentConfirmation";
	}
}
