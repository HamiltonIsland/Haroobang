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
	public String commentRegisterForm(@RequestParam("reservationno")int reservationNo, @RequestParam("roomno")int roomNo, HttpSession session, HttpServletRequest req, Model model) {
		if (session.getAttribute("login") == null) {
			return "redirect:/login.action";
		}
		AccountVO member = (AccountVO) session.getAttribute("login");
		int memberNo = member.getMemberNo();
		
		model.addAttribute("reservationNo", reservationNo);
		model.addAttribute("roomNo", roomNo);
		model.addAttribute("memberNo", memberNo);
		return "mypage/commentRegister";
	}
	
	//후기등록 제출
	@RequestMapping(value = "/commentRegister.action", method = RequestMethod.POST)
	public String commentRegister(HttpSession session, HttpServletRequest req, CommentVO comment) {
		
		commentService.writeComment(comment);
		
		return "redirect:lastReservationList.action?memberno=" + comment.getMemberNo();
	}
	
	
	
}
