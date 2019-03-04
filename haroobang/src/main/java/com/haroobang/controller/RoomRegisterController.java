package com.haroobang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.vo.roomVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/room")
public class RoomRegisterController {
	
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.GET)
	public String roomRegisterView(HttpSession session) {	
		if(session.getAttribute("login") == null) {
			return "account/login";
		}
		
		return "room/roomRegister";
	}
	
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	public String roomRegisterInsert(roomVO vo, HttpSession session) {
		if(session.getAttribute("login") == null) {
			return "account/login";
		}
		
		
		return "home";
	}
	
	
	
}
