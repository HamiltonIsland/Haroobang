package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomListDao;

@Service("roomListService")
public class RoomListServiceImpl implements RoomListService{
	/*private RoomListDao roomListDao;

	public void setRoomListDao(RoomListDao roomListDao) {
		this.roomListDao = roomListDao;
	}*/
	@Autowired
	@Qualifier("roomListDao")
	private RoomListDao roomListDao;
}
