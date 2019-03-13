package com.haroobang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haroobang.dao.ReviewReportDao;
import com.haroobang.vo.ReportVO;

@Service("ReviewReportService")
public class ReviewReportServiceImpl implements ReviewReportService{
	
	private ReviewReportDao reviewReportDao;

	public void setReviewReportDao(ReviewReportDao reviewReportDao) {
		this.reviewReportDao = reviewReportDao;
	}

	@Override
	public List<ReportVO> findAllReviewReports() {
		List<ReportVO> reports = reviewReportDao.selectAllReviewReports();
		
		return reports;
	}

	@Override
	public int findAllReviewReportCount() {
		int reportCount = reviewReportDao.selectAllReviewReportCount();
		
		return reportCount;
	}

	

}
