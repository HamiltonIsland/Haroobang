package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.LikedVO;
import com.haroobang.vo.RoomVO;
//커밋...
public interface RoomListService {

	List<RoomVO> findAllRooms();

	List<RoomVO> findAllDisapprovalRooms();

	void approvalRoom(String formdate);

	List<RoomVO> findAllRoomsByPage(int from, int to);

	int findRoomCount();

	List<RoomVO> searchRoomListService(RoomVO vo, int from, int to);

	void likedRoom(String memberno, String roomno);

	void unLikedRoom(String memberno, String roomno);

	List<LikedVO> findAllLikeds(int memberNo);

	List<RoomVO> findAllDisapprovalRoomsByPage(int from, int to);

	int findDisapprovalRoomsCount();

	int findSearchRoomCount(RoomVO vo);

	void deleteRoom(String roomno);

	void deleteapproval(String formdate);

}
