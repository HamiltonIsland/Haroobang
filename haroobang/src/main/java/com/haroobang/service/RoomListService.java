package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.RoomVO;

public interface RoomListService {

	List<RoomVO> findAllRooms();

	List<RoomVO> findAllDisapprovalRooms();

	void approvalRoom(String formdate);

}
