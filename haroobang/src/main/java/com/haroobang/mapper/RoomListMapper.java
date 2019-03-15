package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.LikedVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;
//커밋...
public interface RoomListMapper {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectAllRooms();

	List<RoomVO> selectAllDisapprovalRooms();

	void approvalRoom(int formdate);

	int selectRoomCount();

	List<RoomVO> selectRoomList(HashMap<String, Object> params);

	List<RoomVO> searchRoomList(HashMap<String, Object> params);

	void likedRoom(HashMap<String, Object> params);

	void unLikedRoom(HashMap<String, Object> params);

	List<LikedVO> selectAllLiked(int memberNo);

	List<RoomVO> selectDisapprovalRoomList(HashMap<String, Object> params);

	int selectDisapprovalRoomCount();

	int selectSearchRoomCount(RoomVO vo);


}
