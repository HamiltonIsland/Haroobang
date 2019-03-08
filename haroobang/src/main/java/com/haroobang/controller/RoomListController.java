package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.RoomListService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/room")
public class RoomListController {
	
	@Autowired
	@Qualifier("RoomListService")
	private RoomListService roomListService;
	
	@RequestMapping(value="/roomList.action", method=RequestMethod.GET)
	public String roomList(Model model) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		//account = (AccountVO)session.getAttribute("login");
		List<RoomVO> rooms = roomListService.findAllRooms();
		List<RoomVO> disapproval = roomListService.findAllDisapprovalRooms();
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("disapproval", disapproval);
		
		return "room/roomList";
	}
	
	@RequestMapping(value="/roomApproval.action", method=RequestMethod.POST)
	public String roomApproval(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		roomListService.approvalRoom(formdate);
		
		return "success";
	}
}
