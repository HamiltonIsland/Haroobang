package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroobang.service.LikeListService;
import com.haroobang.ui.ThePager;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/mypage")
public class LikeController {
	@Autowired
	@Qualifier("LikeListService")
	private LikeListService likeListService;
	
	@RequestMapping(value = "/likeList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, 
			@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model, HttpSession session) {
		
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			
			int pageSize = 4;	//한 페이지에 표시되는 데이터 개수
			int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
			int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
			int pagerSize = 2;	//한 번에 표시되는 페이지 번호 개수
			String linkUrl = "roomList.action"; //페이지 번호를 눌렀을 때 이동할 경로
			
			//List<RoomVO> likeLists = likeListService.findMyLiked(memberNo);
			List<RoomVO> likeLists = likeListService.findMyLikedByPage(memberNo, from, to);
			int likeCount = likeListService.findLikedCount(memberNo);
			
			ThePager pager = new ThePager(likeCount, pageNo, pageSize, pagerSize, linkUrl);
			
			model.addAttribute("likeLists", likeLists);
			model.addAttribute("pager", pager);
			model.addAttribute("pageno", pageNo);
			
			return "mypage/likeList";
		}
	}
}
