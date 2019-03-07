package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomListDao;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("RoomListService")
public class RoomListServiceImpl implements RoomListService{
	
	@Autowired
	@Qualifier("RoomListDao")
	private RoomListDao roomlistDao;

	@Override
	public List<RoomVO> findAllRooms() {
		List<RoomVO> rooms = roomlistDao.selectAllRooms();
		
		for(RoomVO room : rooms) {
			List<RoomAttachVO> attachments = roomlistDao.selectRoomAttachByRoomNo(room.getRoomNo());
			room.setRoomAttachList(attachments);
		}
		
		return rooms;
	}

}
