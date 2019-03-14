package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface MyRoomService {

	List<ReservationVO> findMyRoomReservation(int memberNo);

}
