package com.haroobang.mapper;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomRegisterMapper {

	void roomRegister(RoomVO vo);

	void roomAttach(RoomAttachVO attach);


}
