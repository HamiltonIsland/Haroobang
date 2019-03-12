package com.haroobang.dao;

import java.util.HashMap;
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

	@Override
	public ReservationVO selectRoomByRoomNo(int roomNo, int memberNo, String startdate) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("roomNo", roomNo);
		params.put("memberNo", memberNo);
		params.put("startDate", startdate);
		ReservationVO myroom = lastReservationMapper.selectRoomByRoomNo(params);
		return myroom;
	}

}
