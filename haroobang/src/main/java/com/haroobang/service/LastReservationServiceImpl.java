package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public class LastReservationServiceImpl implements LastReservationService {

	private LastReservationDao lastReservationDao;// = new BoardDao();
	public void setLastReservationDao(LastReservationDao lastReservationDao) {
		this.lastReservationDao = lastReservationDao;
	}
	
	/*public List<ReservationVO> findMyLastReservation(int memberNo) {
		List<ReservationVO> myrooms = lastReservationDao.selectAllMyLastReservation(memberNo);
		for(ReservationVO myroom : myrooms) {
			List<RoomAttachVO> attachments = lastReservationDao.selectRoomAttachByRoomNo(myroom.getRoomNo());
			myroom.setRoomAttachList(attachments);
		}
		return myrooms;
	}*/


	@Override
	public ReservationVO findRoomByRoomNo(int roomNo, int memberNo, String startdate) {
		ReservationVO myroom = lastReservationDao.selectRoomByRoomNo(roomNo, memberNo, startdate);
		
		List<RoomAttachVO> attachments = lastReservationDao.selectRoomAttachByRoomNo(roomNo);
		myroom.setRoomAttachList(attachments);
		
		return myroom;
	}

	@Override
	public List<ReservationVO> findMyLastReservationByPage(int memberNo, int from, int to) {
		List<ReservationVO> myrooms = lastReservationDao.selectAllMyLastReservationByPage(memberNo,from,to);
		for(int i=0; i<myrooms.size(); i++) {
			List<RoomAttachVO> attachments = lastReservationDao.selectRoomAttachByRoomNo(myrooms.get(i).getRoomNo());
			myrooms.get(i).setRoomAttachList(attachments);
		}
		return myrooms;
	}

	@Override
	public int findRoomCount(int memberNo) {
		int count = lastReservationDao.selectRoomCount(memberNo);
		return count;
	}

	@Override
	public String findComment(int reservationNo) {
		String result = lastReservationDao.findComment(reservationNo);
		return result;
	}

}
