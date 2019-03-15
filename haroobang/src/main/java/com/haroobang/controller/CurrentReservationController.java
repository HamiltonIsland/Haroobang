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
import com.haroobang.ui.ThePager2;
import com.haroobang.vo.ReservationVO;


@Controller
@RequestMapping("/mypage")
public class CurrentReservationController {
	@Autowired
	@Qualifier("CurrentReservationService")
	private CurrentReservationService currentReservationService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/currentReservationList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, @RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model, HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			
			int pageSize = 4;	//한 페이지에 표시되는 데이터 개수
			int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
			int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
			int pagerSize = 2;	//한 번에 표시되는 페이지 번호 개수
			String linkUrl = "currentReservationList.action"; //페이지 번호를 눌렀을 때 이동할 경로
			
			//List<ReservationVO> currents = currentReservationService.findMyCurrentReservation(memberNo);
			List<ReservationVO> currents = currentReservationService.findMyCurrentReservationByPage(memberNo, from, to);
			int currentsCount = currentReservationService.findMyCurrentCount(memberNo);
			
			ThePager2 pager = new ThePager2(currentsCount, pageNo, memberNo,pageSize, pagerSize, linkUrl);
			
			model.addAttribute("currents", currents);
			model.addAttribute("pager", pager);
			model.addAttribute("pageno", pageNo);
			
			return "mypage/currentReservation";
		}
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
