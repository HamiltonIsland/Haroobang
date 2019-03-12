package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.ReviewReportMapper;
import com.haroobang.vo.CommentVO;

public class OracleReviewReportDao implements ReviewReportDao {

	private ReviewReportMapper reviewReportMapper;
	
	public void setReviewReportMapper(ReviewReportMapper reviewReportMapper) {
		this.reviewReportMapper = reviewReportMapper;
	}

	@Override
	public List<CommentVO> selectAllReviewReports() {
		List<CommentVO> reports = reviewReportMapper.selectAllReviewReports();
		return reports;
	}

	@Override
	public int selectAllReviewReportCount() {
		int reportCount = reviewReportMapper.selectAllReviewReportCount();
		return reportCount;
	}





	



}
