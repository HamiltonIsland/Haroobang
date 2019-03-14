package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReportVO;
import com.haroobang.vo.RoomAttachVO;

public interface ReviewReportDao {

	List<ReportVO> selectAllReviewReports();

	int selectAllReviewReportCount();

	void restrictedReview(String formdate);

	void stayReview(String formdate);

}
