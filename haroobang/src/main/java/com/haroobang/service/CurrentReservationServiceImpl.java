package com.haroobang.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.CurrentReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

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

	@Override
	public List<ReservationVO> findMyCurrentReservationByPage(int memberNo, int from, int to) {
		List<ReservationVO> currents = currentReservationDao.selectCurrentRoomByPage(memberNo, from, to);
		for(int i=0; i<currents.size(); i++) {
			List<RoomAttachVO> attachVos = currentReservationDao.selectRoomAttachByRoomNo(currents.get(i).getRoomNo());
			currents.get(i).setRoomAttachList(attachVos);
		}
		return currents;
	}

	@Override
	public int findMyCurrentCount(int memberNo) {
		int count = currentReservationDao.selectCurrentCount(memberNo);
		return count;
	}

	@Override
	public void refundCheck(ArrayList<Integer> refundArray) {
		for(int i = 0; i < refundArray.size(); i++) {
			int refundNum = refundArray.get(i);
			currentReservationDao.refundCheck(refundNum);
		}
		
	}
}
