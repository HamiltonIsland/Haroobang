package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.ReservationMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

@Repository("ReservationDao")
public class ReservationDaoImpl implements ReservationDao{
	
	@Autowired
	@Qualifier("ReservationMapper")
	private ReservationMapper reservationMapper;

	@Override
	public List<ReservationVO> selectAllReservations() {
		List<ReservationVO> reservations = reservationMapper.selectAllReservations();
		return reservations;
	}

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = reservationMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}

	@Override
	public List<ReservationVO> selectReservationsByPage(int from, int to) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("first", from);
		params.put("last", to);
		
		List<ReservationVO> reservations = reservationMapper.selectReservationsByPage(params);
		return reservations;
	}

	@Override
	public int selectReserCount() {
		int count = reservationMapper.selectReserCount();
		return count;
	}
}
//썅