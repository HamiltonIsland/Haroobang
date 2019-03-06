package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.LastReservationMapper;
import com.haroobang.vo.RoomVO;

public class OracleLastReservationDao implements LastReservationDao {
	
	private LastReservationMapper lastReservationMapper;
	
	public void setLastReservationMapper(LastReservationMapper lastReservationMapper) {
		this.lastReservationMapper = lastReservationMapper;
	}

	public List<RoomVO> selectAllMyLastReservation(int memberNo) {
		List<RoomVO> myrooms = lastReservationMapper.selectAllMyLastReservation(memberNo);
		return myrooms;
	}

}
