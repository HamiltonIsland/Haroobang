package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReportVO;
import com.haroobang.vo.RoomAttachVO;

public interface ReviewReportMapper {

	List<ReportVO> selectAllReviewReports();

	int selectAllReviewReportCount();

	CommentVO findCommentVo(int commentNo);


	String selectAllReviewPhotos(int commentNo);

}
