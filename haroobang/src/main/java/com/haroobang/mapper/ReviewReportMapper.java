package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReportVO;

public interface ReviewReportMapper {

	List<ReportVO> selectAllReviewReports();

	int selectAllReviewReportCount();

	CommentVO findCommentVo(int commentNo);

}
