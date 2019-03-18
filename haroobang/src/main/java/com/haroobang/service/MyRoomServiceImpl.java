package com.haroobang.service;

import java.util.ArrayList;
import java.util.List;

import com.haroobang.dao.MyRoomDao;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public class MyRoomServiceImpl implements MyRoomService {

	private MyRoomDao myRoomDao;

	public void setMyRoomDao(MyRoomDao myRoomDao) {
		this.myRoomDao = myRoomDao;
	}

	@Override
	public List<ReservationVO> findAllMyReservations(int memberNo) {
		List<RoomVO> rooms = myRoomDao.selectAllMyRooms(memberNo);
		
		List<ReservationVO> myroomReservations = new ArrayList<ReservationVO>();

		for (RoomVO room : rooms) {
			List<ReservationVO> reservations = myRoomDao.reservationByMyRoom(room.getRoomNo());
			for(int i=0;i<reservations.size();i++) {
				List<RoomAttachVO> attachments = myRoomDao.selectAllMyRoomAttachByRoomNo(reservations.get(i).getRoomNo());
				reservations.get(i).setRoomAttachList(attachments);
			}
			myroomReservations.addAll(reservations);
			
		}

		return myroomReservations;
	}

	@Override
	public ReservationVO findReservationByRoomNo(int reservationNo) {
		ReservationVO reservation = myRoomDao.selectReservationByReservationNo(reservationNo);
		RoomVO roomDetail = myRoomDao.selectRoomDetailbyRoonNo(reservation.getRoomNo());
		AccountVO accountVO = myRoomDao.selectMemberByMemberNo(reservation.getMemberNo()); 
		reservation.setRoomVO(roomDetail);
		reservation.setAccountVO(accountVO);
	return reservation;
	}

	@Override
	public List<RoomVO> findWaitingListByPage(int memberNo, int from, int to) {
		List<RoomVO> waitings = myRoomDao.selectWaitingListByPage(memberNo, from, to);
		for(int i=0; i<waitings.size(); i++) {
			List<RoomAttachVO> attachVos = myRoomDao.selectRoomAttachByRoomNo(waitings.get(i).getRoomNo());
			waitings.get(i).setRoomAttachList(attachVos);
		}
		return waitings;
	}

	@Override
	public int findWaitingCount(int memberNo) {
		int count = myRoomDao.selectWaitingCount(memberNo);
		return count;
	}

	@Override
	public void deleteMyRoom(String roomNo) {
		myRoomDao.deleteMyRoom(roomNo);
	}

	@Override
	public String checkinApproval(int reservationNo) {
		String result = myRoomDao.checkinApproval(reservationNo);
		return result;
	}

	@Override
	public String calcelCheckin(int reservationNo) {
		String result = myRoomDao.calcelCheckin(reservationNo);
		return result;
	}


}
