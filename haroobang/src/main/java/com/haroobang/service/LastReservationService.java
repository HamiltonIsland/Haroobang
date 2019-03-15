package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface LastReservationService {


	ReservationVO findRoomByRoomNo(int roomNo, int memberNo, String startdate);

	List<ReservationVO> findMyLastReservationByPage(int memberNo, int from, int to);

	int findRoomCount(int memberNo);

}
