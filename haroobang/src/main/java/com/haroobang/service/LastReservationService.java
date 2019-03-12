package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface LastReservationService {

	List<ReservationVO> findMyLastReservation(int memberNo);

	ReservationVO findRoomByRoomNo(int roomNo, int memberNo, String startdate);

}
