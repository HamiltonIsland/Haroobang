package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.CurrentReservationMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

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

	@Override
	public int selectCurrentCount(int memberNo) {
		int count = currentReservationMapper.selectCurrentCount(memberNo);
		return count;
	}

	@Override
	public List<ReservationVO> selectCurrentRoomByPage(int memberNo, int from, int to) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberNo", memberNo);
		params.put("first", from);
		params.put("last", to);
		
		List<ReservationVO> currents = currentReservationMapper.selectCurrentRoomByPage(params);
		return currents;
	}

	@Override
	public void refundCheck(int refundNum) {
		currentReservationMapper.refundCheck(refundNum);
	}

	@Override
	public RoomVO selectRoomFinish(int roomNo) {
		RoomVO room = currentReservationMapper.selectRoomFinish(roomNo);
		return room;
	}

	@Override
	public ReservationVO selectReservation(int reservationNo) {
		ReservationVO reservation= currentReservationMapper.selectReservation(reservationNo);
		return reservation;
	}

	@Override
	public RoomAttachVO selectRoomAttach(int roomNo) {
		RoomAttachVO attachs = currentReservationMapper.selectRoomAttach(roomNo);
		return attachs;
	}

}
