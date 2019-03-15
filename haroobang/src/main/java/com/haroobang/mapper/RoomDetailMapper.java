package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomDetailMapper {

	void addLike(HashMap<String, Object> params);

	RoomVO findRoomDetail(int roomNo);

	AccountVO findMemberId(int memberNo);

	List<RoomAttachVO> findRoomAttach(int roomNo);

	int addRoomReservaion(ReservationVO reservationVo);

	void addReservationDate(HashMap<String, Object> params);

	List<String> findDateList(int roomNo);

	List<Integer> findReservedDate(HashMap<String, Object> params);

	void roomDelete(int roomNo);

	List<CommentVO> findCommentList(int roomNo);

	float averageRate(int roomNo);

	void commentReport(HashMap<String, Object> params);

	void addReportCount(int commentNo);

	String findMemberSavedFileName(int memberNo);

	

}
