package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

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

	List<RoomVO> searchRoomList(RoomVO vo);
}
