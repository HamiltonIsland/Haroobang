package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.CommentVO;

public interface ReviewReportMapper {

	List<CommentVO> selectAllReviewReports();

	int selectAllReviewReportCount();

}
