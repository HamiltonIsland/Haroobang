package com.haroobang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String loginView(AccountVO vo, HttpSession session) {	
		
		return "message/messageRoom";
	}
	
}