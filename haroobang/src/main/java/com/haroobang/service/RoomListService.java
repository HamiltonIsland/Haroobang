package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.RoomVO;
//커밋...
public interface RoomListService {

	List<RoomVO> findAllRooms();

	List<RoomVO> findAllDisapprovalRooms();

	void approvalRoom(String formdate);

	List<RoomVO> findAllRoomsByPage(int from, int to);

	int findRoomCount();

	List<RoomVO> searchRoomListService(RoomVO vo);

	void likedRoom(String memberno, String roomno);

}
