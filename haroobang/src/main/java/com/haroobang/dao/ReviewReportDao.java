package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReportVO;

public interface ReviewReportDao {

	List<ReportVO> selectAllReviewReports();

	int selectAllReviewReportCount();
}
