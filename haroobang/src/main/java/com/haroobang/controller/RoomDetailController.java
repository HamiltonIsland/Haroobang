package com.haroobang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/room/")
public class RoomDetailController {

	@RequestMapping(value="roomDetail.action", method=RequestMethod.GET)
	public String roomDetail() {
		return "room/roomDetail";
	}
	
}
