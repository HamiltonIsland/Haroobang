package com.haroobang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.RoomDetailService;

@Controller
@RequestMapping("/room/")
public class RoomDetailController {
	
	@Autowired
	@Qualifier("roomDetailService")
	private RoomDetailService roomDetailService;
	

	@RequestMapping(value="roomDetail.action", method=RequestMethod.GET)
	public String roomDetail() {
		return "room/roomDetail";
	}
	
	@RequestMapping(value="addLike.action",method=RequestMethod.GET)
	@ResponseBody
	public String addLike(int roomNo, int memberNo,HttpSession session) {
		
		if(session.getAttribute("login")==null) {
			return "redirect:/account/login.action";
		}
//		int memberNo = session.getAttribute("login");
		String result = roomDetailService.addLike(roomNo, memberNo);
		
		return result;
	}
}
