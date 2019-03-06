package com.haroobang.mapper;

import java.util.HashMap;

import com.haroobang.vo.RoomVO;

public interface RoomDetailMapper {

	void addLike(HashMap<String, Object> params);

	RoomVO findRoomDetail(int roomNo);

	String findMemberId(int memberNo);

	

}
