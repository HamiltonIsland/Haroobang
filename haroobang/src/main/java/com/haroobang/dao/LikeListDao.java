package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface LikeListDao {

	List<RoomVO> selectAllMyLiked(int memberNo);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectAllRoomByPage(int memberNo, int from, int to);

	int selectLikedCount(int memberNo);

}
