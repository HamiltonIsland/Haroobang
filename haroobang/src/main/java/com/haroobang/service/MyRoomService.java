package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface MyRoomService {

	ReservationVO findReservationByRoomNo(int roomNo);

	List<RoomVO> findWaitingListByPage(int memberNo, int from, int to);

	int findWaitingCount(int memberNo);

	void deleteMyRoom(String roomNo);

	List<ReservationVO> findAllMyReservations(int memberNo);

	String checkinApproval(int reservationNo);

	String calcelCheckin(int reservationNo);

}
