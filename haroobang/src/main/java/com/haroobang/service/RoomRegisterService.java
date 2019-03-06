package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomRegisterService {

	void roomRegisterService(RoomVO vo);

	void insertRoomAttachService(RoomAttachVO attach);

}
