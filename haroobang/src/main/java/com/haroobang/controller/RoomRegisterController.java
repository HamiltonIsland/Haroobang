package com.haroobang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.RoomRegisterService;
import com.haroobang.vo.RoomVO;


@Controller
@RequestMapping("/room")
public class RoomRegisterController {
	@Autowired
	@Qualifier("RoomRegisterService")
	private RoomRegisterService roomRegisterService;
	
	//숙소등록 페이지 보여주기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.GET)
	public String roomRegisterView() {	
		return "room/roomRegister";
	}	
	
	//숙소 등록하기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	public String roomRegisterInsert(RoomVO vo) {
		roomRegisterService.roomRegisterService(vo);
		return "home";
	}
	
	
	
}
