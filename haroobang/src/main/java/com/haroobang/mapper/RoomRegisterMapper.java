package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomRegisterMapper {

	void roomRegister(RoomVO vo);

	void roomAttach(RoomAttachVO attach);

	RoomVO roomList(int roomNo);

	List<RoomAttachVO> roomAttachList(int roomNo);


}
