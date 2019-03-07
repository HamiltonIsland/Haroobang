package com.haroobang.service;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface RoomDetailService {

	String addLike(int roomNo, int memberNo);

	RoomVO findRoomDetail(int roomNo);

	AccountVO findMember(int memberNo);

	void addRoomReservation(ReservationVO reservationVo);

}
