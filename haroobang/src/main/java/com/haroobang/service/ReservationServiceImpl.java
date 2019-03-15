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

	@Override
	public List<ReservationVO> findAllReservationsByPage(int from, int to) {
		List<ReservationVO> reservations = reservationDao.selectReservationsByPage(from, to);
		
		for(int i=0; i<reservations.size(); i++) {
			List<RoomAttachVO> attachVos = reservationDao.selectRoomAttachByRoomNo(reservations.get(i).getRoomNo());
			reservations.get(i).setRoomAttachList(attachVos);
		}
		
		return reservations;
	}

	@Override
	public int findReserCount() {
		int count = reservationDao.selectReserCount();
		return count;
	}

}
//썅