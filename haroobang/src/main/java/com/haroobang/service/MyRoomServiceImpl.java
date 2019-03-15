package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.MyRoomDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public class MyRoomServiceImpl implements MyRoomService {

	private MyRoomDao myRoomDao;

	public void setMyRoomDao(MyRoomDao myRoomDao) {
		this.myRoomDao = myRoomDao;
	}

	@Override
	public List<RoomVO> findAllMyRooms(int memberNo) {
		List<RoomVO> rooms = myRoomDao.selectAllMyRooms(memberNo);

		for (RoomVO room : rooms) {
			List<RoomAttachVO> attachments = myRoomDao.selectAllMyRoomAttachByRoomNo(room.getRoomNo());
			room.setRoomAttachList(attachments);
		}

		return rooms;
	}

	@Override
	public List<ReservationVO> findReservationByRoomNo(int roomNo, int memberNo) {
		List<ReservationVO> myroom = myRoomDao.selectReservationByRoomNo(roomNo, memberNo);
		
//		List<RoomAttachVO> attachments = myRoomDao.selectRoomAttachByRoomNo(roomNo);
//		myroom.setRoomAttachList(attachments);
//		
		return myroom;
	}

//	@Override
//	public List<ReservationVO> findMyRoomReservation(int memberNo) {
//		List<ReservationVO> myrooms = myRoomDao.selectAllMyRoomReservation(memberNo);
//
//		return myrooms;
//	}
//
//
//	@Override
//	public List<Integer> findMyRoomNo(int memberNo) {
//		List<Integer> myroomNo = myRoomDao.selectAllMyRoomNo(memberNo);
//		
//		return myroomNo;
//	}

}
