package com.haroobang.service;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomRegisterService {

	void roomRegisterService(RoomVO vo);

	void insertRoomAttachService(RoomAttachVO attach);

	RoomVO roomListService(int roomNo);

	void deleteRoomService(int roomNo);

}
