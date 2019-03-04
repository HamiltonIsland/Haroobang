package com.haroobang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.AccountService;
import com.haroobang.service.RoomListService;

@Controller
@RequestMapping("/room")
public class RoomListController {
	@Autowired
	@Qualifier("roomListService")
	private RoomListService roomListService;
	
	// login창 보여주기
	@RequestMapping(value = "/roomList.action", method = RequestMethod.GET)
	public String roomList() {
		return "room/roomlist";
	}
}
