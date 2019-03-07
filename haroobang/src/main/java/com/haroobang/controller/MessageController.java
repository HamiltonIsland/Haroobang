package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.MessageService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.MessageRoomVO;
import com.haroobang.vo.MessagesVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	@Qualifier("MessageService")
	private MessageService messageService;
	
	//messageRoom창 보여주기
	@RequestMapping (value = "/messageRoom.action", method = RequestMethod.GET)
	public String messageRoomView(HttpSession session,int memberNo, Model model) {
		if(session.getAttribute("login")==null)
		{
			return "redirect:/account/login.action";
		}
		List<MessageRoomVO> list =  messageService.getMessageRoomListService(memberNo);
		model.addAttribute("messageRoomList",list);
		model.addAttribute("memberNo",memberNo);
		return "message/messageRoom";
	}	
	
	//messageRoomBoxs창 보여주기
	@RequestMapping (value = "/messageRoomBoxes.action", method = RequestMethod.GET)
	public String messageRoomBoxsView(int messageRoomNo,int memberNo,Model model,String name, String picture) {
		List<MessagesVO> list = messageService.getMessageListService(messageRoomNo);
		List<MessageRoomVO> lists =  messageService.getMessageRoomListService(memberNo);
		model.addAttribute("messageRoomList",lists);
		model.addAttribute("messageList",list);
		model.addAttribute("name",name);
		model.addAttribute("picture",picture);
		model.addAttribute("messageRoomNo",messageRoomNo);
	
		return "message/messageRoomBoxes";
	}	
		
	//message insert
	@RequestMapping (value = "/writeMessage.action", method = RequestMethod.POST)
	@ResponseBody
	public String writeMessage(MessagesVO vo, Model model) {
		
		
		messageService.insertMessagesService(vo);
		return "success";
	}	
		
	/*//messageload하기
	@RequestMapping (value = "/messageRoomBox.action")
	public String messageLoad(int roomNo,Model model,String name, String picture) {
		List<MessagesVO> list = messageService.getMessageListService(roomNo);
		model.addAttribute("messageList",list);
		model.addAttribute("name",name);
		model.addAttribute("picture",picture);
		model.addAttribute("messageRoomNo",roomNo);
		
		return "message/messageRoomBox";
	}*/
	
	
	
	
}