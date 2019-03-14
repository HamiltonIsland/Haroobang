package com.haroobang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.ReviewReportService;
import com.haroobang.vo.ReportVO;

@Controller
@RequestMapping("/room")
public class ReviewReportController {

	@Autowired	
	@Qualifier("reviewReportService")
	private ReviewReportService reviewReportService;
	
	@RequestMapping(value="/reviewReport.action", method=RequestMethod.GET)
	public String reviewReportForm(Model model) {
		
		List<ReportVO> reports = reviewReportService.findAllReviewReports();
		int reportCount = reviewReportService.findAllReviewReportCount();
		
		model.addAttribute("reports", reports);
		model.addAttribute("reportcountno", reportCount);
		
				
		return "room/reviewReport";
	}
	
	@RequestMapping(value="/reviewRestricted.action", method=RequestMethod.POST)
	@ResponseBody
	public String reviewRestricted(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		reviewReportService.restrictedReview(formdate);
		
		return "success";
	}
	
	@RequestMapping(value="/reviewStay.action", method=RequestMethod.POST)
	@ResponseBody
	public String reviewStay(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		reviewReportService.stayReview(formdate);
		
		return "success";
	}
	
}
