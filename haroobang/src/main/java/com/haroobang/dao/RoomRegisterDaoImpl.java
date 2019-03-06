package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomRegisterMapper;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("RoomRegisterDao")
public class RoomRegisterDaoImpl implements RoomRegisterDao{
	
	@Autowired
	@Qualifier("RoomRegisterMapper")
	private RoomRegisterMapper roomRegisterMapper;

	@Override
	public void roomRegisterDao(RoomVO vo) {
		roomRegisterMapper.roomRegister(vo);
		
	}

	@Override
	public void insertRoomAttachDao(RoomAttachVO attach) {
		roomRegisterMapper.roomAttach(attach);		
	}

	@Override
	public RoomVO roomListDao(int roomNo) {
		RoomVO list = roomRegisterMapper.roomList(roomNo);
		List<RoomAttachVO> roomAttachList = roomRegisterMapper.roomAttachList(roomNo); 
		list.setRoomAttachList(roomAttachList);
		return list;
	}

	

}
