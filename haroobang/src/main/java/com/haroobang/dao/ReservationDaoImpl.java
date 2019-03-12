package com.haroobang.dao;

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
}
