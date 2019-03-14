package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReportVO;

public interface ReviewReportService {

	List<ReportVO> findAllReviewReports();

	int findAllReviewReportCount();

	void restrictedReview(String formdate);

	void stayReview(String formdate);

	

}
