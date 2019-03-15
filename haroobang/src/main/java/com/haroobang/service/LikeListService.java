package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.RoomVO;

public interface LikeListService {

	List<RoomVO> findMyLiked(int memberNo);

	int findLikedCount(int memberNo);

	List<RoomVO> findMyLikedByPage(int memberNo, int from, int to);

}
