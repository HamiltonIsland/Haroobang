package com.haroobang.dao;

import com.haroobang.vo.RoomVO;

public interface RoomDetailDao {

	String addLike(int roomNo, int memberNo);

	RoomVO findRoomDetail(int roomNo);

	String findMemberId(int memberNo);

}
