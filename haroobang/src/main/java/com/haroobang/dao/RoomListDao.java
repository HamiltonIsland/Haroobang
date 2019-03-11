package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;
//커밋...
public interface RoomListDao {

	List<RoomVO> selectAllRooms();

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectAllDisapprovalRooms();

	void approvalRoom(String formdate);

}
