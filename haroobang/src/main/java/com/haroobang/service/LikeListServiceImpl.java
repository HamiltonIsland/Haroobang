package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.LikeListDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("LikeListService")
public class LikeListServiceImpl implements LikeListService{
	@Autowired
	@Qualifier("LikeListDao")
	private LikeListDao likeListDao;

	@Override
	public List<RoomVO> findMyLiked(int memberNo) {
		List<RoomVO> likeLists = likeListDao.selectAllMyLiked(memberNo);
		for(RoomVO likeList : likeLists) {
			List<RoomAttachVO> attachments = likeListDao.selectRoomAttachByRoomNo(likeList.getRoomNo());
			likeList.setRoomAttachList(attachments);
		}
		return likeLists;
	}
}
