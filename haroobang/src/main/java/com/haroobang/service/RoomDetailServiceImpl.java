package com.haroobang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomDetailDao;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

@Service("roomDetailService")
public class RoomDetailServiceImpl implements RoomDetailService {

	@Autowired
	@Qualifier("RoomDetailDao")
	private RoomDetailDao roomDetailDao;

	@Override
	public String addLike(int roomNo, int memberNo) {
		
		String result =roomDetailDao.addLike(roomNo, memberNo);
		return result;
		
	}

	@Override
	public RoomVO findRoomDetail(int roomNo) {
		RoomVO room = roomDetailDao.findRoomDetail(roomNo);
		return room;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = roomDetailDao.findMember(memberNo);
		return member;
	}

	@Override
	public void addRoomReservation(ReservationVO reservationVo) {
		roomDetailDao.addRoomReservation(reservationVo);
		
	}

}
