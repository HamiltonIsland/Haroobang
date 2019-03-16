package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface MyRoomService {

	//List<ReservationVO> findMyRoomReservation(int memberNo);

	//List<Integer> findMyRoomNo(int memberNo);

	List<RoomVO> findAllMyRooms(int memberNo);

	List<ReservationVO> findReservationByRoomNo(int roomNo, int memberNo);

	List<RoomVO> findWaitingListByPage(int memberNo, int from, int to);

	int findWaitingCount(int memberNo);

	void deleteMyRoom(String roomNo);

}
