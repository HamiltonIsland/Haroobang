package com.haroobang.service;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface ReservationService {

	List<ReservationVO> findAllReservations();

	List<ReservationVO> findAllReservationsByPage(int from, int to);

	int findReserCount();

}
//썅