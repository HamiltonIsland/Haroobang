package com.haroobang.service;

import java.util.ArrayList;
import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface CurrentReservationService {

	List<ReservationVO> findMyCurrentReservation(int memberNo);

	List<ReservationVO> findMyCurrentReservationByPage(int memberNo, int from, int to);

	int findMyCurrentCount(int memberNo);

	void refundCheck(ArrayList<Integer> refundCheck);

	RoomVO findRoomFinish(int roomNo);

	ReservationVO findreservation(int reservationNo);
}
