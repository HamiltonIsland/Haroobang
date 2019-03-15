package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface LikeListMapper {

	List<RoomVO> selectAllMyLiked(int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectLikedRoomList(HashMap<String, Object> params);

	int selectLikedRoomCount(int memberNo);

}
