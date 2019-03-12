package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public class LastReservationServiceImpl implements LastReservationService {

	private LastReservationDao lastReservationDao;// = new BoardDao();
	public void setLastReservationDao(LastReservationDao lastReservationDao) {
		this.lastReservationDao = lastReservationDao;
	}
	
	@Override
	public List<ReservationVO> findMyLastReservation(int memberNo) {
		List<ReservationVO> myrooms = lastReservationDao.selectAllMyLastReservation(memberNo);
		return myrooms;
	}

	@Override
	public ReservationVO findRoomByRoomNo(int roomNo, int memberNo, String startdate) {
		ReservationVO myroom = lastReservationDao.selectRoomByRoomNo(roomNo, memberNo, startdate);
		return myroom;
	}

}
