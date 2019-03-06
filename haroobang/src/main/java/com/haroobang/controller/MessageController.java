package com.haroobang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.MessageService;
import com.haroobang.vo.AccountVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	@Qualifier("MessageService")
	private MessageService messageService;
	
	//messageRoom창 보여주기
	@RequestMapping (value = "/messageRoom.action", method = RequestMethod.GET)
	public String messageRoomView(HttpSession session) {
		if(session.getAttribute("login")==null)
		{
			return "redirect:/account/login.action";
		}
		
		return "message/messageRoom";
	}
	
	//messageRoom창 보여주기
	@RequestMapping (value = "/writeMessage.action", method = RequestMethod.POST)
	@ResponseBody
	public String writeMessage(HttpSession session) {			
		
		return "messageLoad.action";
	}	
	
	//messageload하기
	@RequestMapping (value = "/messageLoad.action", method = RequestMethod.GET)
	public String messageLoad(HttpSession session) {
		
		
		return "message/messageRoomBox";
	}
	
	
	
}