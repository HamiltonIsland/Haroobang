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
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/mypage")
public class MyRoomController {

	@Autowired
	@Qualifier("myRoomService")
	private MyRoomService myRoomService;

	// 이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/myRoomReservation.action", method = RequestMethod.GET)
	public String myRoomReservation(@RequestParam("memberno") int memberNo, Model model, HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			// List<Integer> myroomNo = myRoomService.findMyRoomNo(memberNo);
			// List<ReservationVO> myrooms = myRoomService.findMyRoomReservation(myroomNo);
			List<RoomVO> myrooms = myRoomService.findAllMyRooms(memberNo);

			// model.addAttribute("myroomNo", myroomNo);
			// model.addAttribute("myrooms", myrooms);
			model.addAttribute("myrooms", myrooms);
		

			return "mypage/myRoomReservation";
		}

	}

	@RequestMapping(value = "/myRoomReservationDetail.action", method = RequestMethod.GET)
	public String myRoomReservationDetail(@RequestParam("roomno") int roomNo, Model model, HttpSession session) {

		if (session.getAttribute("login") == null) {
			return "redirect:/account/login.action";
		} else {
			
			AccountVO member = (AccountVO)session.getAttribute("login");
			int memberNo = member.getMemberNo();

			List<ReservationVO> reservationdetail = myRoomService.findReservationByRoomNo(roomNo, memberNo);
			if (reservationdetail == null) {
				return "redirect:myRoomReservationDetail.action";
			}

			model.addAttribute("reservationdetail", reservationdetail);
			model.addAttribute("roomno", roomNo);

			return "mypage/myRoomReservationDetail";
		}
	}
}
