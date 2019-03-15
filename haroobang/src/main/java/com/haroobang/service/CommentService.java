package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface CommentService {

	void writeComment(CommentVO comment);

	//List<CommentVO> findMycomment(int memberNo);

	List<CommentVO> findMycommentByPage(int memberNo, int from, int to);

	int findcommentCount(int memberNo);

}
