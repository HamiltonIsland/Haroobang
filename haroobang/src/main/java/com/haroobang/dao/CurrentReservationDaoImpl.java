package com.haroobang.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.CurrentReservationMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

@Repository("CurrentReservationDao")
public class CurrentReservationDaoImpl implements CurrentReservationDao{
	@Autowired
	@Qualifier("CurrentReservationMapper")
	private CurrentReservationMapper currentReservationMapper;

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = currentReservationMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}

	@Override
	public List<ReservationVO> selectAllCurrentReservations(int memberNo) {
		List<ReservationVO> currents = currentReservationMapper.selectAllCurrentReservations(memberNo);
		return currents;
	}

}
