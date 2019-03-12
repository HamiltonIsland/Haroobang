package com.haroobang.dao;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomRegisterDao {

	void roomRegisterDao(RoomVO vo);

	void insertRoomAttachDao(RoomAttachVO attach);

	RoomVO roomListDao(int roomNo);

	void deleteRoomDao(int roomNo);
}
