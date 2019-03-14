package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface MyRoomDao {

	List<ReservationVO> selectAllMyRoomReservation(int memberNo);


}
