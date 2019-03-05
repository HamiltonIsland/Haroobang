package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.RoomRegisterService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomVO;


@Controller
@RequestMapping("/room")
public class RoomRegisterController {
	@Autowired
	@Qualifier("RoomRegisterService")
	private RoomRegisterService roomRegisterService;
	
	//숙소등록 페이지 보여주기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.GET)
	public String roomRegisterView(HttpSession session) {
		if(session.getAttribute("login") == null) {
			return "account/login"; 
		}
		return "room/roomRegister";
	}	
	
	//숙소 등록하기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	public String roomRegisterInsert(RoomVO vo,HttpSession session) {
		if(session.getAttribute("login")==null) {
			return "redirect:/account/login.action";
		}
		roomRegisterService.roomRegisterService(vo);
		return "redirect:/home.action";
	}
	
	
	
}
