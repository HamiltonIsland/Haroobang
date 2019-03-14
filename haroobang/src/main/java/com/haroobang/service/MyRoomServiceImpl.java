package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.MyRoomDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public class MyRoomServiceImpl implements MyRoomService{
	
	private MyRoomDao myRoomDao;
	public void setMyRoomDao(MyRoomDao myRoomDao) {
		this.myRoomDao = myRoomDao;
	}


	@Override
	public List<ReservationVO> findMyRoomReservation(int memberNo) {
		List<ReservationVO> myrooms = myRoomDao.selectAllMyRoomReservation(memberNo);

		return myrooms;
	}

}
