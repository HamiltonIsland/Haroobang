package com.haroobang.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
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
	public String roomDetail(Model model, int roomNo,HttpSession session) {

		String result ="";
		RoomVO room = roomDetailService.findRoomDetail(roomNo);
		
		if(session.getAttribute("login")!= null) {
			AccountVO member = (AccountVO) session.getAttribute("login");
			int memberNo = member.getMemberNo();
			result = roomDetailService.findMyLike(roomNo, memberNo);
		}

		int memberNo = room.getMemberNo();
		AccountVO member = roomDetailService.findMember(memberNo);

		model.addAttribute("like", result);
		model.addAttribute("room", room);
		model.addAttribute("member", member);

		return "room/roomDetail";
	}

	@RequestMapping(value = "addLike.action", method = RequestMethod.GET)
	@ResponseBody
	public String addLike(int roomNo, HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			AccountVO member = (AccountVO) session.getAttribute("login");
			int memberNo = member.getMemberNo();
			String result = roomDetailService.addLike(roomNo, memberNo);

			return result;
		}
	}
	
	@RequestMapping(value = "deleteLike.action", method = RequestMethod.GET)
	@ResponseBody
	public String deleteLike(int roomNo, HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			AccountVO member = (AccountVO) session.getAttribute("login");
			int memberNo = member.getMemberNo();
			String result = roomDetailService.deleteLike(roomNo, memberNo);

			return result;
		}
	}
	
	@RequestMapping(value="roomDelete.action", method=RequestMethod.GET)
	public String roomDelete(int roomNo) {
		
		roomDetailService.roomDelete(roomNo);
		return "redirect:roomList.action";
	}

	@RequestMapping(value = "checkDate.action", method = RequestMethod.GET)
	@ResponseBody
	public String checkDate(String checkinDate, String endDate, Model model, HttpSession session,
			int roomNo){

		if (session.getAttribute("login") == null) {
			return "redirect:/account/login.action";
		}
		
		String result2 = roomDetailService.findIdenticalDate(checkinDate,endDate);
		if(result2 == "exist") {
			return "exist";
		}else {
			LocalDate now = LocalDate.now();
			LocalDate startDate = LocalDate.parse(checkinDate);
			if(startDate .isBefore(now)) {
				return "fail";
			}else {
			String result = roomDetailService.findReservedDate(roomNo,checkinDate,endDate);
			
			model.addAttribute("roomNo",roomNo);

			return result;
			}
		}
		
	
	}

	@RequestMapping(value="reservationCheckout.action")
	public String reservationCheckout(String checkinDate,String endDate, Model model, HttpSession session,
			int roomNo) {
		
		LocalDate startDate = LocalDate.parse(checkinDate);
		LocalDate endDate1 = LocalDate.parse(endDate);
		LocalDate endDate2 = endDate1.minusDays(1);
		
		Period period = Period.between(startDate, endDate2);
		int nights = period.getDays();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		endDate = endDate2.format(formatter);
		
		RoomVO roomDetail = roomDetailService.findRoomDetail(roomNo);
		
		model.addAttribute("roomDetail", roomDetail);
		model.addAttribute("checkinDate", checkinDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("nights", nights);
		
		return "room/roomReservationCheckout";
	}

	@RequestMapping(value = "calender.action", method = RequestMethod.GET)
	public String calender(int roomNo,Model model) {
		
		List<String> dateList = roomDetailService.findDateList(roomNo);
	
		model.addAttribute("dateList",dateList);
		model.addAttribute("roomNo",roomNo);
		
		return "room/calender";
	}
	
	@RequestMapping(value = "calender2.action", method = RequestMethod.GET)
	public String calender2(int roomNo,Model model) {
		
		List<String> dateList = roomDetailService.findDateList(roomNo);
	
		model.addAttribute("dateList",dateList);
		model.addAttribute("roomNo",roomNo);
		
		return "room/calender2";
	}

	@RequestMapping(value = "payment.action", method = RequestMethod.POST)
	public String payment(ReservationVO reservationVo, HttpSession session, Model model) {

		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		
		if(reservationVo.getRequest()== null) {
			reservationVo.setRequest("요청사항없음");
		}
		
		reservationVo.setTotalPrice(reservationVo.getBeforePrice()-reservationVo.getUsedPoint());
		LocalDate startDate = LocalDate.parse(reservationVo.getStartDate());

		List<LocalDate> dateList = new ArrayList();
		
		for(int i = 0;i<reservationVo.getNights()-1;i++) {
			dateList.add(startDate.plusDays(i+1));
		}

		reservationVo.setMemberNo(memberNo);
		int memberNo2 = reservationVo.getMemberNo();
		AccountVO member2 = roomDetailService.findMember(memberNo2);

		RoomVO room = roomDetailService.findRoomDetail(reservationVo.getRoomNo());
		String message =roomDetailService.addRoomReservation(reservationVo,dateList,reservationVo.getStartDate(), reservationVo.getEndDate());
		
		if(message =="fail") {
			return "redirect:/account/login.action";
		}
		int finalPoint = member.getPoint()-reservationVo.getUsedPoint()+(int)(reservationVo.getTotalPrice()*0.03);
		member.setPoint(finalPoint);
		roomDetailService.updateFinalPoint(memberNo,finalPoint);
		
		model.addAttribute("member", member2);
		model.addAttribute("reservation", reservationVo);
		model.addAttribute("roomDetail", room);


		return "room/paymentConfirmation";
	}
	
	@RequestMapping(value="commentReport", method=RequestMethod.GET)
	@ResponseBody
	public String commentReport(HttpSession session, int commentNo, String content) {
		
		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		String result =roomDetailService.commentReport(commentNo, content, memberNo);
		if(result =="fail") {
			return "fail";
		}else {
		return "success";
		}
	}
}
