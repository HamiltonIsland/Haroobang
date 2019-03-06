package com.haroobang.service;

import com.haroobang.vo.RoomVO;

public interface RoomDetailService {

	String addLike(int roomNo, int memberNo);

	RoomVO findRoomDetail(int roomNo);

}
