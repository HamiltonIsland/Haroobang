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
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.CommentVO;



@Controller
@RequestMapping("/mypage")
public class CommentController {
	@Autowired
	@Qualifier("commentService")
	private CommentService commentService;
	
	//후기등록 페이지 보여주기
	@RequestMapping(value = "/commentRegister.action", method = RequestMethod.GET)
	public String commentRegisterForm(HttpSession session, HttpServletRequest req) {
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		}
		
		return "mypage/commentRegister";
	}
	
	//후기등록 제출
	@RequestMapping(value = "/commentRegister.action", method = RequestMethod.POST)
	public String commentRegister(HttpSession session, HttpServletRequest req, CommentVO comment, Model model) {
		
		commentService.writeComment(comment);
		
		model.addAttribute("comment", comment);
		
		return "redirect:/haroobang/home.action";
	}
	
	
	
}
