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
import com.haroobang.ui.ThePager2;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;



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
			return "redirect:/account/login.action";
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
	
	//후기 리스트 페이지 보여주기
		@RequestMapping(value = "/commentList.action", method = RequestMethod.GET)
		public String lastReservationlist(@RequestParam("memberno")int memberNo,
				@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model, HttpSession session) {
			
			if (session.getAttribute("login") == null) {
				return "redirect:/account/login.action";
			} else {
				int pageSize = 4;	//한 페이지에 표시되는 데이터 개수
				int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
				int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
				int pagerSize = 2;	//한 번에 표시되는 페이지 번호 개수
				String linkUrl = "commentList.action"; //페이지 번호를 눌렀을 때 이동할 경로
				
				//List<CommentVO> mycomments = commentService.findMycomment(memberNo);
				List<CommentVO> mycomments = commentService.findMycommentByPage(memberNo,from,to);
				int commentCount = commentService.findcommentCount(memberNo);
				
				ThePager2 pager = new ThePager2(commentCount, pageNo, memberNo, pageSize, pagerSize, linkUrl);
				
				model.addAttribute("mycomments", mycomments);
				model.addAttribute("pager", pager);
				model.addAttribute("pageno", pageNo);
				
				return "mypage/commentList";
			}
			
		}
	
}
