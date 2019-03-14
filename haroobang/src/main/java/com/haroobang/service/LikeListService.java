package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.RoomVO;

public interface LikeListService {

	List<RoomVO> findMyLiked(int memberNo);

}
