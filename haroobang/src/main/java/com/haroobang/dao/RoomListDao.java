package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomListDao {

	List<RoomVO> selectAllRooms();

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

}
