package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomListMapper;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("RoomListDao")
public class RoomListDaoImpl implements RoomListDao{
	
	@Autowired
	@Qualifier("RoomListMapper")
	private RoomListMapper roomListMapper;

	@Override
	public List<RoomVO> selectAllRooms() {
		List<RoomVO> rooms = roomListMapper.selectAllRooms();
		return rooms;
	}

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = roomListMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}
}
