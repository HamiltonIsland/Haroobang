package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface CurrentReservationService {

	List<ReservationVO> findMyCurrentReservation(int memberNo);

	List<ReservationVO> findMyCurrentReservationByPage(int memberNo, int from, int to);

	int findMyCurrentCount(int memberNo);
}
