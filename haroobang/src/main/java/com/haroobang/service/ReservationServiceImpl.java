package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.ReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

@Service("ReservationService")
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	@Qualifier("ReservationDao")
	private ReservationDao reservationDao;

	@Override
	public List<ReservationVO> findAllReservations() {
		List<ReservationVO> reservations = reservationDao.selectAllReservations();
		for(ReservationVO reservation : reservations) {
			List<RoomAttachVO> attachments = reservationDao.selectRoomAttachByRoomNo(reservation.getRoomNo());
			reservation.setRoomAttachList(attachments);
		}
		return reservations;
	}

}
//썅