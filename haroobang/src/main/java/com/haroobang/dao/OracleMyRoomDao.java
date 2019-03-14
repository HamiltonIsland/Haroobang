package com.haroobang.dao;

import java.util.List;

import com.haroobang.mapper.MyRoomMapper;
import com.haroobang.vo.ReservationVO;

public class OracleMyRoomDao implements MyRoomDao {

	private MyRoomMapper myRoomMapper;
	

	public void setMyRoomMapper(MyRoomMapper myRoomMapper) {
		this.myRoomMapper = myRoomMapper;
	}



	@Override
	public List<ReservationVO> selectAllMyRoomReservation(int memberNo) {
		List<ReservationVO> myrooms = myRoomMapper.selectAllMyRoomReservation(memberNo);
		return myrooms;
	}

}
