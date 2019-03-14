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
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/mypage")
public class LikeController {
	@Autowired
	@Qualifier("LikeListService")
	private LikeListService likeListService;
	
	@RequestMapping(value = "/likeList.action", method = RequestMethod.GET)
	public String lastReservationlist(@RequestParam("memberno")int memberNo, Model model, HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "/account/login.action";
		} else {
			List<RoomVO> likeLists = likeListService.findMyLiked(memberNo);
			
			model.addAttribute("likeLists", likeLists);
			
			return "mypage/likeList";
		}
	}
}
