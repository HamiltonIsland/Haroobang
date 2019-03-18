package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.StatisticsService;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.StatisticsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/room")
public class StatisticsController {
	
	@Autowired
	@Qualifier("StatisticsService")
	private StatisticsService statisticsService;
	
	//통계페이지 보여주기
	@RequestMapping(value = "/statistics.action", method = RequestMethod.GET)
	public String statisticsView(HttpSession session,Model model) {	
		AccountVO login = (AccountVO)session.getAttribute("login");
		if (login == null ) {
			return "account/login";
		}
				
		List<ReservationVO> monthCount = statisticsService.getMonthCountService(); 
		
		StatisticsVO list = statisticsService.getStatisticsService(login.getMemberNo());
		
		model.addAttribute("StatisticsList",list);
		model.addAttribute("monthCount",monthCount);
		
		return "room/statistics";
	}
	
	
	
}
