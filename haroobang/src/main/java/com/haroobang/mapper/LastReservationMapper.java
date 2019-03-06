package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.RoomVO;

public interface LastReservationMapper {

	List<RoomVO> selectAllMyLastReservation(int memberNo);
	
}
