package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface MyRoomDao {

	//List<ReservationVO> selectAllMyRoomReservation(int memberNo);

	//List<Integer> selectAllMyRoomNo(int memberNo);

	List<RoomVO> selectAllMyRooms(int memberNo);

	List<RoomAttachVO> selectAllMyRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectReservationByRoomNo(int roomNo, int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectWaitingListByPage(int memberNo, int from, int to);

	int selectWaitingCount(int memberNo);

	void deleteMyRoom(String roomNo);




}
