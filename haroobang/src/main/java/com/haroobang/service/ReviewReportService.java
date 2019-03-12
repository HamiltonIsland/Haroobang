package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.CommentVO;

public interface ReviewReportService {

	List<CommentVO> findAllReviewReports();

	int findAllReviewReportCount();

	

}
