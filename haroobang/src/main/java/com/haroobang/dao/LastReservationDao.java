package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.RoomVO;

public interface LastReservationDao {

	List<RoomVO> selectAllMyLastReservation(int memberNo);

}
