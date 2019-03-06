package com.haroobang.service;

import java.util.List;

import com.haroobang.dao.LastReservationDao;
import com.haroobang.vo.RoomVO;

public interface LastReservationService {

	List<RoomVO> findMyLastReservation(int memberNo);

}
