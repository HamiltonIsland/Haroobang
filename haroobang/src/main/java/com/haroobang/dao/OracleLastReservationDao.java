package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.LastReservationMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public class OracleLastReservationDao implements LastReservationDao {
	
	private LastReservationMapper lastReservationMapper;
	
	public void setLastReservationMapper(LastReservationMapper lastReservationMapper) {
		this.lastReservationMapper = lastReservationMapper;
	}

	public List<ReservationVO> selectAllMyLastReservation(int memberNo) {
		List<ReservationVO> myrooms = lastReservationMapper.selectAllMyLastReservation(memberNo);
		return myrooms;
	}

//	@Override
//	public ReservationVO selectRoomByRoomNo(int roomNo) {
//		ReservationVO myroom = lastReservationMapper.selectRoomByRoomNo(roomNo);
//		return myroom;
//	}

}
