package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomListMapper {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectAllRooms();

	List<RoomVO> selectAllDisapprovalRooms();

	void approvalRoom(int formdate);
}
