package com.haroobang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.RoomDetailService;
import com.haroobang.vo.AccountVO;

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
	public String addLike(int roomNo,HttpSession session) {
		
		System.out.println(session.getAttribute("login"));
		if(session.getAttribute("login")==null) {
			return "/account/login.action";
		}else {
		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		String result = roomDetailService.addLike(roomNo, memberNo);
		
		return result;
		}
	}
}
