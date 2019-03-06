package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface RoomDetailMapper {

	void addLike(HashMap<String, Object> params);

	RoomVO findRoomDetail(int roomNo);

	AccountVO findMemberId(int memberNo);

	List<RoomAttachVO> findRoomAttach(int roomNo);

	

}
