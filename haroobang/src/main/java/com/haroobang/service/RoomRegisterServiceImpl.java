package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomRegisterDao;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("RoomRegisterService")
public class RoomRegisterServiceImpl implements RoomRegisterService{
	
	@Autowired
	@Qualifier("RoomRegisterDao")
	private RoomRegisterDao roomRegisterDao;

	@Override
	public void roomRegisterService(RoomVO vo) {
		roomRegisterDao.roomRegisterDao(vo);	
	}	

	@Override
	public void insertRoomAttachService(RoomAttachVO attach) {
		roomRegisterDao.insertRoomAttachDao(attach);
		
	}

	@Override
	public RoomVO roomListService(int roomNo) {
		RoomVO list = roomRegisterDao.roomListDao(roomNo);
		return list;
	}

	@Override
	public void deleteRoomService(int roomNo) {
		roomRegisterDao.deleteRoomDao(roomNo);
		
	}


	
	

}
