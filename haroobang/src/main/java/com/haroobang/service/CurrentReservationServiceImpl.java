package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.CurrentReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

@Service("CurrentReservationService")
public class CurrentReservationServiceImpl implements CurrentReservationService{
	@Autowired
	@Qualifier("CurrentReservationDao")
	private CurrentReservationDao currentReservationDao;

	@Override
	public List<ReservationVO> findMyCurrentReservation(int memberNo) {
		List<ReservationVO> currents = currentReservationDao.selectAllCurrentReservations(memberNo);
		for(ReservationVO current : currents) {
			List<RoomAttachVO> attachments = currentReservationDao.selectRoomAttachByRoomNo(current.getRoomNo());
			current.setRoomAttachList(attachments);
		}
		return currents;
	}
}
