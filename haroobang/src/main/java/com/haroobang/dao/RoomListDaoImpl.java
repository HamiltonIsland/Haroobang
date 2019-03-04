package com.haroobang.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomListMapper;

@Repository("roomlistDao")
public class RoomListDaoImpl implements RoomListDao{
	
	/*private RoomListMapper roomListMapper;

	public void setRoomListMapper(RoomListMapper roomListMapper) {
		this.roomListMapper = roomListMapper;
	}*/
	@Autowired
	@Qualifier("roomListMapper")
	private RoomListMapper roomListMapper;
}
