package com.haroobang.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.haroobang.dao.ReviewReportDao;
import com.haroobang.vo.CommentVO;

@Service("ReviewReportService")
public class ReviewReportServiceImpl implements ReviewReportService{
	
	private ReviewReportDao reviewReportDao;

	public void setReviewReportDao(ReviewReportDao reviewReportDao) {
		this.reviewReportDao = reviewReportDao;
	}

	@Override
	public List<CommentVO> findAllReviewReports() {
		List<CommentVO> reports = reviewReportDao.selectAllReviewReports();
		
		return reports;
	}

	@Override
	public int findAllReviewReportCount() {
		int reportCount = reviewReportDao.selectAllReviewReportCount();
		
		return reportCount;
	}

	

}
