package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.LikedVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;
//커밋...
public interface RoomListDao {

	List<RoomVO> selectAllRooms();

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectAllDisapprovalRooms();

	void approvalRoom(String formdate);

	List<RoomVO> selectAllRoomByPage(int from, int to);

	int selectRoomCount();

	List<RoomVO> searchRoomListDao(RoomVO vo);

	void likedRoom(String memberno, String roomno);

	void unLikedRoom(String memberno, String roomno);

	List<LikedVO> selectAllLiked(int memberNo);

	List<RoomVO> selectAllDisapprovalRoomByPage(int from, int to);

	int selectDisapprovalRoomCount();

}
