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
		if (session.getAttribute("login") == null ) {
			return "account/login";
		}
		int totalprice = statisticsService.getTotalPriceService();
		int totalcheckinprice = statisticsService.getTotalCheckinPriceService();		
		List<ReservationVO> monthCount = statisticsService.getMonthCountService(); 
		
		StatisticsVO list = statisticsService.getStatisticsService();
		
		model.addAttribute("StatisticsList",list);
		model.addAttribute("monthCount",monthCount);
		model.addAttribute("totalPrice",totalprice);
		model.addAttribute("totalCheckinPrice",totalcheckinprice);
		
		return "room/statistics";
	}
	
	
	
}
