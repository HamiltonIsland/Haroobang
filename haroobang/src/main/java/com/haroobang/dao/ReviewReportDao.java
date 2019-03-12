package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.CommentVO;

public interface ReviewReportDao {

	List<CommentVO> selectAllReviewReports();

	int selectAllReviewReportCount();
}
