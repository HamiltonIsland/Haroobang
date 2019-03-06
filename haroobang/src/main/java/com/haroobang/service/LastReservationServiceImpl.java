package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.RoomVO;

public class LastReservationServiceImpl implements LastReservationService {

	private LastReservationDao lastReservationDao;// = new BoardDao();
	public void setLastReservationDao(LastReservationDao lastReservationDao) {
		this.lastReservationDao = lastReservationDao;
	}
	
	@Override
	public List<RoomVO> findMyLastReservation(int memberNo) {
		List<RoomVO> myrooms = lastReservationDao.selectAllMyLastReservation(memberNo);
		return myrooms;
	}

}
