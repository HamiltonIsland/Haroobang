package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.ReviewReportMapper;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReportVO;

public class OracleReviewReportDao implements ReviewReportDao {

	private ReviewReportMapper reviewReportMapper;
	
	public void setReviewReportMapper(ReviewReportMapper reviewReportMapper) {
		this.reviewReportMapper = reviewReportMapper;
	}

	@Override
	public List<ReportVO> selectAllReviewReports() {
		List<ReportVO> reports = reviewReportMapper.selectAllReviewReports();
		for(int i =0;i<reports.size();i++) {
			CommentVO commentVo = reviewReportMapper.findCommentVo(reports.get(i).getCommentNo());
			reports.get(i).setCommentVO(commentVo);
		}
		return reports;
	}

	@Override
	public int selectAllReviewReportCount() {
		int reportCount = reviewReportMapper.selectAllReviewReportCount();
		return reportCount;
	}





	



}
