package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroobang.service.CommentService;



@Controller
@RequestMapping("/mypage")
public class CommentController {
	@Autowired
	@Qualifier("commentService")
	private CommentService commentService;
	
	//이전 예약 리스트 페이지 보여주기
	@RequestMapping(value = "/commentRegister.action", method = RequestMethod.GET)
	public String commentRegisterForm(HttpSession session, HttpServletRequest req) {
		
		
		return "mypage/commentRegister";
	}
	
	
	
	
}
