package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.LikeListMapper;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("LikeListDao")
public class LikeListDaoImpl implements LikeListDao{
	@Autowired
	@Qualifier("LikeListMapper")
	private LikeListMapper likeListMapper;

	@Override
	public List<RoomVO> selectAllMyLiked(int memberNo) {
		List<RoomVO> likeLists = likeListMapper.selectAllMyLiked(memberNo);
		return likeLists;
	}

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = likeListMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}
}
