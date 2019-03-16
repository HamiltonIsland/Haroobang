package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface CurrentReservationDao {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectAllCurrentReservations(int memberNo);

	int selectCurrentCount(int memberNo);

	List<ReservationVO> selectCurrentRoomByPage(int memberNo, int from, int to);

	void refundCheck(int refundNum);

	RoomVO selectRoomFinish(int roomNo);

	ReservationVO selectReservation(int reservationNo);

	RoomAttachVO selectRoomAttach(int roomNo);
}
