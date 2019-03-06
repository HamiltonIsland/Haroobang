package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomDetailMapper;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("RoomDetailDao")
public class RoomDetailDaoImpl implements RoomDetailDao{

	@Autowired
	@Qualifier("RoomDetailMapper")
	private RoomDetailMapper roomDetailMapper;
	
	@Override
	public String addLike(int roomNo, int memberNo) {
		
		String result = "success";
		try {
			HashMap<String,Object> params = new HashMap<String, Object>();
			
			params.put("roomNo", roomNo);
			params.put("memberNo", memberNo);
			roomDetailMapper.addLike(params);
		} catch (Exception e) {
			result = "fail";
		}
		return result;
		
		
	}

	@Override
	public RoomVO findRoomDetail(int roomNo) {
		
		RoomVO room = roomDetailMapper.findRoomDetail(roomNo);
		List<RoomAttachVO> roomAttachList = roomDetailMapper.findRoomAttach(roomNo);
		room.setRoomAttachList(roomAttachList);
		
		return room;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = roomDetailMapper.findMemberId(memberNo);
		return member;
	}

}
